







<!--- joe 7/17/2018 meet kelly's tree report --->
<cfscript> 

    totalQuery = new Query( datasource = "sidewalk" );
	
    totalQuery.setSql( "with good ( action_type, Tree_Removal_Date, Tree_Planting_Date, t_type, loc_no ) as (
        select action_type, Tree_Removal_Date, Tree_Planting_Date, [type], Location_No
        from vwHDRTreeList
        where deleted = 0 or deleted is null
    )
    select 11, 'Total Number of Trees Removed', count(*) from good where ACTION_TYPE = 'Removal' and TREE_REMOVAL_DATE is not null and t_type in ( 'BSS', 'RAP', 'General Service', 'BSS - Dead Tree', 'BSS - Volunteer' )
	union
    select 21, 'Total Number of Tress to be Removed', count(*) from good inner join vwHDRAssessmentTracking a on loc_no = a.Location_No where ACTION_TYPE = 'Removal' AND TREE_REMOVAL_DATE is null and t_type in ( 'BSS', 'RAP', 'General Service', 'BSS - Dead Tree', 'BSS - Volunteer' ) and ( a.Package_No is not null )
    union
    select 31, 'Total Number of Trees Planted', count(*) from good where ACTION_TYPE = 'Planting' AND TREE_PLANTING_DATE is not null and t_type in ( 'BSS', 'RAP', 'General Service' )
    union
    select 41, 'Total Number of Trees to be Planted', count(*) from good inner join vwHDRAssessmentTracking a on loc_no = a.Location_No where ACTION_TYPE = 'Planting' AND TREE_PLANTING_DATE is null and t_type in ( 'BSS', 'RAP', 'General Service' ) and ( a.Package_No is not null ) and ( a.Construction_Completed_Date is not null ) " );

   

    summary = totalQuery.execute().getResult();
	
	//writedump(summary.recordcount); // get resultcount
   // writedump(summary); // dump result
	
	for (item in summary){
        // When iterating over a query in CFScript, you can use the
        // main query object to get meta-data; then, use the row
        // object to get row-specific properties.
     //   writeOutput(
     //       "[ #summary.currentRow# of #summary.recordCount# ] " &
     //       item.COMPUTED_COLUMN_3 &
     //       "<br />"
     //   );
		
	 if (item.COMPUTED_COLUMN_1 == 11) { trc = item.COMPUTED_COLUMN_3; }
	 if (item.COMPUTED_COLUMN_1 == 21) { ttbrc = item.COMPUTED_COLUMN_3; }
	 if (item.COMPUTED_COLUMN_1 == 31) { tpc = item.COMPUTED_COLUMN_3; }
	 if (item.COMPUTED_COLUMN_1 == 41) { ttbpc = item.COMPUTED_COLUMN_3; }
		
		
    }
	
</cfscript>




<cfparam name="s" default="">
<cfoutput>




<cfset arrA[1] = "A1.jpg">
<cfset arrB[1] = "B1.jpg">


<cfset dt = now()>
<cfset dt = dateformat(dt,"mmmm d, yyyy")>





 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->

                      <cfquery name="getNonSRP_typeId" datasource="#request.sqlconn#" dbtype="ODBC">
                
                 
                              SELECT * FROM tblType WHERE Category = 'Non-SRP Construction'
                     
                     </cfquery>
                     
                       <cfset _nonSRP_typeId_list = ''>
                      <cfloop query="getNonSRP_typeId">
                                                  
                                                  <!---   30,31,32   --->
                                                  <cfset _nonSRP_typeId_list  =  _nonSRP_typeId_list & getNonSRP_typeId.ID> 
                                                   
                                                   <cfif getNonSRP_typeId.currentrow eq getNonSRP_typeId.recordcount>
                                                               <!--- do last row display stuff --->
                                                               
                                                     <cfelse>
                                                                 <cfset _nonSRP_typeId_list  =  _nonSRP_typeId_list & ','> 
                                                   </cfif>
                                                    
                                                </cfloop>
	 
    
     
  <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->




