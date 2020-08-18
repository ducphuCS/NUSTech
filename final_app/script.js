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
  $("img").on({
    "click": function() {
      var title = $(this).parent().parent().find("div[name='title-post']").html();
      var source = $(this).attr("src");
      var description = $(this).parent().parent().find("div[name='description-post']").html()
      if ($("#btn-photo").hasClass("chosen")) {
        $("#modal-photo-title").html(title);
        $("#modal-photo-body").attr("src", source)
        $("#modal-photo-description").html(description);
        $("#modal-photo").modal("toggle");
      }
      else {
        $("#modal-album-title").html(title)
        $("#modal-album-description").html(description)
        $("#modal-album").modal("toggle")
      }
    }
  })
});
