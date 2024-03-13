<cfquery datasource='my_server' name='employeeData'>
  SELECT DISTINCT LEFT(EmpName, 1) AS FirstLetter
  FROM employee;
</cfquery>

<cfoutput>
  <input type='button' class='btn btn-light' value='All' id='all' onclick='fetchAll()'/>
</cfoutput>
<cfset array_letters=[]>
<cfloop query="employeeData">
  <cfset employeeN=employeeData.FirstLetter>
  <cfset ArrayAppend(array_letters, employeeN)>
</cfloop>

<cfset startLetter='A'>
<cfset endLetter='Z'>

<cfoutput>
  <cfloop from="#asc(startLetter)#" to="#asc(endLetter)#" index="i">
    <cfset currentLetter=chr(i)>
    <cfif ArrayContains(array_letters,currentLetter)>
      <input type='button' class='btn btn-link' value='#currentLetter#' onclick='searchVal("#currentLetter#")'/>
    <cfelse>
      <input type='button' class='btn btn-link' value='#currentLetter#' onclick='noData()' style='color:grey'/>
    </cfif>
  </cfloop>
</cfoutput>

<script>
function noData(){
        $("#tableData").html("No Data Found");
}
  function searchVal(letter) {
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "4",
        letter: letter
      },
      success: function (data) {
        $("#tableData").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      }
    });
  }
  function fetchAll() {
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "2"
      },
      success: function (data) {
        $("#tableData").html(data);

      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      }
    });
  }
</script>
