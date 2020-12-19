$(document).on('turbolinks:load',function() {
//bulk delete
  $(".index-dele-submit").hide();
  $('#selectAll').click(function() {
     if(this.checked) {
         $(':checkbox').each(function() {
             this.checked = true;
             $(".index-dele-submit").show();
          });
      } else {
        $(':checkbox').each(function() {
             this.checked = false; 
             $(".index-dele-submit").hide();
        });
      } 
  });
 
 //get select option id to pass in to hidden trainline_id  
  $(function(){
    $(document).on('change','.hidden-select-value-to', function(){
       var select_value = $(this).val();
       $('.hidden-select-value').val(select_value);

    });
  });
  
});

