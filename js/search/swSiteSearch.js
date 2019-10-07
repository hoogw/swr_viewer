





var sort = {};

function changeHeight() {
	var ht = top.getIFrameHeight();
	var w = top.getIFrameWidth();
	ht = ht - 58;
	if ( $("#searchbox").is(":visible") ) { 
		ht = top.getIFrameHeight() - 333;
	}
	w = w - 14;
	$('#ss_results').height(ht);
	$('#ss_results').width(w);
	$('#ss_header').width(w);
	$('#fldWO').css('width',"82px");
	if ( $("#ss_results").height() > $("#tbl_results").height()) { $("#ss_results").height($("#tbl_results").height()); $('#fldWO').css('width',"65px");}
}

function sortTable(idx) {

	var dir = "ASC";
	if (idx == sort.id) {
		if(sort.dir == "ASC") { dir = "DESC"; } else { dir = "ASC"; }
	}

	switch (idx) {
	case 1: sort.id = idx; sort.dir = dir; sort.order = "location_no " + dir + ",location_suffix "  + dir; break;
	case 2: sort.id = idx; sort.dir = dir; sort.order = "package_group " + dir + ",package_no "  + dir; break;
	case 3: sort.id = idx; sort.dir = dir; sort.order = "rtrim(ltrim(name)) " + dir + ",location_no,location_suffix"; break;
	case 4: sort.id = idx; sort.dir = dir; sort.order = "address " + dir + ",name"; break;
	case 5: sort.id = idx; sort.dir = dir; sort.order = "construction_start_date " + dir + ",location_no,location_suffix"; break;
	case 6: sort.id = idx; sort.dir = dir; sort.order = "construction_completed_date " + dir + ",location_no,location_suffix"; break;
	case 7: sort.id = idx; sort.dir = dir; sort.order = "priority_score " + dir + ",location_no,location_suffix"; break;
	case 8: sort.id = idx; sort.dir = dir; sort.order = "subtype_desc " + dir + ",location_no,location_suffix"; break;
	case 9: sort.id = idx; sort.dir = dir; sort.order = "work_order " + dir + ",location_no,location_suffix"; break;
	case 10: sort.id = idx; sort.dir = dir; sort.order = "council_district " + dir + ",location_no,location_suffix"; break;
	case 11: sort.id = idx; sort.dir = dir; sort.order = "total_cost " + dir + ",location_no,location_suffix"; break;
	case 12: sort.id = idx; sort.dir = dir; sort.order = "total_concrete " + dir + ",location_no,location_suffix"; break;
	case 13: sort.id = idx; sort.dir = dir; sort.order = "engineers_estimate " + dir + ",location_no,location_suffix"; break;
	case 14: sort.id = idx; sort.dir = dir; sort.order = "Days_In_Queues " + dir + ",location_no,location_suffix"; break;
	
	
	<!--- joe hu 2019-4 multi change --->
	case 15: sort.id = idx; sort.dir = dir; sort.order = "number_curbramps " + dir + ",location_no,location_suffix"; break;
	
	
	
	
	default: sort.id = 1; sort.dir = "ASC"; sort.order = "";
	}
	submitForm();
}

function setForm() {
	if (typeof top.ssearch.length != "undefined") {
		//console.log(top.psearch);
		$.each(top.ssearch, function(i, item) {
			//console.log(item);
			$("#" + item.name ).val(item.value);
		});
		if (typeof top.ssearch.sort != "undefined") {
			sort = top.ssearch.sort;
		}
		submitForm();
	}
}

