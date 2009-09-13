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

jQuery(document).ready(function($) {
	$("#main_box").fadeIn(1000);
	$("#main_box img").fadeIn(1000);
	$("#main_box h2").wait(2000).fadeIn(2000);
});