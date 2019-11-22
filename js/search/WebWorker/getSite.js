  


  onmessage = async function(e) {

                var params = e.data._data;
                var params_converted=[];
                var ___url = e.data._url;
                var _querystring;


               console.log('Worker: Message received from main script', e);
               console.log('Worker: data : rawwwwwwww ', params);

              
              // _querysting can NOT be object or array {}, [],
              // instead it should be string :   key=value&key=value.....

              // must first convert to this format
             // var params = {lat:35.696233, long:139.570431} // or:
             // var params = [['lat', '35.696233'], ['long', '139.570431']]

              
              for (let i = 0; i < params.length; i++) {
                
                params_converted.push(  [   params[i].name ,    params[i].value      ])
              }



            

              _querystring = new URLSearchParams(params_converted).toString();


               console.log('Worker: data : after convert to key=value : ', _querystring);
               console.log('Worker: url : ', ___url);
               
               
                
                try {
                        let response = await fetch(___url, {
                                                                method: 'POST', // or 'PUT'
                                                                body: _querystring, // data can be `string` or {object}!
                                                                headers: {


                                                                   
                                                                    // jquery is not available in web worker, because jquery need access DOM. 
                                                                    // Web worker no access to DOM.

                                                                    // if you want to use fetch to match $.ajax ({ data: frm})
                                                                    // data have special process as below:

                                                                    //https://api.jquery.com/jquery.ajax/
                                                                   //processData (default: true)
                                                                    //Type: Boolean
                                                                    //By default, data passed in to the data option as an object (technically, anything other than a string) 
                                                                    //will be processed and transformed into a query string, fitting to the default content-type "application/x-www-form-urlencoded".
                                                                    // If you want to send a DOMDocument, or other non-processed data, set this option to false.

                                                                    // so you must set content-type as : 
                                                                    'Content-Type': 'application/x-www-form-urlencoded'

                                                                     
                                                                     // 'Content-Type': 'application/json'
                                                                }
                                                            });


                     //response.replace(/^\s+|\s+$/g,"");
                      var  _json = await response.json()  //  JSON.parse(response);

                      var _string = JSON.stringify(_json)
                     
                      _string =_string.replace(/^\s+|\s+$/g,"");
                      
                      
                      console.log(_string);

                      var data = JSON.parse(_string);


                     console.log("data---", data);
                                                           
                                                            var workerResult = JSON.parse(data.QUERY);


                                                          console.log("workerResult=====", workerResult);
                                                           
                                                            if(data.RESULT != "Success") {
                                                                
                                                                
                                                                postMessage({error:'coldfusion error'});


                                                            } else {

                                                            
                                                                    postMessage(workerResult);

                                                            }



                
                } catch (error) {
                                                    console.error('Error:', error);
                                                    postMessage(error);
                }







				





                } // onmessage