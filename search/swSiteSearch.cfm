



<cfinclude template="../template/header.cfm" />





<cfoutput>
			<cfif isdefined("session.userid") is false>
                <script>
                top.location.reload();
				
                //var rand = Math.random();
                //url = "toc.cfm?r=" + rand;
                //window.parent.document.getElementById('FORM2').src = url;
                //self.location.replace("../login.cfm?relog=exe&r=#Rand()#&s=3");
                </script>
                <cfabort>
            </cfif>
            <!--- <cfif session.user_level is 1>
                <script>
                self.location.replace("../login.cfm?relog=false&r=#Rand()#&s=3&chk=authority");
                </script>
                <cfabort>
            </cfif> --->
</cfoutput>







<cfoutput>

<!--- Get Yes No Values --->
<cfquery name="getYesNo" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT * FROM tblYesNo ORDER BY value
</cfquery>

<!--- Get Package Groups --->
<cfquery name="getGroups" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT * FROM tblPackageGroup ORDER BY package_group
</cfquery>

<!--- Get Facility Type --->
<cfquery name="getType" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT * FROM tblType ORDER BY type
</cfquery>





<!--- Get Specail Fund --->
<cfquery name="getSpecialFund" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT * FROM tblSpecialFund ORDER BY id
</cfquery>




<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->

  <!--- commnent out this section replace by below section 

<!--- Get Category Type --->
<cfquery name="getCategory" dbtype="query">
SELECT DISTINCT category FROM getType ORDER BY category
</cfquery>

    --->


        <!--- Get all Category --->
        <cfquery name="getCategory" datasource="#request.sqlconn#" dbtype="ODBC">
              SELECT * FROM vwCategory
        </cfquery>
        



<!---  ----- end ------ joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->






<!--- joe hu 2019-8 add dropdown --->
            <cfquery name="getTreeAction" datasource="#request.sqlconn#" dbtype="ODBC">
            SELECT * FROM tblTreeActions where id <> 3 ORDER BY id
            </cfquery>
 <!---   end  -----  joe hu 2019-8 add dropdown --->












<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<a style="visibility:hidden;" id="lnk" href="../downloads/SidewalkRepairProgram.zip">asdas</a>
	<tr><td height="0"></td></tr>
</table>

<div id="searchbox" style="display:block;">

