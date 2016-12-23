// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require app.min
//= require demo
//= require util
//= require plugins/sparkline/jquery.sparkline.min
//= require plugins/jvectormap/jquery-jvectormap-1.2.2.min
//= require plugins/jvectormap/jquery-jvectormap-world-mill-en
//= require plugins/knob/jquery.knob
//= require plugins/daterangepicker/daterangepicker
//= require plugins/datepicker/bootstrap-datepicker
//= require plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min
//= require plugins/slimScroll/jquery.slimscroll.min
//= require plugins/fastclick/fastclick
//= require plugins/iCheck/icheck.min
//= require plugins/datatables/jquery.dataTables.min
//= require plugins/morris/morris.min
//= require plugins/datatables/dataTables.bootstrap.min
//= require plugins/select2/select2.full.min
//= require cocoon
//= require jquery-ui


$(document).ready(function() {
  $('.has-tooltip').tooltip();
});


//função para capturar paramentros URL
$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}
