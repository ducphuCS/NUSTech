$(document).ready(function() {
  var btnPhoto = $("#btn-photo");
  var btnAlbum = $("#btn-album")
  btnPhoto.on({
    "click": function() {
      if (!btnPhoto.hasClass("chosen")) {
        btnPhoto.addClass("chosen")
        btnAlbum.removeClass("chosen")
      }
    }
  })
  btnAlbum.on({
    "click": function() {
      if (!btnAlbum.hasClass("chosen")) {
        btnAlbum.addClass("chosen")
        btnPhoto.removeClass("chosen")
      }
    }
  })
  $(".love").on({
    "click": function() {
      var icon = $(this).children("svg");
      var fill_color = icon.attr("fill");
      if (fill_color == "rgb(60, 90, 154)")
        $(icon).attr("fill","lightgrey");
      else {
        $(icon).attr("fill", "rgb(60, 90, 154)");
      }
    }
  })
});
