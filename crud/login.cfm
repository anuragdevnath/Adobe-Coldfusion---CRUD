</html>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="val.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <title>Add Employee</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    h1 {
      text-align: center;
    }

    .mt-4 {
      margin-top: 4em;
    }

    .form-group {
      margin-bottom: 1em;
    }

    .btnc {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 1em;
    }

    .btn-success {
      color: white;
    }

    .response-message {
      text-align: center;
      margin-top: 1em;
    }
    .error {
      color: red;
    }
  </style>
</head>

<body class="bg-dark text-white">
  <h1>Add Employee</h1>
  <div class="mt-4">
    <form id="form" method="post" name="Form" action="">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" class="form-control" id="name" name="name"/>
        <div id="valname"></div>
      </div>

      <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" class="form-control" id="address" name="address"/>
        <div id="valaddress"></div>
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
        <input type="text" class="form-control" id="email" name="email"/>
        <div id="valemail"></div>
      </div>

      <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="number" class="form-control" id="phone" name="phone"/>
        <div id="valphone"></div>
      </div>

      <div class="btnc">
        <div class="btn" style="color: red">
          <button type="submit" class="btn btn-success">Add</button>
        </div>
      </div>
      <div class="response-message"></div>
    </form>
  </div>
</body>

</html>
