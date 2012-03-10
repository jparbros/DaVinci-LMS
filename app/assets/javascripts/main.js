$(document).ready(function() {
	// $('.data-datepicker').live().datepicker({'format': 'yyyy-mm-dd', 'weekstart': 1});
	$(document).on("focus", ".data-datepicker", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1});
	  });
});