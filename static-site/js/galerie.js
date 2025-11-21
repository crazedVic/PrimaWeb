YAHOO.namespace("container");

var images = document.getElementById('uscontent').getElementsByTagName('img');

var galleryContainer = function() {
  YAHOO.container.gallery = new YAHOO.widget.Panel("galerie", { width:"auto", visible:false, constraintoviewport:true, modal:true } );
  YAHOO.container.gallery.render();
  for ( var x=0; x<images.length; x++) {
    images[x].style.cursor = "pointer";
  }
};

var galleryView = function(e) {
  var displayGallery = function() {
    YAHOO.container.gallery.show();
    YAHOO.container.gallery.center();
  }

  var target = YAHOO.util.Event.getTarget(e);
  var imgsrc = target.src.split('/')[target.src.split('/').length - 1];
  var img = '/images/edm/' + imgsrc.split('_')[0] + '.jpg';
  document.getElementById('imggalerie').innerHTML = '<img id="galimg" src="' + img +'" alt="" />';
  YAHOO.container.gallery.render();
  YAHOO.util.Event.on("galimg", "load", displayGallery);
  YAHOO.util.Event.stopEvent(e);
};

YAHOO.util.Event.addListener(window, "load", galleryContainer);
YAHOO.util.Event.addListener(images, "click", galleryView);
