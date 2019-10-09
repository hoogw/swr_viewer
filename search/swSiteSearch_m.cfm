



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




<ul class="collapsible z-depth-2">

<!---   Preselected Section, If you want a collapsible with a preopened section just add the active class to the collapsible-header. --->
  <!---   <li class="active">   --->
    <li>
      <div class="collapsible-header"><i class="material-icons">search</i></div>   
      <div class="collapsible-body">
           
            
    



                                                            
                                                            <div class="row">
                                                                <div class="col s12">
                                                                  <div class="card">
                                                                    <div class="card-content">
                                                                      <span class="card-title"> </span>
                                                                      
                                                                      
                                                                   <form name="form1" id="form1" method="post" action="" enctype="multipart/form-data">
                                                                
                                                                          <div class="row">
                                                                          
                                                                                          <div class="input-field col s1">
                                                                                              <input placeholder="" id="ss_no" name="ss_no" type="text" >
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
                                                                                              <input placeholder="" id="ss_pno" name="ss_pno" type="text" >
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
                                                                                              <input placeholder="" id="ss_name" name="ss_name" type="text" >
                                                                                              <label for="ss_name">Facility Name:</label>
                                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                                        <div class="input-field col s1">
                                                                                              <input placeholder="" id="ss_address" name="ss_address" type="text" >
                                                                                              <label for="ss_addresse">Address:</label>
                                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                                         <div class="input-field col s1">
                                                                                              <input placeholder="" id="ss_zip" name="ss_zip" type="text" >
                                                                                              <label for="ss_zip">Zip Code:</label>
                                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                                            <div class="input-field col s1">
                                                                                              <input placeholder="" id="ss_wo" name="ss_wo" type="text" >
                                                                                              <label for="ss_wo">Work Order:</label>
                                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                                              <div class="input-field col s1">
                                                                                              <input placeholder="" id="ss_keyword" name="ss_keyword" type="text" >
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
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
                                                                                </div>   <!--- row --->
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                 <div class="row">
                                                                                
                                                                                
                                                                                
                                                                                          
                                                                                
                                                                                                        <div class="input-field col s2">
                                                                                                           <label for="ss_assfrm">Assessed Date From:</label>
                                                                                                           <input name="ss_assfrm" id="ss_assfrm"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                
                                                                                
                                                                                                          <div class="input-field col s2">
                                                                                                           <label for="ss_assto">Assessed Date To:</label>
                                                                                                           <input name="ss_assto" id="ss_assto"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                         <label for="ss_assnull">
                                                                                                            
                                                                                                            <input type="checkbox" class="filled-in" name="ss_assnull" id="ss_assnull" />
                                                                                                            <span>Is Null</span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                        
                                                                                                               <!--- just blank to seperate  ---> 
                                                                                                         
                                                                                                         </div>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        <div class="input-field col s2">
                                                                                                           <label for="ss_qcfrm">QC Date From:</label>
                                                                                                           <input name="ss_qcfrm" id="ss_qcfrm"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                
                                                                                
                                                                                                          <div class="input-field col s2">
                                                                                                           <label for="ss_qcto">QC Date To:</label>
                                                                                                           <input name="ss_qcto" id="ss_qcto"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                         <label for="ss_qcnull">
                                                                                                           
                                                                                                            <input type="checkbox" class="filled-in" name="ss_qcnull" id="ss_qcnull"/>
                                                                                                            <span>Is Null</span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                
                                                                                
                                                                                 </div>   <!--- row --->
                                                                                 
                                                                                 
                                                                                 
                                                                                 
                                                                                 
                                                                                 
                                                                                 
                                                                                    <div class="row">
                                                                                
                                                                                
                                                                                
                                                                                          
                                                                                
                                                                                                        <div class="input-field col s2">
                                                                                                           <label for="ss_consfrm">Construction Started Frome:</label>
                                                                                                           <input name="ss_consfrm" id="ss_consfrm"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                
                                                                                
                                                                                                          <div class="input-field col s2">
                                                                                                           <label for="ss_consto">Construction Started To:</label>
                                                                                                           <input name="ss_consto" id="ss_consto"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                         <label for="ss_consnull">
                                                                                                            
                                                                                                            <input type="checkbox" class="filled-in" name="ss_consnull" id="ss_consnull"/>
                                                                                                            <span>Is Null</span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                        
                                                                                                               <!--- just blank to seperate  ---> 
                                                                                                         
                                                                                                         </div>
                                                                                                         
                                                                                                         
                                                                                                         <div class="input-field col s2">
                                                                                                           <label for="ss_concfrm">Construction Completed Frome:</label>
                                                                                                           <input name="ss_concfrm" id="ss_concfrm"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                
                                                                                
                                                                                                          <div class="input-field col s2">
                                                                                                           <label for="ss_concto">Construction Completed To:</label>
                                                                                                           <input name="ss_concto" id="ss_concto"  type="text" class="datepicker">
                                                                                                          
                                                                                                        </div>
                                                                                                        
                                                                                                        
                                                                                                         <div class="input-field col s1">
                                                                                                         <label for="ss_concnull">
                                                                                                           
                                                                                                            <input type="checkbox" class="filled-in" name="ss_concnull" id="ss_concnull"/>
                                                                                                            <span>Is Null</span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                 </div>   <!--- row --->
                                                                                 
                                                                      
                                                                           </form>
                                                                      
                                                                    </div>
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    <div class="card-action">
                                                                      <a href="">Search</a>
                                                                      <a href="">Clear</a>
                                                                    </div>
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  </div>
                                                                </div>
                                                              </div>





                 
       </div>
    </li>
   
  </ul>
           




   
                          
                                <table id="data_table" class="display" width="100%"></table>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                          
                              
                              
                           





	
</cfoutput>














<cfinclude template="../template/footer_m.cfm" />
				

	
<script src="../js/search/swSiteSearch_m.js"></script>


