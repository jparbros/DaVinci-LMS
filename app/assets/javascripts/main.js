$(document).ready(function() {
	$(document).on("focus", ".data-datepicker", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
	});
	  	
	$('a[rel=popover]').popover({placement: 'bottom'});
	$('[data-pjax-container]')
    .on('pjax:end', function() { $('a[rel=popover]').popover({placement: 'bottom'}); });
    
		  
  $('[data-pjax-container]')
    .on('pjax:start', function() { $('.nav-collapse').collapse('hide') });
});