function submitForm() {

	var frm = $('#form1').serializeArray();
	
	if(sort.order != "" && (typeof sort.order != "undefined")) {
		frm.push({"name" : "ss_order", "value" : sort.order });
	}
	top.ssearch = frm;
	top.ssearch.sort = sort;
	//console.log(frm);
	//console.log(top.ssearch);
	
	<!--- joe hu  7/13/2018 ----- add progressing loading sign ------ (1) ---> 
	
	$(".overlay").show();
	
	<!--- End ----joe hu  7/13/2018 ----- add progressing loading sign ------ (1) --->
	
	
	
	$.ajax({
	  type: "POST",
	  url: url + "cfc/sw.cfc?method=searchSites&callback=",
	  data: frm,
	  success: function(data) { 
	  	data = jQuery.parseJSON(trim(data));
		//console.log("data---");
	  	//console.log(data);
		var query = jQuery.parseJSON(data.QUERY);
		//console.log("query=====");
		//console.log(query);
		if(data.RESULT != "Success") {
			showMsg(data.RESULT,1);
			return false;	
		}
		
		
		<!--- joe hu  7/17/2018 ----- add progressing loading sign ------ (2) --->
	    
	   
	    $(".overlay").hide();	
				
	   <!--- End ---- joe hu  7/17/2018 ----- add progressing loading sign ------ (2) --->
		
		
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
			
			
			}
		});
		
		/* console.log(sid);
		console.log(sno);
		console.log(ssfx);
		console.log(sp);
		console.log(sg);
		console.log(sname);
		console.log(saddr);
		console.log(stype);
		console.log(swo); */
		
		data = data.DATA;
		
		
		var items = [];
		items.push("<table id='tbl_results' border='0' cellpadding='0' cellspacing='0' style='height:25px;width:100%;border:0px red solid;'>");
		items.push("<tr><td cellspacing='0' cellpadding='0' border='0' bgcolor='white' bordercolor='white'>");
		items.push("<table align='center' bgcolor='white' cellspacing='2' cellpadding='2' border='0' style='width:100%;'>");
		
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
			
			});
		}
		else {
			items.push("<td style='height:20px;' class='small center frm'>No Records Found</td>");
		}
		
		items.push("</table>");
		items.push("</td></tr>");
		items.push("</table>");
		
		$("#ss_results").html(items.join(""));
		
		$("#ss_header").show();
		$("#ss_results").show();
		$("#dlExcel").css("visibility","visible");
		$("#dlPDF").css("visibility","visible");
		$("#ss_arrow").show();
		//changeHeight();
		
		$("#rcnt").html("Search Count: <strong>" + query.DATA.length + "</strong>");
		
	  }
	});
	
}

function showMsg(txt,cnt) {
	$('#msg_text').html(txt);
	$('#msg').height(35+cnt*14+30);
	$('#msg').css({top:'50%',left:'50%',margin:'-'+($('#msg').height() / 2)+'px 0 0 -'+($('#msg').width() / 2)+'px'});
	$('#msg').show();
}

function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}

function goToSite(sid,spid) {
	
	<!--- joe hu  7/13/2018 ----- add progressing loading sign ------ (1) ---> 
	
	$(".overlay").show();
	
	<!--- End ----joe hu  7/13/2018 ----- add progressing loading sign ------ (1) --->
	
	 
	location.replace(url + "forms/swSiteEdit.cfm?sid=" + sid + "&pid=" + spid + "&search=true");
}

$(window).resize(function() {
	//changeHeight();
});

