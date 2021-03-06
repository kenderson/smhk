var map_switching_time = 2000;
jQuery(document).ready(function($) {
  $('[tooltip]').each(function() {
    $(this).qtip({
      content: $(this).attr('tooltip'),
      position: {
        corner: {
          target: 'topRight',
          tooltip: 'bottomLeft'
        }
      },
      style: {
        border: {
          width: 5,
          radius: 10
        },
        padding: 10, 
        textAlign: 'center',
        tip: true, // Give it a speech bubble tip with automatic corner detection
        name: 'dark' // Style it according to the preset 'cream' style
      }
    });
  });
  $('.partners_menu_flyout').hover(  
    function () {$("li.partners_menu a.parent_a").addClass("grey_color");},   
    function () {$("li.partners_menu a.parent_a").removeClass("grey_color");}  
  );
  $('li.partners_menu').hover(  
    function () {$('.partners_menu_flyout', this).slideDown(100);},   
    function () {$('.partners_menu_flyout', this).slideUp(100);}  
  );
  $("#smhkform").validate();
  $("#lang-en").click(function(){
    $("body").changeLang({lang: "en", file: "../files/lang-example.xml"});
  });
  $("#lang-fr").click(function(){
    $("body").changeLang({lang: "fr", file: "../files/lang-example.xml"});
  });
  $('#facebox').bgiframe();
  $("a.facebox").facebox();
  $("#fairfax span").click(function(){
    $("#fredericksburg_map").hide(map_switching_time);
    $("#fairfax_map").show(map_switching_time);
  });
  $("#fredericksburg span").click(function(){
    $("#fairfax_map").hide(map_switching_time);
    $("#fredericksburg_map").show(map_switching_time);
  });
  $.fn.wait = function(time, type) {
      time = time || 1000;
      type = type || "fx";
      return this.queue(type, function() {
          var self = this;
          setTimeout(function() {
              $(self).dequeue();
          }, time);
      });
  };
});
