$().ready(function() {
  $("#container").validate({
    rules: {
      fname: "required",
      lname: "required",
      country: "required",
      gender: "required",
      topic: {
        required: true,
        minlength: 2
      },
      newpass: {
        required: true,
        minlength: 6
      },
      confirmpass: {
        required: true,
        minlength: 6,
        equalTo: "#newpass"
      }
    },
    messages: {
      fname: "Please enter your firstname",
      lname: "Please enter your lastname",
      country: "Please select your country",
      gender: "Please select your gender",
      topic: {
        required: "Please select topic",
        minlength: "Please select at least 2 topic"
      },
      newpass: {
        required: "Please enter your password",
        minlength: "Your password must has at least 6 characters"
      },
      confirmpass: {
        required: "Please enter your password",
        minlength: "Your password must has at least 6 characters",
        equalTo: "Please enter the same password as above"
      }
    },
    errorPlacement:function(error, element) {
      error.insertAfter(element.nextAll().last());
    }
  });
})
