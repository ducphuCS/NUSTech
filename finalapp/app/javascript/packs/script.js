$(document).ready(function() {
  var btnPhoto = $("#btn-photo");
  var btnAlbum = $("#btn-album")
  btnPhoto.on({
    "click": function() {
      if (!btnPhoto.hasClass("chosen")) {
        btnPhoto.addClass("chosen")
        btnAlbum.removeClass("chosen")
        btnPhoto.removeClass("bg-white")
        btnAlbum.addClass("bg-white")
      }
    }
  })
  btnAlbum.on({
    "click": function() {
      if (!btnAlbum.hasClass("chosen")) {
        btnAlbum.addClass("chosen")
        btnPhoto.removeClass("chosen")
        btnAlbum.removeClass("bg-white")
        btnPhoto.addClass("bg-white")
      }
    }
  })
  $(".love").on({
    "click": function() {
      var icon = $(this).children("svg");
      var fill_color = icon.attr("fill");
      if (fill_color == "rgb(60, 90, 154)"){
        $(icon).attr("fill","lightgrey");
        $(this).children("span").text(parseInt($(this).children("span").text()) - 1);
      }
      else {
        $(icon).attr("fill", "rgb(60, 90, 154)");
        $(this).children("span").text(parseInt($(this).children("span").text()) + 1);
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
        $("#modal-photo").modal('toggle')
      }
      else {
        $("#modal-album-title").html(title)
        $("#modal-album-description").html(description)
        // this is for source of picture in album
        $("#modal-album").modal('toggle')
      }
    }
  })
  $(".photo-modal-close").on( {
    "click": function() {
      $("#modal-photo").toggle();
    }
  })
  $(".album-modal-close").on( {
    "click": function() {
      $("#modal-album").toggle();
    }
  })
  $(".carousel-control-prev").on( {
    "click": function() {
      var inner = $(".carousel-inner")
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active')
      if (active.is(':first-child')) {
        active.removeClass("active")
        inner.children().last().addClass("active")
      }
      else {
        active.prev().addClass("active")
        active.removeClass("active")
      }
    }
  })
  $(".carousel-control-next").on( {
    "click": function() {
      var inner = $(".carousel-inner")
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active')
      if (active.is(':last-child')) {
        active.removeClass("active")
        inner.children().first().addClass("active")
      }
      else {
        active.next().addClass("active")
        active.removeClass("active")
      }
    }
  })
  $("button[name='follow']").on({
    "click": function() {
      if ($(this).hasClass("followed")) {
        $(this).removeClass("followed")
        $(this).addClass("follow")
        $(this).html("follow")
      }
      else {
        $(this).removeClass("follow")
        $(this).addClass("followed")
        $(this).html("following")
      }
    }
  })
  $(".tab").on({
    "click": function() {
      var others = $(".tab").not(this);
      setAllTabOff();
      $(this).removeClass("text-secondary");
      $(this).addClass("text-color");
      var tabName = $(this).attr("name") + "-tab"
      $("div[name="+tabName+"]").removeClass("d-none")
      // $("div[name=tabName]").addClass("d-block")
      others.map(function() {
        $(this).removeClass("text-color");
        $(this).addClass("text-secondary");
      })
    }
  })
});
function setAllTabOff() {
  $("div[name='photos-tab']").addClass("d-none");
  $("div[name='albums-tab']").addClass("d-none");
  $("div[name='followings-tab']").addClass("d-none");
  $("div[name='followers-tab']").addClass("d-none")
}
