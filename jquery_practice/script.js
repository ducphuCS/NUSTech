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
    if ($(":text").val() != "")
      $("#chat-area").val($("#chat-area").val() + $(":text").val() + "\n");
  });
  $("button.submit").eq(1).click( function() {
    $("#chat-area").val("");
  });
  var glulu = $(".slide-btn").parent().children("p");
  $(".slide-btn").first().click(function() {
    $(this).siblings("p").slideUp(2000);
  });
  $(".slide-btn").eq(1).click(function () {
    $(this).nextAll().last().fadeIn(2000);
  });
  $("div .toggle").click(function () {
    glulu.fadeToggle(2000);
  });
  $("#stop").click(function() {
    console.log("stop pressed");
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
    var table = $("#table");
    var rows = table.children().children().length;
    table.append("<tr><td>"+rows+"</td><td>"+$("#name").val()+"</td><td>"+$("#birth-year").val()+"</td></tr>");
  })
  $("#new-row").on({
    "keydown": function(event) {
      if (event.key == "Enter") {
        if ($("#name").val() != "" & $("#birth-year").val() != "") {
          $("#new-row button").trigger("click");
        }
        $("#name").trigger("focus");
      }
    }
  },"#name,#birth-year")
});
