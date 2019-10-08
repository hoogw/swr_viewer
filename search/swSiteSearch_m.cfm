



<cfinclude template="../template/header_m.cfm" />










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






<div class="row">
    <div class="col s12">
      <div class="card">
        <div class="card-content">
          <span class="card-title">   Sites </span>
          
          
       
    
              <div class="row">
              
                              <div class="input-field col s1">
                                  <input placeholder="" id="ss_no" type="text" >
                                  <label for="ss_no">Site No:</label>
                                </div>
              
              
              
              
              
              
                              <div class="input-field col s1">
                              
                                   <select name="ss_pgroup" id="ss_pgroup">
                                        <option value=""></option>
                                        <cfset cnt = 1>
                                        <cfloop query="getGroups">
                                            <cfset sel = ""><!--- <cfif cnt is 1><cfset sel = "selected"><cfset cnt = cnt+1></cfif> --->
                                            <option value="#package_group#" #sel#>#package_group#</option>
                                        </cfloop>
                                        <option value="ALL">ALL</option>
                                        <option value="NONE">NONE</option>
                                        </select>
                              
                                  
                                    <label for="ss_pgroup" >Package Group:</label>
                                  </div>
              
              
                
                
                
                
                
                                <div class="input-field col s1">
                                  <input placeholder="" id="ss_pnoe" type="text" >
                                  <label for="ss_pno">Package No:</label>
                                </div>
                
                
                
                
                
                
                
                 				<div class="input-field col s2">
                              
                                  <select name="ss_category" id="ss_category">
                                    <option value=""></option>
                                    <cfloop query="getCategory">
                                        <option value="#category#">#category#</option>
                                    </cfloop>
                           		 </select>
                              
                                  
                                    <label for="ss_category">Type:</label>
                                  </div>
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                 				<div class="input-field col s1">
                              
                                 <select name="ss_cd" id="ss_cd" class="roundedsmall" style="width:50px;height:20px;padding:0px 0px 0px 4px;">
                                            <option value=""></option>
                                            <cfloop index="i" from="1" to="15">
                                                <option value="#i#">#i#</option>
                                            </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_cd">Council District:</label>
                                  </div>
                
                
                
                
                
                           <div class="input-field col s1">
                                  <input placeholder="" id="ss_name" type="text" >
                                  <label for="ss_name">Facility Name:</label>
                                </div>
                
                
                
                			<div class="input-field col s1">
                                  <input placeholder="" id="ss_address" type="text" >
                                  <label for="ss_addresse">Address:</label>
                                </div>
                
                
                
                
                
                             <div class="input-field col s1">
                                  <input placeholder="" id="ss_zip" type="text" >
                                  <label for="ss_zip">Zip Code:</label>
                                </div>
                
                
                
                
                
                 				<div class="input-field col s1">
                                  <input placeholder="" id="ss_wo" type="text" >
                                  <label for="ss_wo">Work Order:</label>
                                </div>
                
                
                
              					  <div class="input-field col s1">
                                  <input placeholder="" id="ss_keyword" type="text" >
                                  <label for="ss_keyword">Keyword:</label>
                                </div>
                
                
                
              </div>
              
              
              
              
               <div class="row">
              
              
              
             				 <div class="input-field col s2">
                              
                                	<select name="ss_type" id="ss_type">
                                            <option value=""></option>
                                            <cfloop query="getType">
                                                <option value="#id#">#type#</option>
                                            </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_type">Subtype:</label>
                                  </div>
              
              
              
              
              
              
              
              
               				<div class="input-field col s1">
                              
                                	<select name="ss_assessed" id="ss_assessed">
                                            <option value=""></option>
                                            <cfloop query="getYesNo">
                                                <option value="#id#">#value#</option>
                                            </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_assessed">Field Assessed:</label>
                                  </div>
              
              
              
              
              
              
              
              				<div class="input-field col s1">
                              
                                	<select name="ss_repairs" id="ss_repairs" >
                                                <option value=""></option>
                                                <cfloop query="getYesNo">
                                                    <option value="#id#">#value#</option>
                                                </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_repairs">Repairs Required:</label>
                                  </div>
              
              
              
              
              
              
              
              
              
             			 <div class="input-field col s1">
                              
                                	<select name="ss_removed" id="ss_removed">
                                            <option value=""></option>
                                            <cfloop query="getYesNo">
                                                <cfif id is 1>
                                                <option value="#id#">#value#</option>
                                                </cfif>
                                            </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_removed">Site Deleted:</label>
                                  </div>
              
              
          
          
          
          
          				 <div class="input-field col s1">
                         
                              <select name="ss_curbramp" id="ss_curbramp" >
                                    <option value=""></option>
                                    <cfloop query="getYesNo">
                                        <option value="#id#">#value#</option>
                                    </cfloop>
                                </select>
                              
                                  
                                    <label for="ss_curbramp">Curb Ramp Only:</label>
                                  </div>
          
          
          
          
          
          
          
                              <div class="input-field col s1">
                              
                         
                                     <select name="ss_locked" id="ss_locked">
                                                <option value=""></option>
                                                <cfloop query="getYesNo">
                                                    <option value="#id#">#value#</option>
                                                </cfloop>
                                        </select>
                              
                                  
                                    <label for="ss_locked">Locked:</label>
                                  </div>
          
          
          
          
          
          
          
          
          
           						<div class="input-field col s1">
                              
                         
                                     <select name="ss_action" id="ss_action" >
                                        <option value=""></option>
                                        <cfloop query="getTreeAction">
                                            <option value="#id#">#Value2#</option>
                                        </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_action">Trees:</label>
                                  </div>
          
          
          
          
          
          					<div class="input-field col s1">
                              
                         
                                    <select name="ss_grievance" id="ss_grievance" >
                                            <option value=""></option>
                                            <cfloop query="getYesNo">
                                                <option value="#id#">#value#</option>
                                            </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_grievance">Grievance:</label>
                                  </div>
          
          
          
          
          
          
          
          					<div class="input-field col s1">
                              
                         
                                    <select name="ss_specialfund" id="ss_specialfund">
                                            <option value=""></option>  
                                               <cfloop query="getSpecialFund">
                                                            
                                                            <option value="#id#" #sel#>#value#</option>
                                                        </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_specialfund">Special Fund:</label>
                                  </div>
          
          
          
          
          
          
         				 <div class="input-field col s1">
                              
                         
                                   <select name="ss_hascert" id="ss_hascert">
                                                <option value=""></option>
                                                <cfloop query="getYesNo">
                                                    <option value="#value#">#value#</option>
                                                </cfloop>
                                    </select>
                              
                                  
                                    <label for="ss_hascert">Certificate of Compliance:</label>
                                  </div>
          
          
          
          
          
          
          
          
          
                    </div>
          
          
          
        </div>
        <div class="card-action">
          <a href="">Search</a>
          <a href="">Clear</a>
        </div>
      </div>
    </div>
  </div>





                 
                


	
</cfoutput>














<cfinclude template="../template/footer_m.cfm" />
				

	
<script src="../js/search/swSiteSearch_m.js"></script>


