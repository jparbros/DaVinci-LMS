$(document).ready(function() {
	$(document).on("focus", ".data-datepicker", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
	});
	  
	$(document).on("mouseover", "a[rel=popover]", function(e){
	    $(this).popover({placement: 'bottom'});
	    $(this).popover('show');
	});
		  
  $('[data-pjax-container]')
    .on('pjax:start', function() { $('.nav-collapse').collapse('hide') })
});