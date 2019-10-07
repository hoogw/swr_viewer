
                                
                                
                                <!---
                                
                                
                                <IFRAME NAME="FORM" id="FORM" SRC="swWelcome.cfm" allowtransparency="true" background-color="transparent" style="height:100%;width:100%;border:0px red solid;" frameborder="0"></IFRAME>
                              	
                                --->
                                
                                
                                
     <cfoutput>                           
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    </td>
                                                                   
                                                                </tr>
                                                                <tr> 
                                                                    <td class="fade" style="width:100%;height:20px;">
                                                                    <!--- <div id="toc_div" style="position:relative;border:0px red solid;width:30px;top:2px;left:222px;" onclick="hideTOC();return false;" onMouseOver="this.style.cursor='pointer'"><img id="toc_img" src="images/arrow_left_w.png" width="8" height="15" title="Hide Table of Contents"></div> --->
                                                                    </td>
                                                                </tr>
                                                              </table>
                                                            </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                </tr>
                                              </table>
                                            </div>
                                            </td>
                                        </tr>
                                      </table>
                                      
                                      
                                      
                                      
                            </div>    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <div id="login" class="box" style="top:40px;left:1px;width:320px;height:200px;display:none;z-index:505;">
                                        <a id="close" href="" class="close" style="z-index:505;top:3px;right:4px;" onClick="$('#chr(35)#login').hide();return false;"><img src="#_site_root_dir#images/close_icon.png" height="8" width="8" title="Close Tools"  border="0" class="closex"></a>
                                        <div id="msg_header5" class="box_header"><strong></strong></div>
                                        <div class="box_body" style="margin: 4px 0px 0px 0px;width:100%;">
                                    
                                            <div id="msg_text5" style="top:10px;left:0px;height:200px;padding:25px 0px 0px 0px;align:center;text-align:center;">
                                            
                                            <table cellspacing="0" cellpadding="0" border="0" class="frame" align="center" style="width:300px;border: 2px solid #request.drkcolor#;">
                                            <tr>
                                                <td cellspacing="0" cellpadding="0" border="0" bgcolor="white" bordercolor="white">
                                                    <table align=center bgcolor=white cellspacing="2" cellpadding="2" border="0">
                                                        <form id="form_login">
                                                        <tr>
                                                            <th class="drk left middle" colspan="2" style="height:20px;">Login:</td>
                                                        </tr>
                                                        <tr>
                                                            <th class="left middle" style="height:30px;width:130px;">User ID:</th>
                                                            <td class="frm" style="width:180px;padding:0px 0px 0px 5px;"><INPUT type="Text" name="user" id="user" value="" style="width:170px;" class="rounded"></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="left middle" style="height:30px;width:130px;">Password:</td>
                                                            <td class="frm" style="width:180px;"><input class="rounded" type="password" name="password" id="password" maxlength="15" style="width:170px;"></td>
                                                        </tr>
                                                        </form>
                                                    </table>
                                                </td>
                                            </tr>
                                            </table>
                                        
                                        <table align=center border="0" cellpadding="0" cellspacing="0">
                                            <tr><td height=10></td></tr>
                                            <tr>
                                                <td align="center">
                                                    <a href="" class="button buttonText" style="height:17px;width:80px;padding:3px 0px 0px 0px;" 
                                                    onclick="chkLogin();return false;">Submit</a>
                                                </td>
                                            </tr>
                                            <tr><TD height="35" colspan="3" class="page" align="center"><span id="log_text"><font color="#request.color#"><strong>Password</strong></font> does not match <font color="#request.color#"><strong>User ID</strong></font>.<br>For assistance with Login, Please Call: (213) 482-7124.</span></TD></tr>
                                        </table>
                                            
                                            
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                    <cfset t = 131><cfif brow is "M"><cfset t = 133></cfif>
                                    <div id="dd_account" style="position:absolute;top:#t#px;right:0px;display:none;z-index:999;" onMouseOver="$('#chr(35)#dd_account').show();" onMouseOut="$('#chr(35)#dd_account').hide();">
                                    <table align="center" bgcolor="#request.color#" cellspacing="0" cellpadding="0" border="0">
                                    <tr>	
                                        <td colspan="4" style="padding:1px">
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <!--- <tr><td style="height:4px;"></td></tr> --->
                                                <tr>
                                                <th class="dropdown left middle" style="height:20px;width:110px;" 
                                                onclick="changeFrame('changePassword.cfm');$('#chr(35)#dd_account').hide();" onMouseOver="this.style.cursor='pointer';">
                                                Change Password
                                                </th>
                                                </tr>
                                                <tr><td style="height:1px;"></td></tr>
                                                <tr>
                                                <th class="dropdown left middle" style="height:21px;" onClick="doLogOff();" onMouseOver="this.style.cursor='pointer';">
                                                Log off
                                                </th>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </table>
                                    </div>
                                    
                                    <div id="dd_create" style="position:absolute;top:#t#px;left:0px;display:none;z-index:999;" onMouseOver="$('#chr(35)#dd_create').show();" onMouseOut="$('#chr(35)#dd_create').hide();">
                                    <table align="center" bgcolor="#request.color#" cellspacing="0" cellpadding="0" border="0">
                                    <tr>	
                                        <td colspan="4" style="padding:1px">
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <!--- <tr><td style="height:4px;"></td></tr> --->
                                                <tr>
                                                <th class="dropdown left middle" style="height:20px;width:150px;" 
                                                onclick="changeFrame('forms/swSiteEntry.cfm');$('#chr(35)#dd_create').hide();" onMouseOver="this.style.cursor='pointer';">
                                                New Sidewalk Repair Site
                                                </th>
                                                </tr>
                                                <cfif isdefined("session.userid") is true>
                                                    <cfif session.user_level gte 2 AND session.user_power gte 0>
                                                    <tr><td style="height:1px;"></td></tr>
                                                    <tr>
                                                    <th class="dropdown left middle" style="height:21px;"
                                                    onclick="changeFrame('forms/swPackageEntry.cfm','type=new');$('#chr(35)#dd_create').hide();" onMouseOver="this.style.cursor='pointer';">
                                                    New Repair Package
                                                    </th>
                                                    </tr>
                                                    </cfif>
                                                </cfif>
                                                <tr><td style="height:1px;"></td></tr>
                                                <tr>
                                                <th class="dropdown left middle" style="height:20px;width:150px;" 
                                                onclick="changeFrame('forms/swCurbRampEntry.cfm');$('#chr(35)#dd_create').hide();" onMouseOver="this.style.cursor='pointer';">
                                                New Curb Ramp
                                                </th>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </table>
                                    </div>
                                    
                                    <div id="dd_search" style="position:absolute;top:#t#px;left:107px;display:none;z-index:999;" onMouseOver="$('#chr(35)#dd_search').show();" onMouseOut="$('#chr(35)#dd_search').hide();">
                                                <table align="center" bgcolor="#request.color#" cellspacing="0" cellpadding="0" border="0">
                                                <tr>	
                                                    <td colspan="4" style="padding:1px">
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <!--- <tr><td style="height:4px;"></td></tr> --->
                                                            <tr>
                                                            <th class="dropdown left middle" style="height:20px;width:150px;" 
                                                            onclick="location.href='#_site_root_dir#search/swSiteSearch.cfm';$('#chr(35)#dd_search').hide();" onMouseOver="this.style.cursor='pointer';">
                                                            Sidewalk Repair Site
                                                            </th>
                                                            </tr>
                                                            <tr><td style="height:1px;"></td></tr>
                                                            <tr>
                                                            <th class="dropdown left middle" style="height:21px;"
                                                            onclick="location.href='#_site_root_dir#search/swPackageSearch.cfm';$('#chr(35)#dd_search').hide();" onMouseOver="this.style.cursor='pointer';">
                                                            Sidewalk Repair Package
                                                            </th>
                                                            <tr><td style="height:1px;"></td></tr>
                                                            <tr>
                                                            <th class="dropdown left middle" style="height:21px;"
                                                            onclick="location.href='#_site_root_dir#search/swCurbRampSearch.cfm';$('#chr(35)#dd_search').hide();" onMouseOver="this.style.cursor='pointer';">
                                                            Curb Ramp Repairs
                                                            </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </table>
                                    </div>
                                    
                                    <div id="dd_add" style="position:absolute;top:#t#px;left:0px;display:none;z-index:999;" onMouseOver="$('#chr(35)#dd_add').show();" onMouseOut="$('#chr(35)#dd_add').hide();">
                                    <table align="center" bgcolor="#request.color#" cellspacing="0" cellpadding="0" border="0">
                                    <tr>	
                                        <td colspan="4" style="padding:1px">
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <!--- <tr><td style="height:4px;"></td></tr> --->
                                                <tr>
                                                <th class="dropdown left middle" style="height:20px;width:160px;" 
                                                onclick="changeFrame('forms/swPackageEntry.cfm','type=add');$('#chr(35)#dd_add').hide();" onMouseOver="this.style.cursor='pointer';">
                                                Site to an Existing Package
                                                </th>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </table>
                                    </div>




					</BODY>

		</HTML>



</cfoutput>
			