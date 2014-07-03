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
//= require bootstrap
//= require lightbox-2.6.min
//= require gritter
//= require owl.carousel
//= require_tree .


$(document).ready(function() {
   $("#owl-demo").owlCarousel({
    navigation : true,
    slideSpeed : 300,
    autoPlay: 3000,
     
 	paginationSpeed : 400,
	singleItem:true
   });
});

// $(document).on('click',"#show-contact", function() {
// 	var id = $(this).val

// 	element_id = $('#show-contact').attr('id')
//   $.ajax({
//     url: "/properties/show_contact_count",
//     // beforeSend: function() {
//     //   $("#ajax-loader-big-for-favourites").show()
//     //   $('#overlay_div_for_favourites').show()
//     // },
//     data: {
//       id: $("#buy_your_favourites_select option:selected").index()
//     },
//     success: function() {
//       $('#show-contact').hide()
//       // $("#ajax-loader-big-for-favourites").hide()
//     }
//   })
// })

function fetch_prop_cont(prop_id) {
	var property_id = prop_id
  $.ajax({
    url: "/properties/show_contact_count",
    data: {
      id: property_id
    },
    complete: function(data) {
    	//alert(data.responseText);
      $('#show-contact-detail').html("<span class='label label-primary'>"+ data.responseText +"</a>")
    }
  })
}