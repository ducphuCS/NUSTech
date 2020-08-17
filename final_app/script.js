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
});
