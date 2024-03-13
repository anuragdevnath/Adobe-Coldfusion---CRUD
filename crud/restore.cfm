<cfparam name="FORM.empIds" default="">
<cfset empIdsArray=ListToArray(FORM.empIds)>
<cfloop array="#empIdsArray#" index="empId">
  <cfquery datasource="my_server" name="delete">
    update employee set status = 1 where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#empId#">
  </cfquery>
</cfloop>

<cfoutput>
  <script>
    window.alert("Selected employees deleted successfully.");
  </script>
</cfoutput>