<cfquery name="getAssessed" datasource="#request.sqlconn#" dbtype="ODBC">





   <!--- SELECT count(*) as cnt FROM tblSites WHERE assessed_date is not null  --->

    <!---   30,31,32   --->
    
    
    

  <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
  
     <!--- SELECT count(*) as cnt FROM tblSites WHERE assessed_date is not null and type NOT IN (30,31,32)  --->
  

  
     SELECT count(*) as cnt FROM tblSites WHERE assessed_date is not null and type NOT IN (#_nonSRP_typeId_list#)
     
	
    
     
  <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->

</cfquery>





<!---   test only 
<cfoutput>
 SELECT count(*) as cnt FROM tblSites WHERE assessed_date is not null and type NOT IN (#_nonSRP_typeId_list#)
</cfoutput>
--->




<cfquery name="getAllSites" datasource="#request.sqlconn#" dbtype="ODBC">

 <!---  SELECT count(*) as cnt FROM tblSites WHERE removed is null  --->
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT count(*) as cnt FROM tblSites WHERE removed is null and type NOT IN (#_nonSRP_typeId_list#)
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->


</cfquery>

<cfquery name="getRepairs" datasource="#request.sqlconn#" dbtype="ODBC">

   <!---  SELECT count(*) as cnt FROM tblSites WHERE repairs_required = 1  --->

     <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT count(*) as cnt FROM tblSites WHERE repairs_required = 1 and type NOT IN (#_nonSRP_typeId_list#)
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->


</cfquery>

<cfquery name="getNoRepairs" datasource="#request.sqlconn#" dbtype="ODBC">

    <!--- SELECT count(*) as cnt FROM tblSites WHERE repairs_required = 0   --->


    <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT count(*) as cnt FROM tblSites WHERE repairs_required = 0 and type NOT IN (#_nonSRP_typeId_list#)
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->


</cfquery>

<cfquery name="getNTP" datasource="#request.sqlconn#" dbtype="ODBC">

<!---

SELECT COUNT(*) AS cnt
FROM (SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date
FROM dbo.tblSites INNER JOIN dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND 
dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group
WHERE (NOT (dbo.tblPackages.Notice_To_Proceed_Date IS NULL)) <!--- AND 
(dbo.tblSites.Construction_Start_Date IS NULL) AND (dbo.tblSites.Construction_Completed_Date IS NULL) --->) AS derivedtbl_1
--->

<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT COUNT(*) AS cnt
FROM (SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date
FROM dbo.tblSites INNER JOIN dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND 
dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group
WHERE (NOT (dbo.tblPackages.Notice_To_Proceed_Date IS NULL) and (dbo.tblSites.Type NOT IN (#_nonSRP_typeId_list#))) <!--- AND 
(dbo.tblSites.Construction_Start_Date IS NULL) AND (dbo.tblSites.Construction_Completed_Date IS NULL) --->) AS derivedtbl_1  
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->




</cfquery>

<cfquery name="getEst" datasource="#request.sqlconn#" dbtype="ODBC">


<!---
SELECT SUM(est) AS total
FROM (SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblEngineeringEstimate.ENGINEERS_ESTIMATE_TOTAL_COST AS est
FROM dbo.tblSites INNER JOIN dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND 
dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group LEFT OUTER JOIN
dbo.tblEngineeringEstimate ON dbo.tblSites.Location_No = dbo.tblEngineeringEstimate.Location_No
WHERE (NOT (dbo.tblPackages.Notice_To_Proceed_Date IS NULL))) AS derivedtbl_1
--->

<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT SUM(est) AS total
FROM (SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblEngineeringEstimate.ENGINEERS_ESTIMATE_TOTAL_COST AS est
FROM dbo.tblSites INNER JOIN dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND 
dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group LEFT OUTER JOIN
dbo.tblEngineeringEstimate ON dbo.tblSites.Location_No = dbo.tblEngineeringEstimate.Location_No
WHERE (NOT (dbo.tblPackages.Notice_To_Proceed_Date IS NULL) and (dbo.tblSites.Type NOT IN (#_nonSRP_typeId_list#))   )) AS derivedtbl_1 
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->



</cfquery>






<cfquery name="getPricing" datasource="#request.sqlconn#" dbtype="ODBC">

     SELECT SUM(Awarded_Bid) AS total FROM dbo.tblPackages WHERE (Notice_To_Proceed_Date IS NOT NULL)







<!--- SELECT SUM(est) AS total 
FROM (SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblContractorPricing.CONTRACTORS_COST AS est
FROM dbo.tblSites INNER JOIN dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND 
dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group LEFT OUTER JOIN
dbo.tblContractorPricing ON dbo.tblSites.Location_No = dbo.tblContractorPricing.Location_No
WHERE (NOT (dbo.tblPackages.Notice_To_Proceed_Date IS NULL))) AS derivedtbl_1 --->
</cfquery>





<cfquery name="getCost" datasource="#request.sqlconn#" dbtype="ODBC">

<!---
SELECT CASE WHEN SUM(co) IS NULL THEN 0 ELSE SUM(co) END + CASE WHEN SUM(cor) IS NULL THEN 0 ELSE SUM(cor) END AS cost
FROM (SELECT dbo.tblSites.Location_No, dbo.tblContractorPricing.CONTRACTORS_COST AS co, dbo.tblChangeOrders.CHANGE_ORDER_COST AS cor
FROM dbo.tblSites LEFT OUTER JOIN dbo.tblChangeOrders ON dbo.tblSites.Location_No = dbo.tblChangeOrders.Location_No LEFT OUTER JOIN
dbo.tblContractorPricing ON dbo.tblSites.Location_No = dbo.tblContractorPricing.Location_No
WHERE (dbo.tblSites.Construction_Completed_Date IS NOT NULL)) AS derivedtbl_1
--->

<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT CASE WHEN SUM(co) IS NULL THEN 0 ELSE SUM(co) END + CASE WHEN SUM(cor) IS NULL THEN 0 ELSE SUM(cor) END AS cost
FROM (SELECT dbo.tblSites.Location_No, dbo.tblContractorPricing.CONTRACTORS_COST AS co, dbo.tblChangeOrders.CHANGE_ORDER_COST AS cor
FROM dbo.tblSites LEFT OUTER JOIN dbo.tblChangeOrders ON dbo.tblSites.Location_No = dbo.tblChangeOrders.Location_No LEFT OUTER JOIN
dbo.tblContractorPricing ON dbo.tblSites.Location_No = dbo.tblContractorPricing.Location_No
WHERE (dbo.tblSites.Construction_Completed_Date IS NOT NULL) and (dbo.tblSites.Type NOT IN (#_nonSRP_typeId_list#))    ) AS derivedtbl_1
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->



</cfquery>








<!---
<cfquery name="getTrees" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblTreeList.TREE_REMOVAL_DATE, 
dbo.tblTreeList.TREE_PLANTING_DATE, dbo.tblTreeList.ACTION_TYPE, dbo.tblTreeList.TYPE
FROM dbo.tblSites LEFT OUTER JOIN dbo.tblTreeList ON dbo.tblSites.Location_No = dbo.tblTreeList.Location_No LEFT OUTER JOIN
dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group
WHERE (dbo.tblPackages.Notice_To_Proceed_Date IS NOT NULL) AND (dbo.tblTreeList.DELETED = 0) AND (dbo.tblTreeList.TYPE = 1)
</cfquery>
--->

<!--- joe 5/21/2018 include 5:BSS - Dead Tree  c:BSS - Volunteer --->
<cfquery name="getTrees" datasource="#request.sqlconn#" dbtype="ODBC">

<!---
SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblTreeList.TREE_REMOVAL_DATE, 
dbo.tblTreeList.TREE_PLANTING_DATE, dbo.tblTreeList.ACTION_TYPE, dbo.tblTreeList.TYPE
FROM dbo.tblSites LEFT OUTER JOIN dbo.tblTreeList ON dbo.tblSites.Location_No = dbo.tblTreeList.Location_No LEFT OUTER JOIN
dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group
WHERE (dbo.tblPackages.Notice_To_Proceed_Date IS NOT NULL) AND (dbo.tblTreeList.DELETED = 0)
--->

<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT dbo.tblSites.Location_No, dbo.tblPackages.Notice_To_Proceed_Date, dbo.tblTreeList.TREE_REMOVAL_DATE, 
dbo.tblTreeList.TREE_PLANTING_DATE, dbo.tblTreeList.ACTION_TYPE, dbo.tblTreeList.TYPE
FROM dbo.tblSites LEFT OUTER JOIN dbo.tblTreeList ON dbo.tblSites.Location_No = dbo.tblTreeList.Location_No LEFT OUTER JOIN
dbo.tblPackages ON dbo.tblSites.Package_No = dbo.tblPackages.Package_No AND dbo.tblSites.Package_Group = dbo.tblPackages.Package_Group
WHERE (dbo.tblPackages.Notice_To_Proceed_Date IS NOT NULL) AND (dbo.tblTreeList.DELETED = 0) and (dbo.tblSites.Type NOT IN (#_nonSRP_typeId_list#))  
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->




</cfquery>






<!--- <cfquery name="getTRC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_REMOVAL_DATE is not null AND TYPE not in (5,6)</cfquery>  --->
<!--- joe 5/21/2018 include 5:BSS - Dead Tree  6:BSS - Volunteer --->
<cfquery name="getTRC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_REMOVAL_DATE is not null AND TYPE <> 3 </cfquery>




<cfquery name="getTPC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_PLANTING_DATE is not null</cfquery>

<!--- <cfquery name="getTTBRC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_REMOVAL_DATE is null AND ACTION_TYPE = 0 AND TYPE not in (5,6)</cfquery> --->
<!--- joe 5/21/2018 include 5:BSS - Dead Tree  c:BSS - Volunteer --->
<cfquery name="getTTBRC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_REMOVAL_DATE is null AND ACTION_TYPE = 0 AND TYPE <> 3</cfquery>

<cfquery name="getTTBPC" dbtype="query">SELECT count(*) as cnt FROM getTrees WHERE TREE_PLANTING_DATE is null AND ACTION_TYPE = 1</cfquery>


<!--- joe 6/1/2018 meet kelly's tree report --->
<!---
<cfset trc = getTRC.cnt>
<cfset tpc = getTPC.cnt>
<cfset ttbrc = getTTBRC.cnt>
<cfset ttbpc = getTTBPC.cnt>
--->





<cfquery name="getConcrete" datasource="#request.sqlconn#" dbtype="ODBC">

		<!---
        
        SELECT e4 + e6 + e8 + + ep + eb + q4 + q6 + q8 + qp + qb + c4 + c6 + c8 + cp + cb AS total FROM (SELECT 
        SUM(dbo.tblEngineeringEstimate.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS e4, 
        SUM(dbo.tblEngineeringEstimate.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) AS e6, 
        SUM(dbo.tblEngineeringEstimate.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) AS e8, 
        SUM(dbo.tblEngineeringEstimate.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) AS ep, 
        SUM(dbo.tblEngineeringEstimate.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS eb, 
        SUM(dbo.tblQCQuantity.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS q4, 
        SUM(dbo.tblQCQuantity.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) AS q6, 
        SUM(dbo.tblQCQuantity.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) AS q8, 
        SUM(dbo.tblQCQuantity.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) AS qp, 
        SUM(dbo.tblQCQuantity.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS qb, 
        CASE WHEN SUM(dbo.tblChangeOrders.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) IS NULL 
        THEN 0 ELSE SUM(dbo.tblChangeOrders.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) END AS c4, 
        CASE WHEN SUM(dbo.tblChangeOrders.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) IS NULL 
        THEN 0 ELSE SUM(dbo.tblChangeOrders.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) END AS c6, 
        CASE WHEN SUM(dbo.tblChangeOrders.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) IS NULL 
        THEN 0 ELSE SUM(dbo.tblChangeOrders.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) END AS c8, 
        CASE WHEN SUM(dbo.tblChangeOrders.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) IS NULL 
        THEN 0 ELSE SUM(dbo.tblChangeOrders.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) END AS cp, 
        CASE WHEN SUM(dbo.tblChangeOrders.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) IS NULL 
        THEN 0 ELSE SUM(dbo.tblChangeOrders.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) END AS cb
        FROM dbo.tblChangeOrders RIGHT OUTER JOIN dbo.tblSites ON dbo.tblChangeOrders.Location_No = dbo.tblSites.Location_No LEFT OUTER JOIN
        dbo.tblQCQuantity ON dbo.tblSites.Location_No = dbo.tblQCQuantity.Location_No LEFT OUTER JOIN
        dbo.tblEngineeringEstimate ON dbo.tblSites.Location_No = dbo.tblEngineeringEstimate.Location_No
        WHERE (dbo.tblSites.Construction_Completed_Date IS NOT NULL)) 
        AS derivedtbl_1
        
        
        --->





		<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
         
          SELECT e4 + e6 + e8 + + ep + eb + q4 + q6 + q8 + qp + qb + c4 + c6 + c8 + cp + cb AS total FROM (SELECT 
                SUM(dbo.tblEngineeringEstimate.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS e4, 
                SUM(dbo.tblEngineeringEstimate.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) AS e6, 
                SUM(dbo.tblEngineeringEstimate.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) AS e8, 
                SUM(dbo.tblEngineeringEstimate.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) AS ep, 
                SUM(dbo.tblEngineeringEstimate.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS eb, 
                SUM(dbo.tblQCQuantity.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS q4, 
                SUM(dbo.tblQCQuantity.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) AS q6, 
                SUM(dbo.tblQCQuantity.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) AS q8, 
                SUM(dbo.tblQCQuantity.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) AS qp, 
                SUM(dbo.tblQCQuantity.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) AS qb, 
                CASE WHEN SUM(dbo.tblChangeOrders.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) IS NULL 
                THEN 0 ELSE SUM(dbo.tblChangeOrders.FOUR_INCH_CONCRETE_SIDEWALK_AND_DRIVEWAY_QUANTITY) END AS c4, 
                CASE WHEN SUM(dbo.tblChangeOrders.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) IS NULL 
                THEN 0 ELSE SUM(dbo.tblChangeOrders.SIX_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK_QUANTITY) END AS c6, 
                CASE WHEN SUM(dbo.tblChangeOrders.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) IS NULL 
                THEN 0 ELSE SUM(dbo.tblChangeOrders.EIGHT_INCH_CONCRETE_DRIVEWAY_AND_SIDEWALK__EARLY_HIGH_STRENGTH___QUANTITY) END AS c8, 
                CASE WHEN SUM(dbo.tblChangeOrders.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) IS NULL 
                THEN 0 ELSE SUM(dbo.tblChangeOrders.SIX_INCH_PERVIOUS_CONCRETE_SIDEWALK_QUANTITY) END AS cp, 
                CASE WHEN SUM(dbo.tblChangeOrders.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) IS NULL 
                THEN 0 ELSE SUM(dbo.tblChangeOrders.FOUR_INCH_PATTERNED_l_DECORATIVE_l_BRICK_SIDEWALK_AND_DRIVEWAY_QUANTITY) END AS cb
                FROM dbo.tblChangeOrders RIGHT OUTER JOIN dbo.tblSites ON dbo.tblChangeOrders.Location_No = dbo.tblSites.Location_No LEFT OUTER JOIN
                dbo.tblQCQuantity ON dbo.tblSites.Location_No = dbo.tblQCQuantity.Location_No LEFT OUTER JOIN
                dbo.tblEngineeringEstimate ON dbo.tblSites.Location_No = dbo.tblEngineeringEstimate.Location_No
                WHERE (dbo.tblSites.Construction_Completed_Date IS NOT NULL) and (dbo.tblSites.Type NOT IN (#_nonSRP_typeId_list#))          ) 
                AS derivedtbl_1
         
         <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->



</cfquery>

<!--- <cfquery name="getNoRepairs" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT sum(contrators_cost) FROM tblContractorPricing WHERE repairs_required = 0
</cfquery> --->

<cfquery name="getStarted" datasource="#request.sqlconn#" dbtype="ODBC">
SELECT count(*) as cnt FROM tblSites WHERE Construction_Start_Date IS NOT NULL AND Construction_Completed_Date IS NULL
</cfquery>

<cfquery name="getCompleted" datasource="#request.sqlconn#" dbtype="ODBC">


<!--- SELECT count(*) as cnt FROM tblSites WHERE Construction_Completed_Date IS NOT NULL  --->

<!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->
 
      SELECT count(*) as cnt FROM tblSites WHERE Construction_Completed_Date IS NOT NULL and type NOT IN (#_nonSRP_typeId_list#)
 
 <!--- joe hu 12/5/2018 ---------- do not count NON-SRP construction sites --------------- --->



</cfquery>





<table class="left highlight striped">
        <thead>
          <tr>
              <th style="width: 400px;"><strong>Progress as of #dt#</strong></th>
              <th><strong>Totals</strong></th>
             
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Total Number of Sites</td>
            <td>#getAllSites.cnt#</td>
            
          </tr>
          <tr>
            <td>Sites Assessed</td>
            <td>#getAssessed.cnt#</td>
            
          </tr>
          <tr>
            <td>Sites Requiring Repairs</td>
            <td>#getRepairs.cnt#</td>
            
          </tr>
          
          
          
          
          
          
           <tr>
            <td>Sites Not Requiring Repairs</td>
            <td>#getNoRepairs.cnt#</td>
            
          </tr>
          
          
          
          
           <tr>
            <td>Estimated Construction Cost</td>
            <td>$#trim(numberformat(getEst.total,"9,999,999,999.00"))#</td>
            
          </tr>
          
          
          
           <tr>
            <td>Sites with Notice to Proceed (NTP) Issued</td>
            <td>#getNTP.cnt#</td>
            
          </tr>
          
          
          
           <tr>
            <td>Total Awarded Bid Amount</td>
            <td>$#trim(numberformat(getPricing.total,"9,999,999,999.00"))#</td>
            
          </tr>
          
          
          
           <tr>
            <td>Sites Completed Construction</td>
            <td>#getCompleted.cnt#</td>
            
          </tr>
          
          
          
           <tr>
            <td>Cost for Completed Sites</td>
            <td>$#trim(numberformat(getCost.cost,"9,999,999,999.00"))#</td>
            
          </tr>
          
          
           <tr>
            <td>Total Sq. Ft. of Concrete For Completed Sites</td>
            <td>#trim(numberformat(getConcrete.total,"9,999,999,999"))#</td>
            
          </tr>
          
          
           <tr>
            <td>Total Number of Trees Removed</td>
            <td>#trc#</td>
            
          </tr>
          
          
           <tr>
            <td>Total Number of Trees Planted</td>
            <td>#tpc#</td>
            
          </tr>
          
          
          
          
          
          
           <tr>
            <td>Total Number of Trees to be Removed</td>
            <td>#ttbrc#</td>
            
          </tr>
          
          
          
          
          
           <tr>
            <td>Total Number of Trees to be Planted</td>
            <td>#ttbpc#</td>
            
          </tr>
          
          
          
          
          
        </tbody>
      </table>



		
	
		
		

</cfoutput>
