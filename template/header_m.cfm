

  <cfoutput>


			

    <!doctype HTML>



            <html>
              <head>
                <title id="title">Side Walk Repair</title>
                <meta charset="utf-8" />
            
                
               
                
                
                
                <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    
    
    
    
    
            
            <!---Import Google Icon Font--->
              <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
              <!---Import materialize.css--->
              <!--- Compiled and minified CSS --->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        
              <!---Let browser know website is optimized for mobile--->
              <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            
            
            
            
             <!--- 
             
                                   more icon at :  https://materialdesignicons.com     
                                   https://dev.materialdesignicons.com/getting-started/webfont#setup  
             
             
            ---> 
              <link rel="stylesheet" href="https://cdn.materialdesignicons.com/3.6.95/css/materialdesignicons.min.css">
            
            
            
           
                                    
                                
                                
                                
               <!---JavaScript at end of body for optimized loading--->
          			 <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>     
           
           
           
           
           
            <!--- --------------    data table js --------------    --->
           
           
					 <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        
                     <script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script>
                     
                     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">
                     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css">
           
           
            <!--- END  -------------- data table js   -------------- --->
           
           
           
           
                                
                                <cfset _site_root_dir = request.url>
                                
                              
                                
                                     
                                          
										<script>
                    
                                                
                                                        var url = "#request.url#";
                                                        var clr = "#request.color#";
                                                        
                    
                                                   console.log('url-->',url)
                                                   console.log('clr-->',clr)
												   
												   
                                        </script>
           
           
           
           
           
                
                <link rel="icon"          href="#_site_root_dir#favicon.ico" type="image/x-icon">
           
           
             <script src="#_site_root_dir#js/index_m.js"></script>  
             
             
             
             
             
             
             
    
  
  
              </head>
              <body>


                        
                        <!--- Dropdown Structure --->
                        <ul id="dropdown1" class="dropdown-content">
                          <li><a href="#_site_root_dir#search/swSiteSearch_m.cfm">Site</a></li>
                          <li class="divider"></li>
                          <li><a href="#_site_root_dir#search/swPackageSearch_m.cfm">Package</a></li>
                          <li class="divider"></li>
                          <li><a href="#_site_root_dir#search/swCurbRampSearch_m.cfm">Curb Ramp</a></li>
                        </ul>
                        
                        
                        
                        
                        
                        <nav>
                          <div class="nav-wrapper cyan darken-3 z-depth-1">
                            
                            <a href="" class="brand-logo right">Side Walk Repair</a>
                            
                            <ul class="left hide-on-med-and-down">
                            
                              <li><a href="#_site_root_dir#index_m.cfm">Home</a></li>
                            
                              <li><a href="#_site_root_dir#search/swSiteSearch_m.cfm">Site</a></li>
                              
                              <li><a href="#_site_root_dir#search/swPackageSearch_m.cfm">Package</a></li>
                              
                              <li><a href="#_site_root_dir#search/swCurbRampSearch_m.cfm">Curb Ramp</a></li>
                              
                              <li><a href="#_site_root_dir#search/swReports_m.cfm">Reports</a></li>
                              
                              <!--- Dropdown Trigger --->
                              <li><a class="dropdown-trigger" href="" data-target="dropdown1">Search<i class="material-icons right">arrow_drop_down</i></a></li>
                            </ul>
                          
                          
                          
                          
                          </div>
                        </nav>
                                
                                
                                
                                
                                
                                
                                
                                          
          
		  
		  
		  </cfoutput>                
                                
                                
                             
                            
                                
                                
                                
                                
                                
                                
                                
                                
                                
              