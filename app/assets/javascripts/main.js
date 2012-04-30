$(document).ready(function() {
	$(document).on("focus", ".data-datepicker", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
	});
		  
  $('[data-pjax-container]')
    .on('pjax:start', function() { $('.nav-collapse').collapse('hide') });
    
  $(document).on("ajaxComplete ready", function(){
    $("[data-behaviour~='toggle']").on('click', function() { $($(this).data('target')).toggle(); });
    
    $("[data-behaviour~='toggle-text-lenght']").on('click', function() { 
      $(this).parent('li').hide(); 
      $($(this).data('target')).show(); });
          
    $('a[rel=popover]').popover({placement: 'bottom'});        
  });
});