var app

var _timeout = 100000;  // 100 second

var site_no = 0;




// material tab
var elem, options ,init_tabs ,instance_tabs,
     elem_nested, options_nested ,init_tabs_nested ,instance_tabs_nested;




  function fetch_data(){
				
				
				
				               $("#preloader").show();
				               $("#message").hide(); 
				               $("#tip").hide(); 
							   
							   
							   
				
				       		   var frm = $('#form1').serializeArray();
						
						
						       console.log('frm -->', frm)
						
						
							   try{		
									
											$.ajax({
												   
													  timeout:_timeout,
													  type: "POST",
													  url: url + "cfc/sw.cfc?method=searchSites&callback=",
													  data: frm,
													  
													  
													   error: function (jqXHR, textStatus, errorThrown) {
																												   // ajax failed
																										  var _error_status = textStatus + ' : ' + errorThrown         
																										 console.log('ajax error  + ', _error_status)
																										 
																										 $("#message").show();
																										 $("#message").html(errorThrown )
																										 
																										 
																									 },
													  
													  
													  
													  
													  success: function(data) { 
																						data = JSON.parse(trim(data));
																						//console.log("data---");
																						//console.log(data);
																						var query = JSON.parse(data.QUERY);
																						//console.log("query=====");
																						//console.log(query);
																						if(data.RESULT != "Success") {
																							
																							// handling error message
																							
																							//showMsg(data.RESULT,1);
																							return false;	
																						}
																						
																						
																						
																						
																						 var _columns = query.COLUMNS
																						 console.log(' _columns ..... ',  _columns)
																						 
																						 var _data = query.DATA
																						console.log(' _data .....>>>> ',  _data)
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						/*
																						
																						
																						
																							var sno; var ssfx; var sp; var sg; var sname; var saddr; var stype; var swo; var sid; var spid; var spry; var cd; var tc; var tcon; var eest; var ncurb; 
																							
																							
																							$.each(_columns, function(i, item) {
																														   
																														   
																													switch (item) {
																													case "ID": sid = i; break;
																													case "LOCATION_NO": sno = i; break;
																													case "LOCATION_SUFFIX": ssfx = i; break;
																													case "PACKAGE_NO": sp = i; break;
																													case "PACKAGE_GROUP": sg = i; break;
																													case "NAME": sname = i; break;
																													case "ADDRESS": saddr = i; break;
																													
																													<!--- joe hu --- 3/14/2018 --- add Days in queue --->
																													case "DAYS_IN_QUEUES": sdays = i; break;
																													
																													
																													case "CONSTRUCTION_START_DATE": scons = i; break;
																													case "CONSTRUCTION_COMPLETED_DATE": sconc = i; break;
																													case "PRIORITY_SCORE": spry = i; break;
																													case "SUBTYPE_DESC": stype = i; break;
																													case "WORK_ORDER": swo = i; break;
																													case "PACKAGE_ID": spid = i; break;
																													case "COUNCIL_DISTRICT": cd = i; break;
																													case "TOTAL_COST": tc = i; break;
																													case "TOTAL_CONCRETE": tcon = i; break;
																													case "ENGINEERS_ESTIMATE": eest = i; break;
																													
																													<!--- joe hu 2019-4 multi change --->
																													case "NUMBER_CURBRAMPS": ncurb = i; break;
																								
																								
																												    }// switch
																													
																													
																													
																								}); // each
																							
																							
																							
																							
																						
																						
																													console.log(sid);
																													console.log(sno);
																													console.log(ssfx);
																													console.log(sp);
																													console.log(sg);
																													console.log(sname);
																													console.log(saddr);
																													console.log(stype);
																													console.log(swo); 
																												
																												
																												
																												
																													data = data.DATA;
								
								
																													var items = [];
																							
																							
																							if (_data.length > 0) {
																								
																								
																								
																								
																								$.each(_data, function(i, item) {
																								
																									if (item[sno] == null) {item[sno] = "";}
																									if (item[ssfx] == null) {item[ssfx] = "";}
																									if (item[sp] == null) {item[sp] = "";}
																									if (item[sg] == null) {item[sg] = "";}
																									if (item[sname] == null) {item[sname] = "";}
																									if (item[saddr] == null) {item[saddr] = "";}
																									
																									
																									if (item[sdays] == null) {item[sdays] = "";}
																									
																									
																									if (item[scons] == null) {item[scons] = "";}
																									if (item[sconc] == null) {item[sconc] = "";}
																									if (item[stype] == null) {item[stype] = "";}
																									if (item[spry] == null) {item[spry] = "";}
																									if (item[swo] == null) {item[swo] = "";}
																									if (item[spid] == null) {item[spid] = 0;}
																									if (item[cd] == null) {item[cd] = "";}
																									if (item[tc] == null) {item[tc] = 0;}
																									if (item[tcon] == null) {item[tcon] = 0;}
																									if (item[eest] == null) {item[eest] = 0;}
																									
																									
																									if (item[ncurb] == null) {item[ncurb] = 0;}
																									
																									
																									if (item[scons] != "") {
																										var d = new Date(item[scons]);
																										var mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
																										var dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
																										item[scons] = mm + '/' + dd + '/' + d.getFullYear();	
																									}
																									
																									if (item[sconc] != "") {
																										var d = new Date(item[sconc]);
																										var mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
																										var dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
																										item[sconc] = mm + '/' + dd + '/' + d.getFullYear();
																									}
																									
																									
																									var pkg = item[sg] + item[sp]; if (pkg != "") { pkg = item[sg] + " - " + item[sp]; }
																									
																									
																									
																						
																									items.push("<tr>");
																									items.push("<td style='width:29px;height:20px;' class='small center frm'><a href='' onclick='goToSite(" + item[sid] + "," + item[spid] + ");return false;'><img src='../Images/rep.gif' width='13' height='16' alt='Edit Package' title='Edit Package' style='position:relative;top:-1px;'></a></td>");
																									items.push("<td style='width:34px;' class='small center frm'>" + item[sno] + item[ssfx]  + "</td>");
																									items.push("<td style='width:24px;' class='small center frm'>" + item[cd] + "</td>");
																									items.push("<td style='width:49px;' class='small center frm'>" + pkg + "</td>");
																									items.push("<td style='padding:2px 0px 0px 5px;width:346px;' class='small frm'>" + item[sname] + "</td>");
																									items.push("<td style='padding:2px 0px 0px 5px;' class='small frm'>" + item[saddr] + "</td>");
																									
																									
																									items.push("<td style='width:79px;' class='small center frm'>" + item[sdays] + "</td>");
																									
																									
																									items.push("<td style='width:69px;' class='small center frm'>" + item[scons] + "</td>");
																									items.push("<td style='width:84px;' class='small center frm'>" + item[sconc] + "</td>");
																									items.push("<td style='width:39px;' class='small center frm'>" + item[spry] + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>$" + item[eest].formatMoney(2) + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>$" + item[tc].formatMoney(2) + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>" + item[tcon].toFixed(2).replace('.00','') + "</td>");
																									items.push("<td style='width:79px;' class='small center frm'>" + item[stype] + "</td>");
																									
																									
																									
																									items.push("<td style='width:66px;' class='small center frm'>" + item[ncurb] + "</td>");
																									
																									
																									
																									items.push("</tr>");
																								
																								}); // each
																								
																								
																								
																								
																								
																								
																								
																								
																								
																								
																							} else {
																								         items.push("<td style='height:20px;' class='small center frm'>No Records Found</td>");
																							        }// if 
																							
																							items.push("</table>");
																							items.push("</td></tr>");
																							items.push("</table>");
																						
																						
																						
																						
																						
																						   $("#sample").html(items);
																						   
																						   
																						   
																						   
																						   */
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						var _table =  $('#data_table').DataTable( {
																													
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
																									
																									
																									
																									
																									
																								} );
																						
																						   
																						   
																						   
																						   
																						
																						 $("#preloader").hide();
																						 $("#tip").show(); 
																					  }// success
																					  
																					  
													  })// ajax 
									
									
									
									
									
							   } catch (error) {
								   
								   // handling error message
									  console.log('ajax error .....', error)
									  
									  $("#preloader").hide();
									  
									   $("#message").show();
									   $("#message").html(error )
																										 
								   
							   }
				
				
					
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




          
				function materialize_init_tab(){
					// init all component
					 // M.AutoInit();
	
	
					  // init materialize tab
					   //elem = $('.tabs')
					   elem = $('#site_top')


					  // bug, swipeable let height 50% shorter 
					  //var options = {swipeable: true, duration: 300}
					   options = {duration: 600, onShow: new_tab_show_callback}
					   init_tabs = M.Tabs.init(elem, options);
					   instance_tabs = M.Tabs.getInstance(elem);
	
	
	


						// nest tab only init materialize tab
						elem_nested = $('#tree_nested')
							
						// bug, swipeable let height 50% shorter 
						//var options = {swipeable: true, duration: 300}
						options_nested = {duration: 600, onShow: new_tab_show_callback_nested}
						init_tabs_nested = M.Tabs.init(elem_nested, options_nested);
						instance_tabs_nested = M.Tabs.getInstance(elem_nested);








	
	
	
					  // add tooltip
					  $('.tooltipped').tooltip();
					
					
					
					// tooltip without jquery
					/*
						  document.addEventListener('DOMContentLoaded', function() {
							var tooltip_elems = document.querySelectorAll('.tooltipped');
							var __tooltip_options = {enterDelay:0,inDuration:0, outDuration:0 }
							var instances = M.Tooltip.init(tooltip_elems, __tooltip_options);
						  });
					*/
	
						}




				function new_tab_show_callback (){
									
					
									
					


				

					console.log('showing tab +++++ 1 +++++  ' + instance_tabs.index)
					
					// 
					if (instance_tabs.index == 1){
							
						   // fix bug, tree tab indicator not show correct when first click tree tab.
						   // tempary fix by pre-select first tab

						   
                            
						             
					
						}// if




                    
						// ----------------- fix bug : Nested tabs indicator not initializing properly -----------------
								//https://github.com/Dogfalo/materialize/issues/4837
								/*
								$("ul.tabs").tabs({
									onShow: function(tab) {
									$("#tree_nested").tabs();
									}
								});
								*/

								$("#tree_nested").tabs();
						//----------------- end ------- fix bug : Nested tabs indicator not initializing properly -----------------
						




		        }



				
				function new_tab_show_callback_nested (){
					

					console.log('showing tab nested 2222222 ' + instance_tabs_nested.index)
					
					// 
					if (instance_tabs_nested.index == 1){
							
						   // fix bug, tree tab indicator not show correct when first click tree tab.
						   // tempary fix by pre-select first tab

						   
                            
						             
					
						}// if



		        }

				


		
				function parse_url_get_parameters(){
			
			
						//  .......... global var ..............
						
						
							// https://developer.mozilla.org/en-US/docs/Web/API/Location
						
								current_url = window.location.protocol + "//" + window.location.host + window.location.pathname;
						
								console.log('current_url ...... ',current_url);
								
								current_pathname = window.location.pathname;       //    /json2tree/arcgisServerList.html
								current_pathArray = current_pathname.split('/');   //    ["", "json2tree", "arcgisServerList.html"]
								
								
										// ----- parse url param ?url=xxxxxxxxxx  --------
					
												urlParams = new URLSearchParams(window.location.search);
					
												
												
												
												
												
												//.................. required parameter .................
														site_no = urlParams.get('sid'); // required
					
												//.................. required parameter .................
												
						
						}
			





		






// starting point of this page scripting
$(document).ready(function(){
						   
						  
	    materialize_init_tab()




	    //header navigation menu bar,  active - site -tab
		$("#site_tab").addClass("active");
		
		
		
		


		parse_url_get_parameters()

		console.log(' site_no is ',  site_no)
		
		//site_no = 'Site ' + site_no 
		 
		$("#main_tab_title").text(site_no);
		$("#site_number").text(site_no);
		$("#package_number").text('	BOE - 6 ');


        // instance_tabs.select('main');

/*
		app = new Vue({
			el: '#app',
			data: {
			  site_number: site_no
			}
		  })

*/
	
	  //  init_web_component();
	
	



	    
		
		
	//	fetch_data();
   
	
	
	
	
	
 



  
  
			
		});






		
		new Vue({
			el: '#app',
			vuetify: new Vuetify(),
		  })