<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr><td height="0"></td></tr>
          <tr><td align="center" class="pagetitle">Search Sidewalk Repair Sites</td></tr>
		  <tr><td height="12"></td></tr>
		</table>
  	</td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" class="frame" align="center" style="width:870px;">
	<form name="form1" id="form1" method="post" action="" enctype="multipart/form-data">
	<tr>
	<td cellspacing="0" cellpadding="0" border="0" bgcolor="white" bordercolor="white">
		<table align=center bgcolor=white cellspacing="2" cellpadding="2" border="0">
		<tr>
			<th class="drk left middle" colspan="4" style="height:26px;padding:0px 0px 0px 0px;">
			
				
					<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
						<tr>
						<th class="drk left middle" style="width:420px;">Search Sidewalk Repair Sites:</th>
						
						<th class="drk right" style="color:white;font-size:11px;" id="rcnt"></th>
						<th class="drk" style="width:2px;"></th>
						</tr>
					</table>
			
			
			</td>
		</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<th class="left middle" style="height:22px;width:81px;">Site No:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:61px;">
						<input type="Text" name="ss_no" id="ss_no" value="" style="width:56px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						<td style="width:2px;"></td>
						<!--- <th class="left middle" style="width:60px;">Site Suffix:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:50px;">
						<select name="ss_sfx" id="ss_sfx" class="rounded" style="width:45px;">
						<option value=""></option>
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
						<option value="d">d</option>
						<option value="e">e</option>
						<option value="f">f</option>
						<option value="f">g</option>
						<option value="f">h</option>
						<option value="f">i</option>
						<option value="f">j</option>
						<option value="f">k</option>
						</select>
						</td>
						<td style="width:2px;"></td> --->
						<th class="left middle" style="width:95px;">Package Group:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:77px;">
						<select name="ss_pgroup" id="ss_pgroup" class="roundedsmall" style="width:72px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfset cnt = 1>
						<cfloop query="getGroups">
							<cfset sel = ""><!--- <cfif cnt is 1><cfset sel = "selected"><cfset cnt = cnt+1></cfif> --->
							<option value="#package_group#" #sel#>#package_group#</option>
						</cfloop>
						<option value="ALL">ALL</option>
						<option value="NONE">NONE</option>
						</select>
						</td>
						<td style="width:2px;"></td>
						<th class="left middle" style="width:70px;">Package No:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:55px;">
						<input type="Text" name="ss_pno" id="ss_pno" value="" style="width:50px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						<td style="width:2px;"></td>						
						
                        
                        
                        
                        <th class="left middle" style="width:35px;">Type:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:188px;">
                            <select name="ss_category" id="ss_category" class="roundedsmall" style="width:183px;height:20px;padding:0px 0px 0px 4px;">
                                    <option value=""></option>
                                    <cfloop query="getCategory">
                                        <option value="#category#">#category#</option>
                                    </cfloop>
                            </select>
						</td>
                        
                        
                        
                        
						
						<td style="width:2px;"></td>
						<th class="left middle" style="width:80px;">Council District:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:55px;">
						<select name="ss_cd" id="ss_cd" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop index="i" from="1" to="15">
							<option value="#i#">#i#</option>
						</cfloop>
						</select>
						</td>	
						
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<th class="left middle" style="height:22px;width:81px;">Facility Name:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:163px;">
						<input type="Text" name="ss_name" id="ss_name" value="" style="width:158px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						<td style="width:2px;"></td>
						<th class="left middle" style="width:50px;">Address:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:158px;">
						<input type="Text" name="ss_address" id="ss_address" value="" style="width:153px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						
						<td style="width:2px;"></td>						
						<th class="left middle" style="width:55px;">Subtype:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:168px;">
						<select name="ss_type" id="ss_type" class="roundedsmall" style="width:163px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getType">
							<option value="#id#">#type#</option>
						</cfloop>
						</select>
						</td>
						
						<td style="width:2px;"></td>
						<th class="left middle" style="width:80px;">Zip Code:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:55px;">
						<input type="Text" name="ss_zip" id="ss_zip" value="" style="width:50px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						
						<!--- <td style="width:2px;"></td>
						<th class="left middle" style="width:58px;">Priority No:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:35px;">
						<input type="Text" name="ss_pn" id="ss_pn" value="" style="width:30px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td> --->
					</table>
				</td>
			</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<th class="left middle" style="height:22px;width:80px;">Field Assessed:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:60px;">
						<select name="ss_assessed" id="ss_assessed" class="roundedsmall" style="width:55px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
						<!--- <td style="width:2px;"></td>
						<th class="left middle" style="width:85px;">Field Assessor:<br><div style="position:relative;left:20px;">(Intials)</div></th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:60px;">
						<input type="Text" name="ss_assessor" id="ss_assessor" value="" style="width:55px;" class="rounded"></td> --->
						<td style="width:2px;"></td>
						<th class="left middle" style="width:95px;">Repairs Required:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:45px;">
						<select name="ss_repairs" id="ss_repairs" class="roundedsmall" style="width:43px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
						<!--- <td style="width:2px;"></td>
						<th class="left middle" style="width:55px;">QC'd By:<br><div style="position:relative;left:2px;">(Intials)</div></th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:50px;">
						<input type="Text" name="ss_qc" id="ss_qc" value="" style="width:45px;" class="rounded"></td> --->
                        
                        
                        
                        <!---
						<td style="width:2px;"></td>
						<th class="left middle" style="width:85px;">Severity Index:</th>
                        
						<td style="width:2px;"></td>
						<td class="frm" style="width:60px;">
						<select name="ss_severity" id="ss_severity" class="roundedsmall" style="width:55px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop index="i" from="1" to="3">
							<option value="#i#">#i#</option>
						</cfloop>
						</select>
						</td>	
                        
                        --->
                        		
                           
                                
                                
                                
                                
						
						<td style="width:2px;"></td>
						<th class="left middle" style="width:70px;">Site Deleted:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_removed" id="ss_removed" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<cfif id is 1>
							<option value="#id#">#value#</option>
							</cfif>
						</cfloop>
						</select>
						</td>
						
						<td style="width:2px;"></td>
						<th class="left middle" style="width:88px;">Curb Ramp Only:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_curbramp" id="ss_curbramp" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
                        
                        
                         <!--- joe hu 2019-4 multi change --->
                        
                             
                           	<td style="width:2px;"></td>
						<th class="left middle" style="width:45px;">Locked:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:53px;">
						<select name="ss_locked" id="ss_locked" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>     
						
						
                        
                        <!--- end ---- joe hu 2019-4 multi change --->
                        
                        
                        
                        <!--- joe hu 2019-8 add dropdown --->
                        
                        <td style="width:2px;"></td>						
						<th class="left middle" style="width:45px;">Trees:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:98px;">
						<select name="ss_action" id="ss_action" class="roundedsmall" style="width:93px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getTreeAction">
							<option value="#id#">#Value2#</option>
						</cfloop>
						</select>
						</td>
                        
                        
                        <!---   end  -----  joe hu 2019-8 add dropdown --->
                        
                        
                        
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						
						
						<th class="left middle" style="height:22px;width:70px;">Work Order:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:108px;">
						<input type="Text" name="ss_wo" id="ss_wo" value="" style="width:103px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>
						<td style="width:2px;"></td>
						<th class="left middle" style="width:50px;">Keyword:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:151px;">
						<input type="Text" name="ss_keyword" id="ss_keyword" value="" style="width:146px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"></td>



                    <!--- joe hu 2019-4 multi change --->

                       <!---
						<td style="width:2px;"></td>
						<th class="left middle" style="width:99px;">Has Before Image:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_hasB" id="ss_hasB" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
						
						<td style="width:2px;"></td>
						<th class="left middle" style="width:88px;">Has After Image:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_hasA" id="ss_hasA" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
						
                        --->
                        
						<td style="width:2px;"></td>
						<th class="left middle" style="width:60px;">Grievance:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_grievance" id="ss_grievance" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#id#">#value#</option>
						</cfloop>
						</select>
						</td>
						
					
                        
                        
                        
                        
                        
                        
                        
                        
                  <!--- end ---- joe hu 2019-4 multi change --->
                        
                        
                        
                        
                        
                        
                        
                        <td style="width:2px;"></td>
						<th class="left middle" style="width:70px;">Special Fund:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_specialfund" id="ss_specialfund" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>  
						   <cfloop query="getSpecialFund">
                                        
                                        <option value="#id#" #sel#>#value#</option>
                                    </cfloop>
						</select>
						</td>
                        
                        
                        
                        
                        
                        
						<td style="width:2px;"></td>
						<th class="left middle" style="width:130px;">Certificate of Compliance:</th>
						<td style="width:2px;"></td>
						<td class="frm"  style="width:55px;">
						<select name="ss_hascert" id="ss_hascert" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
						<option value=""></option>
						<cfloop query="getYesNo">
							<option value="#value#">#value#</option>
						</cfloop>
						</select>
						</td>








						</tr>
					</table>
				</td>
			</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<th class="left middle" style="height:22px;width:142px;">Assessed Date:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:267px;"><!--- <input type="Text" name="ss_assdt" id="ss_assdt" value="" style="width:75px;" class="rounded">
						<span class="page">&nbsp;<strong>OR</strong>&nbsp;</span> --->
						<!--- <span class="page">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_assfrm" id="ss_assfrm" value="" style="width:97px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall">
						<span class="page">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_assto" id="ss_assto" value="" style="width:97px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"> --->
						
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_assfrm" id="ss_assfrm" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('ass');">
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_assto" id="ss_assto" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('ass');">
						<cfset chk = ""><cfif isdefined("session.ss_assnull")><cfset chk = "checked"></cfif>
						<input type="checkbox" name="ss_assnull" id="ss_assnull" style="position:relative;top:2px;left:4px;" value="" onChange="clearFlds('ass');" #chk#>
						<span class="page" style="position:relative;top:-1px;">Is Null</span>
						
						</td>
						<td style="width:2px;"></td>
						<th class="left middle" style="width:160px;">QC Date:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:267px;">
						<!--- <span class="page">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_qcfrm" id="ss_qcfrm" value="" style="width:82px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall">
						<span class="page">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_qcto" id="ss_qcto" value="" style="width:82px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"> --->
						
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_qcfrm" id="ss_qcfrm" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('qc');">
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_qcto" id="ss_qcto" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('qc');">
						<cfset chk = ""><cfif isdefined("session.ss_qcnull")><cfset chk = "checked"></cfif>
						<input type="checkbox" name="ss_qcnull" id="ss_qcnull" style="position:relative;top:2px;left:4px;" value="" onChange="clearFlds('qc');" #chk#>
						<span class="page" style="position:relative;top:-1px;">Is Null</span>
						
						</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>	
				<td colspan="4" style="padding:0px 0px 0px 0px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<th class="left middle" style="height:22px;width:142px;">Construction Started Date:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:267px;"><!--- <input type="Text" name="ss_assdt" id="ss_assdt" value="" style="width:75px;" class="rounded">
						<span class="page">&nbsp;<strong>OR</strong>&nbsp;</span> --->
						<!--- <span class="page">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_consfrm" id="ss_consfrm" value="" style="width:97px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall">
						<span class="page">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_consto" id="ss_consto" value="" style="width:97px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"> --->
						
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_consfrm" id="ss_consfrm" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('cons');">
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_consto" id="ss_consto" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('cons');">
						<cfset chk = ""><cfif isdefined("session.ss_consnull")><cfset chk = "checked"></cfif>
						<input type="checkbox" name="ss_consnull" id="ss_consnull" style="position:relative;top:2px;left:4px;" value="" onChange="clearFlds('cons');" #chk#>
						<span class="page" style="position:relative;top:-1px;">Is Null</span>
						
						</td>
						<td style="width:2px;"></td>
						<th class="left middle" style="width:160px;">Construction Completed Date:</th>
						<td style="width:2px;"></td>
						<td class="frm" style="width:267px;">
						<!--- <span class="page">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_concfrm" id="ss_concfrm" value="" style="width:82px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall">
						<span class="page">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_concto" id="ss_concto" value="" style="width:82px;height:20px;padding:0px 0px 0px 4px;" class="roundedsmall"> --->
						
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;From:&nbsp;</span>
						<input type="Text" name="ss_concfrm" id="ss_concfrm" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('conc');">
						<span class="page" style="position:relative;top:-2px;">&nbsp;&nbsp;To:&nbsp;</span>
						<input type="Text" name="ss_concto" id="ss_concto" value="" style="width:67px;height:20px;padding:0px 0px 0px 4px;position:relative;top:-2px;" class="roundedsmall" onChange="clearChk('conc');">
						<cfset chk = ""><cfif isdefined("session.ss_concnull")><cfset chk = "checked"></cfif>
						<input type="checkbox" name="ss_concnull" id="ss_concnull" style="position:relative;top:2px;left:4px;" value="" onChange="clearFlds('conc');" #chk#>
						<span class="page" style="position:relative;top:-1px;">Is Null</span>
						
						
						</td>
						</tr>
					</table>
				</td>
			</tr>
			

		</table>
	</td>
	</tr>
	</form>
