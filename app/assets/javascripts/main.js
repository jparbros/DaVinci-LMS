$(document).ready(function() {
	$(document).on("focus", ".data-datepicker", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
	  });
	  
  $('[data-pjax-container]')
    .on('pjax:start', function() { $('.nav-collapse').collapse('hide') })
});