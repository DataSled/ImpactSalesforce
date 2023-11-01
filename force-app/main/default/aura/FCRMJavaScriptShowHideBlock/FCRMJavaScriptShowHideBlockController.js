({
	jqueryLoadedFCRM : function(component, event, helper) {
// START
jQuery(document).ready(function(){
  jQuery(".msgHide").click(function(){
	jQuery(".msg-slide").slideUp("slow");
    jQuery(".msgShow").delay(2000).slideDown("slow");

  });
jQuery(".msgShow").click(function(){
    jQuery(".msgShow").slideUp("slow");
    jQuery(".msg-slide").delay(600).slideDown("slow");
  });
});
// END        
        
	}
})