$(document).ready(function() {
	$(document).on("focus", ".data-datepicker", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
	});
		  
  $('[data-pjax-container]')
    .on('pjax:start', function() { $('.nav-collapse').collapse('hide') });
    
  $(document).on('click', "[data-behaviour~='toggle']", function() { 
      $($(this).data('target')).toggle();
      alternative_text = $(this).data('alternative-text');
      $(this).data('alternative-text', $(this).html());
      $(this).html(alternative_text);
    });
  
  $(document).on('click', "[data-behaviour~='toggle-text-length']", function() { 
      $(this).parent('li').hide(); 
      $($(this).data('target')).show(); 
    });
    
  $(document).on('hover', '.title', function(){
    $('a[rel=popover]').popover({placement: 'bottom'});
  });
  
});