</table>

<table align=center border="0" cellpadding="0" cellspacing="0" style="width:100%;">
	<tr><td height="10" colspan="5"></td></tr>
	<tr>
		<!--- <td><div style="visibility:hidden;"><img src="../images/excel.gif" width="16" height="16" alt="">
		<img src="../images/excel.png" width="17" height="17"></div></td> --->
		<td align="right">
			<a id="search" href="" class="button buttonText" style="height:17px;width:80px;padding:3px 0px 0px 0px;" 
			onclick="sortTable(0);return false;">Search</a>
		</td>
		<td style="width:15px;"></td>
		<td align="left">
			<a href="" class="button buttonText" style="height:17px;width:80px;padding:3px 0px 0px 0px;" 
			onclick=" $('#chr(35)#form1')[0].reset();clearChk('all');return false;">Clear</a>
		</td>
		<!--- <td style="text-align:right;"><img id="dlExcel" style="position:relative;top:8px;right:15px;visibility:hidden;" src="../images/excel.png" width="16" height="16" title="Download Search Results to Excel" onclick="downloadExcel();" onmouseover="this.style.cursor='pointer';">
		<a href="../reports/SiteSearch.cfm" target="_blank"><img id="dlPDF" style="position:relative;top:9px;right:12px;visibility:hidden;" src="../images/pdf_icon.gif" width="17" height="17" title="View Search Results PDF"></a></td> --->
	</tr>
