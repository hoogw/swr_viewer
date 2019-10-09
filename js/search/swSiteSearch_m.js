var _timeout = 5000;  // 5 second






                function fetch_data(){
				
				
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
																						
																						
																						
																						
																						
																							var sno; var ssfx; var sp; var sg; var sname; var saddr; var stype; var swo; var sid; var spid; var spry; var cd; var tc; var tcon; var eest; var ncurb; 
																							
																							
																							$.each(query.COLUMNS, function(i, item) {
																														   
																														   
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
																							
																							
																							if (query.DATA.length > 0) {
																								
																								
																								
																								
																								$.each(query.DATA, function(i, item) {
																								
																									if (item[sno] == null) {item[sno] = "";}
																									if (item[ssfx] == null) {item[ssfx] = "";}
																									if (item[sp] == null) {item[sp] = "";}
																									if (item[sg] == null) {item[sg] = "";}
																									if (item[sname] == null) {item[sname] = "";}
																									if (item[saddr] == null) {item[saddr] = "";}
																									
																									<!--- joe hu --- 3/14/2018 --- add Days in queue --->
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
																									
																									<!--- joe hu 2019-4 multi change --->
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
																									
																									<!--- joe hu --- 3/14/2018 --- add Days in queue --->
																									items.push("<td style='width:79px;' class='small center frm'>" + item[sdays] + "</td>");
																									
																									
																									items.push("<td style='width:69px;' class='small center frm'>" + item[scons] + "</td>");
																									items.push("<td style='width:84px;' class='small center frm'>" + item[sconc] + "</td>");
																									items.push("<td style='width:39px;' class='small center frm'>" + item[spry] + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>$" + item[eest].formatMoney(2) + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>$" + item[tc].formatMoney(2) + "</td>");
																									items.push("<td style='width:74px;' class='small center frm'>" + item[tcon].toFixed(2).replace('.00','') + "</td>");
																									items.push("<td style='width:79px;' class='small center frm'>" + item[stype] + "</td>");
																									
																									
																									<!--- joe hu 2019-4 multi change --->
																									items.push("<td style='width:66px;' class='small center frm'>" + item[ncurb] + "</td>");
																									
																									
																									<!---items.push("<td style='width:64px;' class='small center frm'>" + item[swo] + "</td>");  --->
																									items.push("</tr>");
																								
																								}); // each
																								
																								
																								
																								
																								
																								
																								
																								
																								
																								
																							} else {
																								         items.push("<td style='height:20px;' class='small center frm'>No Records Found</td>");
																							        }// if 
																							
																							items.push("</table>");
																							items.push("</td></tr>");
																							items.push("</table>");
																						
																						
																						
																						
																						
																						   $("#sample").html(items);
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						   
																						   //
																						    $('#data_table').DataTable( {
																													
																													
																													"paging":   false,
																													"ordering": false,
																													"info":     false,
																													
																													
																													
																															columnDefs: [
																																{
																																	targets: [ 0, 1, 2 ],
																																	className: 'mdl-data-table__cell--non-numeric'
																																}
																															]
																														} );
																						   
																						   
																						   
																						   
																						   
																						
																						
																					  }// success
													  })// ajax 
									
									
									
									
									
							   } catch (error) {
								   
								   // handling error message
									  console.log('ajax error .....', error)
								   
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
					
					
					
					// init all dropdown select field
					 $('select').formSelect();
					
					
					
					
					$('.collapsible').collapsible();
					
					
					
					// init all date input field
					$('.datepicker').datepicker({format:'mm/dd/yyyy'});
					
					
				}

















// starting point of this page scripting
$(document).ready(function(){
						   
						   
	
	
	    init_web_component();
	
	
	    
		
		
		fetch_data();
   
	
	
	
	
	
  });