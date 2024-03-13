$("#email").on("input", function () {
  var email = $(this).val();
  if (email.length > 0) {
    var regEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
    var validEmail = regEx.test(email);
    if (!validEmail) {
      $("#valemail").html('<span class="error"> Should contain a username an @ sign, and a domain name</span>');
    } else {
      $("#valemail").html("");
    }
  } else {
    $("#valemail").html("");
  }
});

$("#name").on("input", function () {
  var name = $(this).val();
  if (name.length < 5) {
    $("#valname").html('<span class="error"> Cannot be less than 5 characters </span>');
  } else {
    $("#valname").html("");
  }
});

$("#address").on("input", function () {
  var name = $(this).val();
  if (name.length < 5) {
    $("#valaddress").html('<span class="error"> Cannot be less than 5 characters </span>');
  } else {
    $("#valaddress").html("");
  }
});

$("#phone").on("input", function () {
  var name = $(this).val();
  if (name.length != 10) {
    $("#valphone").html('<span class="error"> Enter a valid 10 digit phone number </span>');
  } else {
    $("#valphone").html("");
  }
});

function updatedata(empid) {
  if (validateForm()) {
    var email = $("#email").val();
    var name = $("#name").val();
    var address = $("#address").val();
    var phone = $("#phone").val();
    $.ajax({
      type: "POST",
      url: "update.cfm",
      data: {
        empid: empid,
        email: email,
        name: name,
        address: address,
        phone: phone
      },
      success: function (data) {
        $("#div1").html(data);
      }
    });
  }

  function validateForm() {
    $(".error").remove();
    var email = $("#email").val();
    var name = $("#name").val();
    var address = $("#address").val();
    var phone = $("#phone").val();

    if (email.length < 3) {
      $("#valemail").html('<span class="error">Enter a valid Email</span>');
    } else {
      var regEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        $("#valemail").html('<span class="error">Enter a valid Email</span>');
        return false;
      }
    }

    if (name.length < 5) {
      $("#valname").html('<span class="error">Name Cannot be less that 5 characters</span>');
      return false;
    }

    if (address.length < 5) {
      $("#valaddress").html('<span class="error">Address Cannot be less that 5 characters</span>');
      return false;
    }

    if (phone.length != 10) {
      $("#valphone").html('<span class="error">Enter 10 Digits please</span>');
      return false;
    }
    return true;
  }
}
