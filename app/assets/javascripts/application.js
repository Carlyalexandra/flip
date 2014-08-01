// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(document).on('ready page:load', function () {

	$("#formulButton").click(function(){

		var avrPrice = Number($("#avr_").val().replace(/[^0-9\.]+/g,""));

		// var avrPrice= Number($("#avr_").html().replace(/[^0-9\.]+/g,""));
		// //document.getElementById("whatItem").innerHTML
		var seventyPercent = avrPrice * .7

		var repairCost = Number($("#repair_").val().replace(/[^0-9\.]+/g,""));
		
		var thisCost = (seventyPercent - repairCost).toFixed(2)
		// //document.getElementById("quantity").value
		var myTotal = "$"+thisCost;

		
		$("#houseCost").html(myTotal).digits()
		
	});

	// $(document).on('ajax:success', '.nav', function(e){

	    $("#signup").click(function() { 
	    	$("#joinnow").toggle();
	    	$("#loggin").hide();
	    });

	    $("#signin").click(function() { 
	    	$("#loggin").toggle();
	    	$("#joinnow").hide();
	    });

	    $("#saveto").click(function() { 
	    	$("#loggin").toggle();
	    });

	 //    $(".xout").click(function {
		// 	$("#loggin").toggle()
		// });

    
			// });



	// $("#signup").click(function() {
	// 	if ($("#joinnow").is(":hidden") || $("#loggin").is(":hidden")){
	// 		$("#joinnow").show();
	// 	}	
	// 	else {
	// 		$("#joinnow").hide();
	// 	}
		
	// });

	// $("#signin").click(function() {
	//   if ($("#joinnow").is(":hidden") || $("#loggin").is(":hidden")){
	// 	$("#loggin").show();
	//   }else{
	// 	$("#loggin").hide();
	//   }
	// });

		$.fn.digits = function(){ 
    	return this.each(function(){ 
        $(this).text( $(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") ); 
    })
}
});


// 		function validateInput() {
//     	var x = $("avr_").val()
//     	if (x == null || x == "") && ! a number{
//         alert("First name must be filled out");
//         return false;
//     }
// }


