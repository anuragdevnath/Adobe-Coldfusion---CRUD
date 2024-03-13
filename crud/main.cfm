<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Show Data</title>
  </head>
  <body class="bg-dark text-white">
    <div id="loginModal" class="modal bg-dark text-white">
      <div class="modal-content">
        <span class="close" id="closeLoginForm">&times;</span>
        <iframe src="login.cfm" width="100%" height="100%" frameborder="0"></iframe>
      </div>
    </div>

    <div id="updateModal" class="modal bg-dark text-white">
      <div class="modal-content">
        <span class="close" id="closeModalForm">&times;</span>
        <iframe src="" id="updateIframe" width="100%" height="100%" frameborder="0"></iframe>
      </div>
    </div>

    <div class="container mt-4">
      <h2>Employee Data</h2>
      <button id="openLoginForm" class="btn btn-success mt-2">
        Add Employee
      </button>
      <div class="mb-3">
        <label for="searchInput" class="form-label">Search:</label>
        <input type="text" class="form-control" name="searchInput" id="searchInput" placeholder="Enter search term">
        <button class="btn btn-primary mt-2" id='search'>Search</button>
        <p></p>
        <div id="buttons-container"></div>
      </div>

      <div class='mx-4'>
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="rball" checked="checked">All</input><br>
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="rbarc">Archive</input><br>
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="rbact">Active</input><br>
        <button class="btn btn-primary mt-2" id="showbtn">Show</button><br></div>
      <br>
      <div id='dropArea'></div>
      <div id='tableData'></div>
    </div>
  </body>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src='main.js'></script>
</html>
