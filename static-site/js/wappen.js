YAHOO.namespace("container");

var images = document.getElementById('wacontent').getElementsByTagName('img');

var wappenContainer = function() {
  YAHOO.container.wappenGallery = new YAHOO.widget.Panel("wappencontainer", { width:"auto", visible:false, constraintoviewport:true, modal:true } );
  YAHOO.container.wappenGallery.render();
  for ( var x=0; x<images.length; x++) {
    images[x].style.cursor = "pointer";
  }
};

var wappenView = function(e) {
  var displayWappen = function() {
    YAHOO.container.wappenGallery.show();
    YAHOO.container.wappenGallery.center();
  }
  var target = YAHOO.util.Event.getTarget(e);
  var imgsrc = target.src.split('/')[target.src.split('/').length - 1];
  var img = '/images/shields_sm/' + imgsrc.split('-')[0] + '.png';
  document.getElementById('wappengalerie').innerHTML = '<img id="waimg" src="' + img +'" alt="" />';
  document.getElementById('wappenheader').innerHTML = target.alt;
  YAHOO.container.wappenGallery.render();
  YAHOO.util.Event.on("waimg", "load", displayWappen);
  YAHOO.util.Event.stopEvent(e);
};

YAHOO.util.Event.addListener(window, "load", wappenContainer);
YAHOO.util.Event.addListener(images, "click", wappenView);
