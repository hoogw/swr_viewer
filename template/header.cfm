

  <cfoutput>


			<!doctype html>


			<cfset font_color = "ffffff">
            
            <cfset shellName = "">
            <cfif (findNoCase('Android', cgi.http_user_agent,1) AND findNoCase('mobile', cgi.http_user_agent,1)) OR 
            (findNoCase('Windows', cgi.http_user_agent,1) AND findNoCase('Phone', cgi.http_user_agent,1)) OR 
            (findNoCase('iPhone', cgi.http_user_agent,1) OR findNoCase('iPod', cgi.http_user_agent,1)) OR 
            (findNoCase('BlackBerry', cgi.http_user_agent,1) OR findNoCase('BB10', cgi.http_user_agent,1))>
                <cfset shellName = "Handheld">
            <cfelseif findNoCase('Android', cgi.http_user_agent,1) OR 
            findNoCase('iPad', cgi.http_user_agent,1) OR 
            findNoCase('Playbook', cgi.http_user_agent,1) OR 
            findNoCase('Touch', cgi.http_user_agent,1)>
                <cfset shellName = "Tablet">
            <cfelse>
                <cfset shellName = "Desktop">
            </cfif>
            
            
            
            
            

      <HTML>


                <HEAD>
                                <TITLE>Sidewalk Repair Program</TITLE>
                                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
                                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                
                                <meta name="apple-mobile-web-app-capable" content="yes" />
                                <cfif shellName is "Tablet">
                                <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=2, minimum-scale=1, user-scalable=1.0">
                                <cfelse>
                                <meta name="viewport" content="width=device-width, height=device-height, initial-scale=0.5, maximum-scale=1, minimum-scale=0.5, user-scalable=1.0">
                                </cfif>
                                <!-- Sets the style of the status bar for a web application. -->
                                <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
                                
                                <!-- ImageReady Preload Script (mtmenu.psd) -->
                                <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
                                <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
                                
                                
                                
                                
                                
                                <!--- Mayor's Office requirement --->
                                 <!--- in header template, must use absolute path, because relative path will vary subject to change on current host page   ---> 
                               <!--- <script src="../js/google_analytics.js"></script>  ---> 
                               
                               
                                
                                
                                <cfset _site_root_dir = request.url>
                                
                              
                                
                                     
                                          
										<script>
                    
                                                
                                                        var url = "#request.url#";
                                                        var clr = "#request.color#";
                                                        
                    
                                                   console.log('url-->',url)
                                                   console.log('clr-->',clr)
												   
												   
                                        </script>
                                
                              
                                
                                
                                
                                
                                
                                
                                 <cfinclude template="../css/css.cfm">
                                
                                <!---  not work
                                <link rel="stylesheet" type="text/css" href="../css/css.cfm">
                                 --->
                                 
                                 
                                 
                                 
                                  <script src="#_site_root_dir#js/google_analytics.js"></script> 
                                 
                                 
                                 
                                
                                <link rel="shortcut icon" href="#_site_root_dir#favicon.ico" type="image/x-icon">
                                
                                
                                
                </HEAD>
                
                
                
     
                
     <BODY BGCOLOR="#request.pgcolor#">

                        <div style="position:absolute;top:15px;right:20px;">
                            <img style="position:relative;top:0px;" id="boe_img" src="#_site_root_dir#/images/BOE_Logo.png" width="152" height="88" alt="">
                        </div>
                        
                        
                       <!---    <div align="center" style="position:absolute;top:5px;left:5px;border:0px red solid;width:100%;height:100%;">     ---> 
                                <div align="center" style="position:absolute;top:0px;left:0px;border:0px red solid;width:100%;height:100%;">   
                        
                        
                        
                          <table border="0" cellspacing="0" cellpadding="0" style="border:0px red solid;width:100%;height:100%;">
                            <tr> 
                              <td>
                                  <cfset clr = request.fadecolor>
                                  <cfif brow is "C"><cfset clr = request.color></cfif>
                             <!---       <table id="main_table" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:0px;left:0px;border:2px #clr# solid;width:99%;height:98%;overflow:hidden;">    --->
                                  
                                  <table id="main_table" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:0px;left:0px;border:2px #clr# solid;width:100%;height:100%;overflow:hidden;">
                                  
                                    <tr> 
                                      <td style="position:absolute;top:0px;left:0px;width:100%;height:100%;" align="center" valign="top" background="#_site_root_dir#/images/sidewalk.png"> 
                                          <table style="position:absolute;top:0px;left:0px;width:100%;height:100%;border:0px red solid;" border="0" cellspacing="0" cellpadding="0">
                                             <tr> 
                                              <td id="banner2_div" class="subheader" style="width:100%;height:20px;color:#request.color#;text-align:center;padding:10px 0px 0px 0px;">
                                              <div id="banner2" style="position:relative;top:0px;">Bureau of Engineering</div>
                                              </td>
                                            </tr>
                                            <tr> 
                                              <td id="banner_div" class="header" style="width:100%;height:70px;color:#request.color#;text-align:center;">
                                              <div id="banner">#ucase("Sidewalk Repair Program")#</div>
                                              </td>
                                            </tr>
                                            <tr> 
                                              <td class="fade" style="width:100%;height:25px;">
                                              
                                                <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                                                    <tr>
                                                    
                                                    
                                                        
                                                        
														
                                                            <td id="div_home" class="center menubar" style="width:80px;" 
                                                            onclick="location.href='#_site_root_dir#index.cfm';hideDDs();" onMouseOver="this.style.cursor='pointer';">
                                                            Home&nbsp;Page
                                                            </td>
                                                          
                                                        
                                                   
                                                        
                                                        <cfif isdefined("session.userid")>
                                                        
                                                        
														
														   <!---    create
                                                            <cfif session.user_power gte 0 AND session.user_level gt 0>
                                                            <td id="div_create" class="center menubar" style="width:80px;" onClick="showDDs('dd_create');">
                                                            <div onMouseOver="this.style.cursor='pointer';showDDs('dd_create');" 
                                                            onmouseout="hideDDs();" style="height:20px;border:0px red solid;position:relative;top:3px;">Create</div>
                                                            </td>
                                                            </cfif>
                                                           --->    
                                                         
                                                         
                                                         
                                                            
                                                                    
                                                                <td id="div_search" class="center menubar" style="width:70px;">
                                                                        <div onMouseOver="this.style.cursor='pointer';showDDs('dd_search');" onClick="showDDs('dd_search');"
                                                                        onmouseout="hideDDs();" style="height:20px;border:0px red solid;position:relative;top:3px;">Search</div>
                                                                </td>
                                                                
                                                                
                                                                
                                                                
                                                                
                                                         <!---   add
                                                        
                                                            <cfif session.user_level gte 2 AND session.user_power gte 0>
                                                                    <td id="div_add" class="center menubar" style="width:70px;" onClick="showDDs('dd_add');">
                                                                    <div onMouseOver="this.style.cursor='pointer';showDDs('dd_add');"
                                                                    onmouseout="hideDDs();" style="height:20px;border:0px red solid;position:relative;top:3px;">Add</div>
                                                                    </td>
                                                            </cfif>
                                                             --->    
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            <!--- joe hu 7/31/18 report access --->
                                                            <cfif session.user_level gte 2 OR (session.user_power is 1 AND session.user_level is 0) OR (len(session.user_report) gt 0)>
                                                                    <td class="center menubar" style="width:80px;"
                                                                    onclick="changeFrame('search/swReports.cfm');hideDDs();" onMouseOver="this.style.cursor='pointer';">
                                                                    Reports
                                                                    </td>
                                                            </cfif>
                                                            
                                                            
                                                            
                                                            
                                                        </cfif>
                                                        
                                                        
                                                        
                                                        
                                                           <td class="right menubar"></td>
                                                        
                                                                  <!---
																	<cfif isdefined("session.userid")>
                                                                                <cfif session.user_level gte 3>
                                                                                <td class="center menubar" style="width:60px;" 
                                                                                onclick="changeFrame('search/swDownloadData.cfm');hideDDs();" onMouseOver="this.style.cursor='pointer';">
                                                                                Data
                                                                                </td>
                                                                        </cfif>
                                                                    </cfif>
                                                                    --->    
                                                                    
                                                                    
                                                                    <cfif isdefined("session.userid") is false>
                                                                        <td class="center menubar" style="width:70px;" onClick="showLogin();" onMouseOver="this.style.cursor='pointer';">Login</td>
                                                                    <cfelse>
                                                                            <td class="center menubar" style="width:110px;" onClick="showDDs('dd_account');">
                                                                            <div onMouseOver="this.style.cursor='pointer';showDDs('dd_account');"
                                                                            onmouseout="hideDDs();" style="height:20px;border:0px red solid;position:relative;top:3px;">My&nbsp;Account</div>
                                                                            </td>
                                                                    </cfif>
                                                        
                                                        
                                                        
                                                    </tr>
                                                </table>
                                              
                                              </td>
                                            </tr>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <tr> 
                                              <td height="100%" align="center" valign="top"> 
                                                <div align="center" style="width:100%;height:100%;"> 
                                                  <table style="width:100%;height:100%;" border="0" cellspacing="0" cellpadding="0">
                                                    <tr> 
                                                     
                                                        <td style="width:100%;height:100%;border:0px red solid;" valign="top">
                                
                                
                                
                                
                                
                                          
          
		  
		  
		  </cfoutput>                
                                
                                
                                
                                
                                <!---
                                
                                
                                <IFRAME NAME="FORM" id="FORM" SRC="swWelcome.cfm" allowtransparency="true" background-color="transparent" style="height:100%;width:100%;border:0px red solid;" frameborder="0"></IFRAME>
                              	
                                --->
                                
                                
                            
                                
                                
                                
                                
                                
                                
                                
                                
                                
              