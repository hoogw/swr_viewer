//  ****  Without web worker, slow, freeze, no response for 6.1 second ****
// performance score is 50, 
// First Meaningful Paint 5.5s

// ajax, cost 1500+ ms, 
// render 4005 item cost 3000+ ms, this process will freeze browser UI component for 5000+ ms, 




// To solve this performance issue, must use web worker un-freeze UI maint thread.
// first time load only 12 items, for fast data-table rendering,
// then continue load whole 4005 item, so user will not feel any browser freeze no-response, all happen behind the scene.



//  ****  With web worker, faster, not feels freeze  ****
// performance score is 71, 
// First Meaningful Paint 3.0s



var _timeout = 100000;  // 100 second

var _table;





                function fetch_data(){
				
				
				
				               $("#preloader").show();
				               $("#message").hide(); 
				               $("#tip").hide(); 
							   
							   
							   
				
				       		      let _frm = $('#form1').serializeArray();
						
								  let _url = url + "cfc/sw.cfc?method=searchSites&callback=";
						
							   console.log('frm -->', _frm)
							   


						
						
							   if (window.Worker){ 

                                           // this can be a relative path or a complete URL,
											// it must be on the same origin
											const workerScriptPath = '../js/search/WebWorker/getSite.js';



											// create a new worker from our script
											let worker = new Worker(workerScriptPath);




                                             // post a message to the worker
											worker.postMessage({ _operation:'fetch', _limit: 12 , _url: _url, _data: _frm });




											// wait for a message and log it's data
											// worker.onmessage = (e) => console.log(e.data);
											worker.onmessage = function(e) {


															console.log('Message received from worker -- e -- ', e);

																
															if (e.data.DATA){			

																
																// _data = [[0],[1],[2]... [4005]]  
																_data = e.data.DATA
																_columns = e.data.COLUMNS
																
																

																// fix bug, you must destroy old data table, before create a new one.
																if (_table) {
																		_table.destroy();
																}
																	


																 _table =  $('#data_table').DataTable( {
																											
																														//  show info on top,    https://datatables.net/examples/basic_init/dom.html
																													//   "dom": '<"top"i>rt<"bottom"flp><"clear">',	
																											
																													// "dom": 'lrtip',  //hide search box without disabling filtering feature   
																																		//https://stackoverflow.com/questions/53885245/jquery-datatables-hide-search-bar/53885264
																																		
																																						
																																		
																																		
																												"paging":   true,
																												//	"paging":   false,
																												
																												
																												
																												
																												// fix bug , must be here, with out this , extra word "show entries" annoying. 
																												"lengthChange": false,
																												//"lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
																												
																												
																												
																												
																												
																												
																												
																												// default is 10
																												"pageLength": 10,
																												
																												
																												
																												
																												//	"ordering": false,
																												
																												// default is true,  sample: 'Showing 1 to 10 of 4,005 entries'
																													"info":     true,  
																											
																											
																											
																												data: _data,
																												
																												
																												columns: [
																													{ title: "ID"                             },
																													{ title: "Site"                    },                // { title: "LOCATION_NO"                    },
																													{ title: "LOCATION_SUFFIX"                },
																													{ title: "NAME"                           },
																													{ title: "Address"                        },
																													{ title: "SUBTYPE_DESC"                   },
																													{ title: "SUBTYPE_DESCRIPTION"            },
																													{ title: "TYPE_DESC"                      }, //{ title: "TYPE_DESC"                      },
																													{ title: "CD"               },                  //{ title: "COUNCIL_DISTRICT"               },
																													{ title: "ZIP_CODE"                       },                                          
																													{ title: "FIELD_ASSESSED"                 },
																													{ title: "REPAIRS_REQUIRED"               },
																													{ title: "ASSESSED_DATE"                  },
																													{ title: "QC_DATE"                        },
																													{ title: "NOTES"                          },
																													{ title: "LOCATION_DESCRIPTION"           },
																													{ title: "DAMAGE_DESCRIPTION"             },
																													{ title: "Con. Start"        }, //{ title: "CONSTRUCTION_START_DATE"        },
																													{ title: "Con. Complete"    }, //{ title: "CONSTRUCTION_COMPLETED_DATE"    },
																													{ title: "ANTICIPATED_COMPLETION_DATE"    },
																													{ title: "Days in"                 },//{ title: "DAYS_IN_QUEUES"                 },
																													{ title: "PACKAGE_NO"                     },
																													{ title: "Package"                  }, //{ title: "PACKAGE_GROUP"                  },
																													{ title: "PACKAGED_DATE"                  },
																													{ title: "WORK_ORDER"                     },
																													{ title: "PACKAGE_ID"                     },
																													{ title: "TYPE"                           },
																													{ title: "REMOVED"                        },
																													{ title: "SEVERITY_INDEX"                 },
																													{ title: "Priority"                 }, //{ title: "PRIORITY_SCORE"                 },
																													{ title: "CURB_RAMP_ONLY"                 },
																													{ title: "Curb Ramps"               }, //{ title: "NUMBER_CURBRAMPS"               },
																													{ title: "CLASSIFICATION"                 },
																													{ title: "PACKAGE"                        },
																													{ title: "Total Concrete"                 },  //{ title: "TOTAL_CONCRETE"                 },
																													{ title: "TREE_REMOVAL_NOTES"             },
																													{ title: "HAS_BEFORE"                     },
																													{ title: "HAS_AFTER"                      },
																													{ title: "Total Cost"                     }, //{ title: "TOTAL_COST"                     },
																													{ title: "Eng. Estimate"             }, //{ title: "ENGINEERS_ESTIMATE"             },
																													{ title: "HAS_CERTIFICATE"                },
																													{ title: "CERTIFICATE_TOTAL"              },
																													{ title: "GRIEVANCE"                      },
																													{ title: "SPECIALFUND"                    },
																													{ title: "LOCKED"                         },
																													{ title: "HAS_PRESERVED_TREES"            },
																													{ title: "HAS_REMOVED_TREES"              },
																													{ title: "HAS_PLANTED_TREES"              }
																												], 
																												
																												
																													"columnDefs": [
																																	{
																																		"targets": [ 0 ],
																																		
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	{
																																		"targets": [ 1 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	{
																																		"targets": [ 2 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 3 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	{
																																		"targets": [ 4 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	{
																																		"targets": [5 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 6 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	
																																	{
																																		"targets": [ 7 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	{
																																		"targets": [ 8 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	{
																																		"targets": [ 9 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 10 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 11 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 12 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 13 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 14 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 15 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 16 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	{
																																		"targets": [ 17 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		// datatable-datetime-plugin not working, always return invalid date
																																		// render: $.fn.dataTable.render.moment( 'MMMM, dd yyyy hh:mm:ss', 'd', 'en' ),
																																		//https://datatables.net/forums/discussion/40040/datetime-plugin
																																		// instead use this
																																		render: function (data) { if (moment(data).isValid()) return moment(data).format("MM/DD/YYYY"); else { return ""; } },
																																		
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	{
																																		"targets": [ 18 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		// datatable-datetime-plugin not working, always return invalid date
																																		// render: $.fn.dataTable.render.moment( 'MMMM, dd yyyy hh:mm:ss', 'd', 'en' ),
																																		//https://datatables.net/forums/discussion/40040/datetime-plugin
																																		// instead use this
																																		render: function (data) { if (moment(data).isValid()) return moment(data).format("MM/DD/YYYY"); else { return ""; } },
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 19 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	{
																																		"targets": [ 20 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	{
																																		"targets": [ 21 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 22 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	{
																																		"targets": [ 23 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 24],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 25 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 26 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 27 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 28 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	{
																																		"targets": [ 29 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 30 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	
																																	{
																																		"targets": [ 31],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 32 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 33 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 34 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true
																																	},
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 35 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 36 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 37 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	
																		
																		
																		
																																	
																																	
																																	
																																	
																																	{
																																		"targets": [ 38 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true,
																																		"render": $.fn.dataTable.render.number( ',', '.', 2, '$' )
																																		// add dollar sign  https://datatables.net/forums/discussion/23496/add-dollar-sign-and-two-decimal-places-to-an-entire-column
																																	},
																																	{
																																		"targets": [ 39 ],
																																		"className": 'mdl-data-table__cell--non-numeric',
																																		"visible": true,
																																		"searchable": true,
																																		"render": $.fn.dataTable.render.number( ',', '.', 2, '$' )
																																	},
																																	
																																	
																																	{
																																		"targets": [ 40 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 41 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 42 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [  43],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [  44],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [  45],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 46 ],
																																		"visible": false,
																																		"searchable": false
																																	},
																																	{
																																		"targets": [ 47 ],
																																		"visible": false,
																																		"searchable": false
																																	}
																																	
																																]
																													
																													
																													
																													
																													
																													
																} );
																	
																	
																	
																	
																	
																	
																// click row event
																$('#data_table').on('click', 'tr', function () {
																						var data = _table.row( this ).data();
																						
																						// site number, location number data[1]
																						console.log('You clicked on site number : ', data[1] )
																						
																						var _site_url = url + 'forms/swSiteView.cfm?sid=' + data[1] 
																						console.log('_site_url : ', _site_url )


																						window.open(_site_url, '_blank');
																						
																						
																						
																} );
																
																	
																	
																	
																	
																		
																$("#preloader").hide();
																$("#tip").show(); 



                                                                // limit = -1, means whole dataset are loaded, no need to load more 
                                                                if (e.data.have_more) {
																		
																		worker.postMessage({ _operation:'load_more', _limit: -1  , _url: _url, _data: _frm });
																}



															} else {

					
																		$("#preloader").hide();
											
																		$("#message").show();
																		$("#message").html(error )
																												

															}// if


											} // worker onmessage






										} else {




											console.log('No worker support here, weird, it should be supported in IE10 and above 🧐')




										} // web worker
				
					 
				}
				
				
				
				
				
				
				
		  // --------------------------- helper function  ------------------------------------------		
				
				
				
				
				
               function trim(stringToTrim) {
												return stringToTrim.replace(/^\s+|\s+$/g,"");
											}








				Number.prototype.formatMoney = function(c, d, t){
				var n = this, 
					c = isNaN(c = Math.abs(c)) ? 2 : c, 
					d = d == undefined ? "." : d, 
					t = t == undefined ? "," : t, 
					s = n < 0 ? "-" : "", 
					i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
					j = (j = i.length) > 3 ? j % 3 : 0;
				   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
				 };




           // --------------------------- helper function  ------------------------------------------		
				


				function init_web_component(){
					
					
					 //To activate the dropdown menu on click, pass { hover: false } into the above dropdown() function					   
			           $(".dropdown-trigger").dropdown({ hover: true });	
					
					
					
					// init all dropdown select field
					 $('select').formSelect();
					
					
					
					
					$('.collapsible').collapsible();
					
					
					
					// init all date input field
					$('.datepicker').datepicker({format:'mm/dd/yyyy'});
					
					
				}

















// starting point of this page scripting
$(document).ready(function(){
						   
						   
	    // active - site -tab
		$("#site_tab").addClass("active");
		
		
		
		
	
	    init_web_component();
	
	
	    
		
		
		fetch_data();
   
	
	
	
	
	
  });