jQuery.fn.liveUpdate = function(list){
  list = jQuery(list);
  if ( list.length ) {
    var selector = list.data('list-selector');
    var list_value = list.data('list-value');
    if (selector){
      var rows = list.children(selector);
      var cache = rows.map(function(){        
        return $(this).data('list-value').toLowerCase();
      });
      
    }else{
      var rows = list.children('li');
      var cache = rows.map(function(){
        return $('a', this)[0].innerHTML.toLowerCase();
      });
      
    }
    
    this
      .keyup(filter).keyup()
      .parents('form').submit(function(){
        return false;
      });
  }
    
  return this;
    
  function filter(){
    var term = jQuery.trim( jQuery(this).val().toLowerCase() ), scores = [];
    
    if ( !term ) {
      rows.show();
    } else {
      rows.hide();

      cache.each(function(i){
        var score = this.score(term);
        if (score > 0) { scores.push([score, i]); }
      });

      jQuery.each(scores.sort(function(a, b){return b[0] - a[0];}), function(){
        jQuery(rows[ this[1] ]).show();
      });
    }
  }
};

$(document).ready(function() {
	$(document).on("focus", "[data-list-filter]", function(e){
      $(this).liveUpdate($(this).data('target-list'))
	  });
});