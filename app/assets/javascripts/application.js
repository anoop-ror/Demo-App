s// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree 
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require sweetalert
//= require autocomplete-rails
//= require bootstrap-datepicker



// chackout 

sweetAlert("Awesome!");
$(document).ready(function () {
//Initialize tooltips
// $('.nav-tabs > li a[title]').tooltip();
//Wizard
$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

var $target = $(e.target);

if ($target.parent().hasClass('disabled')) {
return false;
}
});

$(".next-step").click(function (e) {

var $active = $('.wizard .breadcrumb_checkout li.active');
$active.next().removeClass('disabled');
nextTab($active);

});
$(".prev-step").click(function (e) {zzz

var $active = $('.wizard .breadcrumb_checkout li.active');
prevTab($active);

});
});

function nextTab(elem) {
$(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
$(elem).prev().find('a[data-toggle="tab"]').click();
}

