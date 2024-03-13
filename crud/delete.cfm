<cfquery datasource="my_server" name="update">
  update employee set status = 0 where id=#empid#;
</cfquery>
<cfoutput>
  <script>
    window.alert("Data deleted Successfully");
    location.reload();
  </script>
</cfoutput>