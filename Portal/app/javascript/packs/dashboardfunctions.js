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
  // $('#train_line_ids_').click(function() {
  //   if $("#selectAll").checked=false && this.checked{
  //     $(".index-dele-submit").show();
  //   }

  //   else if($("#selectAll").checked=true && this.checked){
  //     $(".index-dele-submit").show();
  //   }
  //   else{
  //     $(".index-dele-submit").hide();
  //   }
  // });

  
});