</table>

</div>


<!--- joe hu  7/17/2018 ----- add progressing loading sign ------ (1) --->
<div class="overlay">
    <div id="loading-img"></div>
</div>



<div name="ss_arrow" id="ss_arrow" onClick="toggleSearchBox();"
style="position:absolute;top:280px;left:0px;height:15px;width:50px;border:0px red solid;display:none;">
<img id="ss_arrow_img" style="position:absolute;top:0px;left:15px;visibility:visible;" src="../images/arrow_up.png" width="19" height="12" title="Hide Search Filter Box"  onmouseover="this.style.cursor='pointer';">
</div>

<div name="ss_downloads" id="ss_downloads"
style="position:absolute;top:273px;right:0px;height:20px;width:52px;border:0px red solid;display:block;">
<img id="dlExcel" style="position:relative;top:0px;left:0px;visibility:hidden;" src="../images/excel.png" width="16" height="16" title="Download Search Results to Excel" onClick="downloadExcel();" onMouseOver="this.style.cursor='pointer';"><a href="../reports/SiteSearch.cfm" target="_blank"><img id="dlPDF" style="position:relative;top:1px;left:7px;visibility:hidden;" src="../images/pdf_icon.gif" width="17" height="17" title="View Search Results PDF"></a>
</div>

<div name="ss_header" id="ss_header" 
style="position:relative;top:10px;left:5px;height:25px;width:100%;border:2px #request.color# solid;overflow:hidden;display:none;">
<table border="0" cellpadding="0" cellspacing="0" style="height:25px;width:100%;border:0px red solid;">
	<tr><td cellspacing="0" cellpadding="0" border="0" bgcolor="white" bordercolor="white">
		<table align="center" bgcolor="white" cellspacing="2" cellpadding="2" border="0" style="width:100%;">
		<tr>
			<th class="drk center middle" style="height:21px;width:30px;">Edit</th>
			<th class="drk center middle" style="width:35px;" onClick="sortTable(1);return false;" onMouseOver="this.style.cursor='pointer';">Site</th>
			<th class="drk center middle" style="width:25px;" onClick="sortTable(10);return false;" onMouseOver="this.style.cursor='pointer';">CD</th>
			<th class="drk center middle" style="width:50px;" onClick="sortTable(2);return false;" onMouseOver="this.style.cursor='pointer';">Package</th>
			<th class="drk center middle" style="width:350px;" onClick="sortTable(3);return false;" onMouseOver="this.style.cursor='pointer';">Facility Name</th>
			<th class="drk center middle" onClick="sortTable(4);return false;" onMouseOver="this.style.cursor='pointer';">Address</th>
            
            <!--- joe hu --- 3/14/2018 --- add Days in queue --->
            <th class="drk center middle" style="width:80px;" onClick="sortTable(14);return false;" onMouseOver="this.style.cursor='pointer';">Days In Queue</th>
            
			<th class="drk center middle" style="width:70px;" onClick="sortTable(5);return false;" onMouseOver="this.style.cursor='pointer';">Con. Started</th>
			<th class="drk center middle" style="width:85px;" onClick="sortTable(6);return false;" onMouseOver="this.style.cursor='pointer';">Con. Completed</th>
			<th class="drk center middle" style="width:40px;" onClick="sortTable(7);return false;" onMouseOver="this.style.cursor='pointer';">Priority</th>
			<th class="drk center middle" style="width:75px;" onClick="sortTable(13);return false;" onMouseOver="this.style.cursor='pointer';">Eng. Estimate</th>
			<th class="drk center middle" style="width:75px;" onClick="sortTable(11);return false;" onMouseOver="this.style.cursor='pointer';">Total Cost</th>
			<th class="drk center middle" style="width:75px;" onClick="sortTable(12);return false;" onMouseOver="this.style.cursor='pointer';">Total Concrete</th>
			<th class="drk center middle" style="width:80px;" onClick="sortTable(8);return false;" onMouseOver="this.style.cursor='pointer';">Subtype</th>
			
			<!--- joe hu 2019-4 multi change --->
			<!--- <th id="fldWO" class="drk center middle" style="width:65px;" onClick="sortTable(9);return false;" onMouseOver="this.style.cursor='pointer';">Work Order</th> --->
            
             
                  <th id="fldWO" class="drk center middle" style="width:65px;" onClick="sortTable(15);return false;" onMouseOver="this.style.cursor='pointer';">Curb Ramps</th>
            <!--- end ---- joe hu 2019-4 multi change --->
            
            
            
            
			<!--- <th class="drk center middle" style="width:25px;" onclick="sortTable(3);return false;" onmouseover="this.style.cursor='pointer';">CD</th> --->
		</tr>
		</table>
	</td></tr>
