<cfquery datasource='my_server' name='EmpList'>
  select * from employee where id= #empId# ;
</cfquery>
</html>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <style>
    .error {
      color: red;
    }
  </style>
  <title>
    Add Employee</title>
  <h1>
    Update Employee</h1>
  <body class="bg-dark text-white">
    <cfoutput query="EmpList">
      <div class="form-group">
        <label for="name">
          Name:</label>
        <input type="text" class="form-control" id="name" name="name" value="#EmpList.EmpName#"/>
        <div id="valname"></div>
      </div>

      <div class="form-group">
        <label for="address">
          Address:</label>
        <input type="text" class="form-control" id="address" name="address" value="#EmpList.Address#"/>
        <div id="valaddress"></div>
      </div>

      <div class="form-group">
        <label for="email">
          Email:</label>
        <input type="text" class="form-control" id="email" name="email" value="#EmpList.Email#"/>
        <div id="valemail"></div>
      </div>

      <div class="form-group">
        <label for="phone">
          Phone:</label>
        <input type="number" class="form-control" id="phone" name="phone" value="#EmpList.Phone#"/>
        <div id="valphone"></div>
      </div>

      <div class="btnc">
        <div class="btn" style="color: red">
          <button onclick="updatedata(#empId#)" class="btn btn-success">
            Update</button>
        </div>
      </div>
      <div id="div1"></div>
    </cfoutput>
    <script src="updateval.js"></script>
  </body>
</html>
