// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";
import "packs/adminlte.min";
import "packs/OverlayScrollbars.min";
import "packs/dashboard2";
import "packs/dashboardfunctions";
import "packs/eip";
import $ from 'jquery';

window.jQuery = $;
window.$ = $;
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

global.toastr = require("toastr")

toastr.options = {
	"positionClass": "toast-bottom-right",
	
}

$(document).on('turbolinks:load',function() {
	
		
	 $('.editable').jinplace({
	 	
	 });


   
  
});