</table>

</div>






<div name="ss_results" id="ss_results" 
style="position:relative;top:8px;left:5px;height:100%;width:100%;border:2px #request.color# solid;overflow-y:auto;overflow-x:hidden;display:none;">
<table id="tbl_results" border="0" cellpadding="0" cellspacing="0" ><tr><td></td></tr></table>
</div>


    
<div id="msg" class="box" style="top:40px;left:1px;width:300px;height:144px;display:none;z-index:505;">
	<a id="close" href="" class="close" style="z-index:505;top:3px;right:4px;" onClick="$('#chr(35)#msg').hide();return false;"><img src="../images/close_icon.png" height="8" width="8" title="Close Tools"  border="0" class="closex"></a>
	<div class="box_header"><strong>The Following Error(s) Occured:</strong></div>
	<div class="box_body" style="margin: 4px 0px 0px 0px;width:100%;">
		<div id="msg_text" style="top:10px;left:0px;height:200px;padding:25px 0px 0px 5px;align:center;text-align:center;">
		</div>
		
		<div style="position:absolute;bottom:15px;width:100%;">
		<table align=center border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr><td align="center">
				<a href="" class="button buttonText" style="height:15px;width:60px;padding:2px 0px 0px 0px;" 
				onclick="$('#chr(35)#msg').hide();return false;">Close</a>
			</td></tr>
		</table>
		</div>
		
	</div>
	
</div>
	
	
</cfoutput>














				<cfset vis = "hidden">
                <cfif isdefined("session.siteQuery")><cfset vis = "visible"></cfif>
                
                <script>
                
                                <cfoutput>
                                var url = "#request.url#";
                                var vis = "#vis#";
                                </cfoutput>
                
                </script>


<cfinclude template="../template/footer.cfm" />
				
<!--- this is for header and footer , must have --->
<script src="../js/index.js"></script>
	
<script src="../js/search/swSiteSearch.js"></script>


