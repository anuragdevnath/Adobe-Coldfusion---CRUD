<cfif #val# eq '2'>
  <cfquery datasource='my_server' name='employeeData'>
    SELECT * FROM employee;
  </cfquery>
<cfelseif #val# eq '1'>
  <cfquery datasource='my_server' name='employeeData'>
    SELECT * FROM employee where status=1;
  </cfquery>
<cfelseif #val# eq '0'>
  <cfquery datasource='my_server' name='employeeData'>
    SELECT * FROM employee where status=0;
  </cfquery>
<cfelseif #val# eq '3'>
  <cfquery datasource='my_server' name='employeeData'>
    SELECT * FROM employee
    WHERE EmpName LIKE '%#searchInput#%' or Address LIKE '%#searchInput#%' or Email LIKE '%#searchInput#%' or phone LIKE '%#searchInput#%'
  </cfquery>
<cfelseif #val# eq '4'>
  <cfquery datasource='my_server' name='employeeData'>
    SELECT * FROM employee
    WHERE EmpName LIKE '#letter#%'
  </cfquery>
<cfelseif #val# eq '5'>
  <cfquery datasource='my_server' name='firstLetters'>
    SELECT DISTINCT LEFT(EmpName, 1) AS FirstLetter FROM employee;
  </cfquery>
  <cfoutput query="firstLetters">
    #firstLetters.FirstLetter#
  </cfoutput>
</cfif>

<cfoutput>
  <table border="2" class=" table table-dark sortable" id="table">

    <thead>
      <tr>
        <th onclick="sortTable(0)">
          EmpID</th>
        <th onclick="sortTable(1)">
          EmpName</th>
        <th onclick="sortTable(2)">
          Address</th>
        <th onclick="sortTable(3)">
          Email</th>
        <th onclick="sortTable(4)">
          Phone</th>
        <th>
          Update</th>
        <th>
          <label style="margin-right: 8px;">
            Select all</label>
          <input type="checkbox" id="MasterCheckbox" onclick="selectAllCheckboxes()"></tr>
        </thead>
        <tbody>
          <cfloop index="i" from=1 to=#employeeData.recordCount#>
            <tr class="status-#employeeData.status[i]#">

              <td>
                #employeeData.id[i]#</td>
              <td>
                #employeeData.EmpName[i]#</td>
              <td>
                #employeeData.Address[i]#</td>
              <td>
                #employeeData.Email[i]#</td>
              <td>
                #employeeData.Phone[i]#</td>
              <td>
                <button class='btn btn-primary updateBtn' onclick='updateEmployee(#employeeData.id[i]#)'>
                  Update
                </button>
              </td>
              <td>
                <cfif #employeeData.status[i]#==0>
                  <input type="checkbox" class="deleteCheckbox archive" value="#employeeData.id[i]#">
                    archived</input>
                <cfelse>
                  <input type="checkbox" class="deleteCheckbox" value="#employeeData.id[i]#">
                  </cfif>

                </td>
              </tr>
            </cfloop>
          </tbody>

        </table>
        <button class='btn-secondary' onclick="previousPage()">
          Previous</button>
        <button class='btn-secondary' onclick="nextPage()">
          Next</button>
        <script>
          var currentPage = 0;
          var rowsPerPage = 5;

          function showRows() {
            var rows = document
              .getElementById('table')
              .querySelectorAll('tbody tr');
            var start = currentPage * rowsPerPage;
            var end = start + rowsPerPage;

            for (var i = 0; i < rows.length; i++) {
              rows[i].style.display = (i >= start && i < end)
                ? 'table-row'
                : 'none';
            }
          }

          function previousPage() {
            if (currentPage > 0) {
              currentPage--;
              showRows();
            }
          }

          function nextPage() {
            var rows = document
              .getElementById('table')
              .querySelectorAll('tbody tr');
            var totalRows = rows.length;

            if (currentPage < Math.ceil(totalRows / rowsPerPage) - 1) {
              currentPage++;
              showRows();
            }
          }

          showRows();
        </script>
      </cfoutput>
