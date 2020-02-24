var operation, limit,  __limited_DATA, __DATA;



var workerResult = {};
var data, query ;





        onmessage = async function(e) {

        
                operation = e.data._operation
                limit = e.data._limit
                console.log('operation, e. ', e,  operation, limit);


                switch(operation) {



                  case 'fetch':  
                
                    

                            var params = e.data._data;
                            var params_converted=[];
                            var ___url = e.data._url;
                            var _querystring;


                          // console.log('Worker: Message received from main script', e);
                          // console.log('Worker: data : rawwwwwwww ', params);

                          
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
                                  
                                  
                                // console.log(_string);

                                  data = JSON.parse(_string);


                              //  console.log("data---", data);
                                                                      
                                  query = JSON.parse(data.QUERY);


                              //   console.log("query=====", query);
                                                                      
                                if(data.RESULT != "Success") {
                                                                            
                                                                            
                                    postMessage({error:'coldfusion error'});


                                } else {

                                        if (query.DATA) {
                                            __DATA = query.DATA                                     
                                                                                                        
                                            //var _columns = query.COLUMNS
                                            //console.log(' _columns ..... ',  _columns)
                                                                            
                                            //var _data = query.DATA
                                          // console.log(' _data .....>>>> ',  _data)

                                          
                                            if (limit == -1){

                                                     // load all items

                                                      workerResult = {have_more: false, COLUMNS: query.COLUMNS, DATA: query.DATA}
                                                           
                        
                      

                                            } else {

                                                    // only load limit number of items

                                                        __limited_DATA = [];

                                                                                      
                                                        for (let w = 0; w < limit; w++) {
                                                            
                                                            __limited_DATA.push(__DATA[w])

                                                        }

                                                   
                                                        this.console.log(' __limited_DATA : ', __limited_DATA)

                                                        workerResult = {have_more: true, COLUMNS: query.COLUMNS, DATA: __limited_DATA}      

                                            }



                                            

                                                                        
                                            postMessage(workerResult);

                                        } else {

                                            postMessage({error:'query.DATA is empty'});

                                        }

                                }

                            
                            } catch (error) {
                                                                console.error('Error:', error);
                                                                postMessage(error);
                            }



                      break;



                  
                    case 'load_more':
                      
                        workerResult = {have_more: false, COLUMNS: query.COLUMNS, DATA: query.DATA}
                        postMessage(workerResult);
                    
                    break;




                    default:
                      // code block


                            } // switch

        }// onmessage