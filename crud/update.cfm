<cfquery datasource="my_server" name="update">
  update employee set EmpName='#name#', Address='#address#', Email='#email#', phone=#phone# where id=#empid#;
</cfquery>

<script>
  window.alert('Data updated successfully');
  $(window.parent.document)
    .find("#closeModalForm")
    .click();
  location.reload();
</script>
