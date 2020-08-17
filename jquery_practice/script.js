$(document).ready(function() {
  console.log("document loaded");
  var picture = $(".picture");
  var btn =  $("#click");
  var arr = ["img/cat.jpg", "img/doggo.jpeg", "img/cool.jpg"]
  var i = 0;
  $("#button-container button").on({
    "click": function() {
      i++;
      if (i == arr.length) i -= arr.length;
      picture.attr({src: arr[i], alt: "img"});
      $(this).html("Next");
    },
    "mouseover": function() {
      $(this).css("background-color", "lightblue");
    },
    "mouseout": function() {
      $(this).css("background-color", "lightgrey")
    }
  });
  $("div").has($("[name='text']")).css({
    "width":"600px",
    "margin": "auto",
    "color" : "darkgreen",
  });
  $("button.submit").eq(0).click( function() {
    var input = $("input[name='text']");
    if (input.val() != "") {
      $("#chat-area").val($("#chat-area").val() + input.val() + "\n");
      $("#chat-area").scrollTop($("#chat-area").height());

      var newmess = $("<p/>", {
        html: input.val(),
        css: {
          "border-radius": "5px",
          "text-align": "right",
          "background-color": "lightblue",
          "height": "auto",
          "width": "100%",
          "border": "1px solid black",
          "float": "right",
        }
      });
      newmess.appendTo("span.chat-area");
      $("span.chat-area").scrollTop($("span.chat-area").height())
    }
  });
  $("button.submit").eq(1).click( function() {
    $("#chat-area").val("");
    $("span.chat-area").empty();
  });
  var glulu = $(".slide-btn").parent().children("p");
  $(".slide-btn").first().click(function() {
    $(this).siblings("p").slideUp(2000);
  });
  $(".slide-btn").eq(1).click(function () {
    glulu.fadeIn(2000);
  });
  $("div .toggle").click(function () {
    glulu.slideToggle(2000);
  });
  $("#stop").click(function() {
    glulu.stop();
  });
  $("#table").delegate("td,th", {
    "click": function(event) {
    console.log("event object: "); console.dir(event);
    $(this).toggleClass("chosen");
    },
    "mouseover": function(event) {
      $(this).css("font-size", "20px");
    },
    "mouseout": function(event) {
      $(this).css("font-size", "inherit");
    }
  });
  $("#new-row").on("click","button", function() {
    console.log("button pressed");
    if ($("#name").val() != "" & $("#birth-year").val() != "") {
      var table = $("#table");
      var rows = table.children().children().length;
      var new_row = $("<tr/>", {
        html: "<td>"+rows+"</td><td>"+$("#name").val()+"</td><td>"+$("#birth-year").val()+"</td>",
      });
      new_row.appendTo(table);
    }
  })
  $("#new-row").on({
    "keydown": function(event) {
      if (event.key == "Enter") {
        if ($("#name").val() != "" & $("#birth-year").val() != "") {
          $("#new-row button").trigger("click");
        }
        $("#name").trigger("focus");
        $("#name").val("");
        $("#birth-year").val("");
      }
    }
  },"#name,#birth-year")
  $(".selector").change(function() {
    if ($(".selector").val() == "default") {
      console.log("color: default");
      $("#table").css("background-color", "white")
    }
    else {
        $("#table").css("background-color", "lightgrey")
      }
  });
  $("input[name='text']").on({
      "keydown": function() {
        if(event.key == "Enter") {
          if ($(this).val() != "") $("button.submit").eq(0).trigger("click");
          $(this).val("");
      }
      // "focus": function() {
      //   var texting = $
      // }
    }
  })
});
