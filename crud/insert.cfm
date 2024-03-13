<cftry>
  <cfquery datasource='my_server' name='checkExisting'>
    SELECT * FROM employee
    WHERE Email = '#Form.email#' OR Phone = #Form.phone#
  </cfquery>

  <cfif checkExisting.RecordCount GT 0>
    <cfoutput>
      <script>
        window.alert('Email or phone number already exists. Please use a different email or phone number.');
      </script>
    </cfoutput>
    <cfset queryResult=false>
  <cfelse>
    <cfset flag=1>
    <cfquery datasource='my_server' name='forminsert'>
      INSERT INTO employee (EmpName, Address, Email, Phone,status)
      VALUES (
      '#Form.name#'
      ,'#Form.address#'
      ,'#Form.email#'
      , #Form.phone#
      , #flag#
      )
    </cfquery>
    <cfset queryResult=true>
  </cfif>

  <cfcatch>
    <cfset queryResult=false>
    <cfoutput>
      Error: #cfcatch.message#
    </cfoutput>
  </cfcatch>
</cftry>

<cfif queryResult>
  <script>
    window.alert('Data Inserted successfully');
    $(window.parent.document)
      .find("#closeLoginForm")
      .click();
    location.reload();
  </script>
<cfelse>
  <cfoutput>
    Data not saved
  </cfoutput>
</cfif>
