$(document).ready(function () {
  $(document).on("change", ".deleteCheckbox", function () {
    hi($(this));
  });
  $("#dropArea").on("change", "#dropAction", function () {
    value = $("#dropAction").val();
    if (value == 1) {
      deleteSelectedEmployees();
    } else if (value == 2) {
      RestoreEmp();
    }
  });
  $("#showbtn").on("click", function () {
    if ($("#rball").is(":checked")) {
      fetchAll();
    } else if ($("#rbarc").is(":checked")) {
      fetchArch();
    } else if ($("#rbact").is(":checked")) {
      fetchActive();
    }
  });

  function createBtn() {
    $.ajax({
      type: "POST",
      url: "pagination.cfm",
      data: {
        val: "2",
      },
      success: function (data) {
        $("#buttons-container").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch buttons.");
      },
    });
  }

  createBtn();
  fetchAll();

  function fetchAll() {
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "2",
      },
      success: function (data) {
        $("#tableData").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      },
    });
  }

  function fetchActive() {
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "1",
      },
      success: function (data) {
        $("#tableData").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      },
    });
  }

  function fetchArch() {
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "0",
      },
      success: function (data) {
        $("#tableData").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      },
    });
  }

  $("#search").click(function () {
    var searchInput = $("#searchInput").val();
    console.log("Search Input: ", searchInput);
    $.ajax({
      type: "POST",
      url: "fetch.cfm",
      data: {
        val: "3",
        searchInput: searchInput,
      },
      success: function (data) {
        $("#tableData").html(data);
      },
      error: function (data) {
        alert("Failed to Fetch employees.");
      },
    });
  });

  $("#openLoginForm").click(function () {
    $("#loginModal").show();
  });

  $("#closeLoginForm").click(function () {
    $("#loginModal").hide();
    location.reload();
  });

  $("#closeModalForm").click(function () {
    $("#updateModal").hide();
    location.reload();
  });
});

function updateEmployee(empId) {
  $("#updateIframe").attr("src", "updateform.cfm?empId=" + empId);
  $("#updateModal").show();
}

function sortTable(n) {
  let table;
  table = document.getElementById("table");
  let rows,
    i,
    x,
    y,
    count = 0;
  let switching = true;

  let direction = "ascending";

  while (switching) {
    switching = false;
    let rows = table.rows;
    for (i = 1; i < rows.length - 1; i++) {
      var Switch = false;

      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];

      if (direction == "ascending") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          Switch = true;
          break;
        }
      } else if (direction == "descending") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          Switch = true;
          break;
        }
      }
    }
    if (Switch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;

      count++;
    } else {
      if (count == 0 && direction == "ascending") {
        direction = "descending";
        switching = true;
      }
    }
  }
}

function selectAllCheckboxes() {
  let checkboxes = document.querySelectorAll(".deleteCheckbox");
  let selectAllCheckbox = document.getElementById("MasterCheckbox");

  checkboxes.forEach(function (checkbox, index) {
    isVisible = checkbox.closest("tr").style.display !== "none";
    if (isVisible) {
      checkbox.checked = selectAllCheckbox.checked;
      hi($(checkbox));
    }
  });
}

function deleteSelectedEmployees() {
  let selectedIds = [];
  let checkboxes = document.getElementsByClassName("deleteCheckbox");
  for (let checkbox of checkboxes) {
    if (checkbox.checked) {
      selectedIds.push(checkbox.value);
    }
  }
  if (selectedIds.length === 0) {
    window.alert("Please select at least one employee to delete.");
    return;
  }

  let confirmed = window.confirm(
    "Are you sure you want to delete the selected employees?"
  );
  if (confirmed) {
    $.ajax({
      type: "POST",
      url: "deleteBulk.cfm",
      data: {
        empIds: selectedIds.join(","),
      },
      success: function (data) {
        alert("deleted successfully");
        location.reload();
      },
      error: function (data) {
        alert("Failed to delete selected employees.");
      },
    });
  }
}

function RestoreEmp(id) {
  let selectedIds = [];
  let checkboxes = document.getElementsByClassName("deleteCheckbox");
  for (let checkbox of checkboxes) {
    if (checkbox.checked) {
      selectedIds.push(checkbox.value);
    }
  }

  if (selectedIds.length === 0) {
    window.alert("Please select at least one employee to restore.");
    return;
  }

  let confirmed = window.confirm(
    "Are you sure you want to restore the selected employees?"
  );
  if (confirmed) {
    $.ajax({
      type: "POST",
      url: "restore.cfm",
      data: {
        empIds: selectedIds.join(","),
      },
      success: function (data) {
        alert("Restored successfully");
        location.reload();
      },
      error: function (data) {
        alert("Failed to Restore selected employees.");
      },
    });
  }
}
let num = 0;

function hi(checkbox) {
  let numChecked = $(".deleteCheckbox:checked").length;

  if (numChecked === 0) {
    $("#dropArea").html(" ");
  } else {
    let isArchiveChecked = $(".deleteCheckbox.archive:checked").length > 0;
    let isNonArchiveChecked =
      $(".deleteCheckbox:not(.archive):checked").length > 0;
    let createOption =
      "<select class='form' id='dropAction' name='dropAction'>";
    if (isArchiveChecked && !isNonArchiveChecked) {
      createOption +=
        "<option selected='selected'>Select Action(" +
        numChecked +
        ")</option>";
      createOption +=
        "<option value='1' disabled>Delete(" + numChecked + ")</option>";
      createOption +=
        "<option value='2'>Unarchive(" + numChecked + ")</option>";
    } else if (isNonArchiveChecked && !isArchiveChecked) {
      createOption +=
        "<option selected='selected'>Select Action(" +
        numChecked +
        ")</option>";
      createOption += "<option value='1' >Delete(" + numChecked + ")</option>";
      createOption +=
        "<option value='2' disabled>Unarchive(" + numChecked + ")</option>";
    } else {
      createOption +=
        "<option selected='selected' disabled>Select Action(" +
        numChecked +
        ")</option>";
      createOption +=
        "<option value='1' disabled>Delete(" + numChecked + ")</option>";
      createOption +=
        "<option value='2' disabled>Unarchive(" + numChecked + ")</option>";
    }

    createOption += "</select>";

    $("#dropArea").html(createOption);
  }
}

var buttonsContainer = document.getElementById("buttons-container");
var button = document.createElement("button");
button.className = "btn btn-success gen";
button.textContent = "all";
button.id = "all";
buttonsContainer.appendChild(button);
var buttonsContainer = document.getElementById("buttons-container");