$(function() {
	$(document).keyup(function (e) { 
		if (e.keyCode == 13) { submitForm(); }
	});
	
	
	
	
	
	    


<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
 
 
 
      
						  <!--- -------  category on change event -------------  --->
						  
									   var _current_subtype =  $("#ss_type").val();
									   console.log("_current_subtype --",_current_subtype)
									   
									   
									   
									   $('#ss_category').on('change', function() {
													
										console.log(" Category dropdown change to --",this.value)		  
													  
											
									  
											
									  var ___url = url + "cfc/sw.cfc?method=getSubTypeByCategory&returnformat=json&queryformat=struct";
									  
									  
									  // Bug fix --- for search only, if category is empty blank, should get all subTypes
									  if (( this.value == '') || ( this.value == null)) {
										  ___url = url + "cfc/sw.cfc?method=getAllSubType&returnformat=json&queryformat=struct";
									  }
									  
									  
									  
									  var ___category = {"category":this.value};
						  
														fetch(___url, 
															  {
																 method: 'POST',
																 body:JSON.stringify(___category)
															  }
															)
															  .then(function (response) 
																	   {
																						  
																			 // if js error here, likely it is coldfusion server output error message instead of valid json 
																			 // so check coldfusion server response.
																			   return response.json()
																			   
																		})
																		  
															   .then(function (result) {
																				
																				console.log('getSubTypeByCategory -:-  ', result)
																			
																			
																			// --------rebuild subtype select options -----------------
																			
																			
																			/*       
																			var options = [
																							  {text: "one", value: 1},
																							  {text: "two", value: 2}
																							];
																			*/
																			
																			
																			// bug fix, always add a new empty at the begining of array as first top empty option. 
																			result.unshift({ID:'', TYPE:''});
																			
																			
																			
																			var options = 	result			
																			$("#ss_type").replaceOptions(options);
																			
																			
																			
																			
																			
																		   // ----- end ----- rebuild subtype select options  -----------------
											   
																		 })
													 
													 .catch((err)=>console.error(err)) // fetch
					 
					 
					 
					 
					
											   });  // on change    
											   
											   
											<!--- ------- end ---------  category on change event -------------  --->
											   
											   
										
										
						 
						 
						 
						 
						 
									// 	 ============= this is a helper function to rebuild select options based on a json  ================
													(function($, window) {
													  $.fn.replaceOptions = function(options) {
														var self, $option;
													
														this.empty();
														self = this;
													
														$.each(options, function(index, option) {
														  $option = $("<option></option>")
															.attr("value", option.ID)
															.text(option.TYPE);
														  self.append($option);
														});
													  };
													})(jQuery, window);
									// 	 =========   end   ==== this is a helper function to rebuild select options based on a json  ================
					
					
					
					
					
					
					  <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
	
	
	
	
	
});



function downloadExcel() {

	$.ajax({
	  type: "POST",
	  url: url + "cfc/sw.cfc?method=downloadSiteSearch&callback=",
	  success: function(data) { 
	  	data = jQuery.parseJSON(trim(data));
	  	//console.log(data);
		
		$('#lnk').attr('href',data.HREF);
		$link = $('#lnk:first');
		$link[0].click();
		
	  }
	});

}

function toggleSearchBox() {
	if ( $("#searchbox").is(":visible") ) {
		$("#ss_arrow").css("top",'2px');
		$("#ss_downloads").css("top",'2px');
		$("#ss_arrow_img").css("top",'3px');
		$("#ss_arrow_img").attr("src",'../images/arrow_down.png');
		$("#ss_arrow_img").attr("title",'Show Search Filter Box');
	}
	else {
		$("#ss_arrow").css("top",'280px');
		$("#ss_downloads").css("top",'273px');
		$("#ss_arrow_img").css("top",'0px');
		$("#ss_arrow_img").attr("src",'../images/arrow_up.png');
		$("#ss_arrow_img").attr("title",'Hide Search Filter Box');
	}
	$( "#searchbox" ).toggle();
	//changeHeight();
}

function clearChk(ctrl) {
	if (ctrl == 'all') {
		var list = 'ass,qc,cons,conc';
		list = list.split(",");
		$.each(list, function(i, item) {
			$("#ss_" + item + "null").attr('checked', false);
		});
	}
	else {
		$("#ss_" + ctrl + "null").attr('checked', false);
	}
}

function clearFlds(ctrl) {
	if ($("#ss_" + ctrl + "null").is(":checked")) {
		$("#ss_" + ctrl + "frm").val('');
		$("#ss_" + ctrl + "to").val('');
	}
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


if($("#ss_header").is(":visible") == false || vis == 'hidden') {$("#dlExcel").css("visibility","hidden"); $("#dlPDF").css("visibility","hidden");}

$( "#ss_assfrm" ).datepicker();
$( "#ss_assto" ).datepicker();
$( "#ss_qcfrm" ).datepicker();
$( "#ss_qcto" ).datepicker();

$( "#ss_consfrm" ).datepicker();
$( "#ss_consto" ).datepicker();
$( "#ss_concfrm" ).datepicker();
$( "#ss_concto" ).datepicker();

//changeHeight();
//setForm();



    


