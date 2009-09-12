var map_switching_time = 2000;
var load_string_in = "#(test)-(test)"
jQuery(document).ready(function($) {
  $("#smhkform").validate();
  $("#lang-en").click(function(){
    $("body").changeLang({lang: "en", file: "../files/lang-example.xml"});
  });
  $("#lang-fr").click(function(){
    $("body").changeLang({lang: "fr", file: "../files/lang-example.xml"});
  });
  $('#facebox').bgiframe();
  $("a.facebox").facebox();
  $("#datepicker").datepicker();
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