<cfparam name="FORM.empIds" default="">
<cfset empIdsArray=ListToArray(FORM.empIds)>
<cfloop array="#empIdsArray#" index="empId">
  <cfquery datasource="my_server" name="delete">
   update employee set status = 0 where id =#empId# 
    /*  delete from employee where id =#empId# */

 </cfquery>
</cfloop>

<cfoutput>
  <script>
    window.alert("Selected employees deleted successfully.");
  </script>
</cfoutput>
