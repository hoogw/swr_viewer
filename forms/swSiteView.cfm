



<cfinclude template="../template/header_mvue.cfm" />








 <div id="app">



     <v-app id="site">


        <v-tabs>
                <v-tab>Site</v-tab>
                <v-tab-item>
                     

                 <div class="my-6"></div>

                       <v-hover>
                              <template v-slot="{ hover }">
                                <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >


                              site info here

                           



                            </v-card>
                          </template>
                        </v-hover>




                </v-tab-item>          
                          




                          
                          
                <v-tab>Tree</v-tab>
                <v-tab-item>


                        <div class="my-6"></div>



                            <!-- Using the elevation prop -->
                            <v-hover>
                              <template v-slot="{ hover }">
                                  <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >
                                    

                                  
                                              package, council district, site number, sir date, etc....
                                    



                                  </v-card>
                              </template>
                            </v-hover>




                       <div class="my-6"></div>



                            <v-hover>
                              <template v-slot="{ hover }">
                              <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >


                                    <v-card-title>Tree Removals</v-card-title>

                                    <v-card-text>
                                              Tree Removals
                                    </v-card-text>



                              </v-card>
                              </template>
                            </v-hover>


                     <div class="my-6"></div>

                       <v-hover>
                              <template v-slot="{ hover }">
                                <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >


                            <v-card-title>Tree Plantings</v-card-title>

                            <v-card-text>
                                      Tree Plantings
                            </v-card-text>



                            </v-card>
                          </template>
                        </v-hover>



              <div class="my-6"></div>



                      <v-hover>
                              <template v-slot="{ hover }">
                                <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >


                            <v-card-title>Tree Preservation</v-card-title>

                            <v-card-text>
                                      Tree Preservation
                            </v-card-text>



                     </v-card>
                          </template>
                        </v-hover>



               <div class="my-6"></div>



                      <v-hover>
                              <template v-slot="{ hover }">
                                <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >


                            <v-card-title>Stump Removals </v-card-title>

                            <v-card-text>
                                      Stump Removals 
                            </v-card-text>



                      </v-card>
                          </template>
                        </v-hover>



               <div class="my-6"></div>


                      <v-hover>
                              <template v-slot="{ hover }">
                                <v-card
                                  
                                    :elevation="hover ? 24 : 6"
                                    class="mx-auto pa-6"
                                  >

                           

                            <v-card-text>
                                     other info
                            </v-card-text>



                      </v-card>
                          </template>
                        </v-hover>





                </v-tab-item>







                <v-tab>File</v-tab>
                <v-tab-item>
                      <v-card flat tile>


                                  <v-card-text>
                                     file file file
                                  </v-card-text>



                      </v-card>
                </v-tab-item>





                <v-tab>Assessment</v-tab>
                <v-tab-item>
                      <v-card flat tile>


                                  <v-card-text>
                                     Assessment, Assessment
                                  </v-card-text>



                      </v-card>
                </v-tab-item>




                <v-tab>Pricing</v-tab>
                <v-tab-item>
                      <v-card flat tile>


                                  <v-card-text>
                                     Pricing
                                  </v-card-text>



                      </v-card>
                </v-tab-item>



                <v-tab>Orders</v-tab>
                <v-tab-item>
                      <v-card flat tile>


                                  <v-card-text>
                                     Orders
                                  </v-card-text>



                      </v-card>
                </v-tab-item>



                          






          </v-tabs>

      </v-app>

</div>
                        
                 
                                
                               
                         <div id="preloader" class="progress" style="display:none">
                          <div class="indeterminate"></div>
                        </div>    






                            
                                   
                                
                                


	
         <link rel="stylesheet"  href="../css/layout.css"> 
	  
	       <script src="../js/forms/swSiteView.js"></script>
















<cfinclude template="../template/footer_mvue.cfm" />
				


