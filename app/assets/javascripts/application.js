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

//= require app/libs/jquery/jquery-1.11.1.min.js
//= require turbolinks
//= require highcharts
//= require highcharts/highcharts-more
//= require app/libs/bootstrap/js/bootstrap.min.js
//= require app/libs/jqueryui/jquery-ui-1.10.4.custom.min.js
//= require app/libs/jquery-ui-touch/jquery.ui.touch-punch.min.js
//= require app/libs/jquery-detectmobile/detect.js
//= require app/libs/jquery-animate-numbers/jquery.animateNumbers.js
//= require app/libs/ios7-switch/ios7.switch.js
//= require app/libs/fastclick/fastclick.js
//= require app/libs/jquery-blockui/jquery.blockUI.js
//= require app/libs/jquery-slimscroll/jquery.slimscroll.js
//= require app/libs/jquery-sparkline/jquery-sparkline.js
//= require app/libs/nifty-modal/js/classie.js
//= require app/libs/nifty-modal/js/modalEffects.js
//= require app/libs/sortable/sortable.min.js
//= require app/libs/bootstrap-fileinput/bootstrap.file-input.js
//= require app/libs/bootstrap-select2/select2.min.js
//= require app/libs/magnific-popup/jquery.magnific-popup.min.js
//= require app/libs/pace/pace.min.js
//= require app/libs/bootstrap-datepicker/js/bootstrap-datepicker.js
//= require app/libs/jquery-icheck/icheck.min.js
//= require app/libs/prettify/prettify.js
//= require app/init.js
//= require app/apps/calculator.js
//= require app/apps/todo.js
//= require app/apps/notes.js




$(document).on("ready page:load", function(){





//	if( $("#graph_container").length > 0 ){
    // graphData = $("#graph_container").data("graph-data");

		$('#graph_container').highcharts({

	        chart: {
	            polar: true,
	            type: 'line'
	        },

	        title: {
	            text: 'Budget vs spending',
	            x: -80
	        },

	        pane: {
	            size: '80%'
	        },

	        xAxis: {
	            categories: ['Sales', 'Marketing', 'Development', 'Customer Support',
	                    'Information Technology', 'Administration'],
	            tickmarkPlacement: 'on',
	            lineWidth: 0
	        },

	        yAxis: {
	            gridLineInterpolation: 'polygon',
	            lineWidth: 0,
	            min: 0
	        },

	        tooltip: {
	            shared: true,
	            pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
	        },

	        legend: {
	            align: 'right',
	            verticalAlign: 'top',
	            y: 70,
	            layout: 'vertical'
	        },

	        series: [{
	            name: 'Allocated Budget',
	            data: [43000, 19000, 60000, 35000, 17000, 10000],
	            pointPlacement: 'on'
	        }, {
	            name: 'Actual Spending',
	            data: [50000, 39000, 42000, 31000, 26000, 14000],
	            pointPlacement: 'on'
	        }]

	    });
//}


	FastClick.attach(document.body);
	//resizefunc.push("initscrolls");
//	resizefunc.push("changeptype");
	$('.sparkline').sparkline('html', { enableTagOptions: true });

	$('.animate-number').each(function(){
		$(this).animateNumbers($(this).attr("data-value"), true, parseInt($(this).attr("data-duration")));
	})

//TOOLTIP
$('body').tooltip({
  selector: "[data-toggle=tooltip]",
  container: "body"
});

//RESPONSIVE SIDEBAR


$(".open-right").click(function(e){
	$("#wrapper").toggleClass("open-right-sidebar");
	e.stopPropagation();
	$("body").trigger("resize");
});


$(".open-left").click(function(e){
	e.stopPropagation();
    $("#wrapper").toggleClass("enlarged");
    $("#wrapper").addClass("forced");

    if($("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left")){
    	$("body").removeClass("fixed-left").addClass("fixed-left-void");
    }else if(!$("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left-void")){
    	$("body").removeClass("fixed-left-void").addClass("fixed-left");
    }
    if($("#wrapper").hasClass("enlarged")){
      $(".left ul").removeAttr("style");
    }else{
      $(".subdrop").siblings("ul:first").show();
    }
    toggle_slimscroll(".slimscrollleft");
    $("body").trigger("resize");
});

// LEFT SIDE MAIN NAVIGATION
$("#sidebar-menu a").on('click',function(e){
  if(!$("#wrapper").hasClass("enlarged")){

    if($(this).parent().hasClass("has_sub")) {
      e.preventDefault();
    }

    if(!$(this).hasClass("subdrop")) {
      // hide any open menus and remove all other classes
      $("ul",$(this).parents("ul:first")).slideUp(350);
      $("a",$(this).parents("ul:first")).removeClass("subdrop");
      $("#sidebar-menu .pull-right i").removeClass("fa-angle-up").addClass("fa-angle-down");

      // open our new menu and add the open class
      $(this).next("ul").slideDown(350);
      $(this).addClass("subdrop");
      $(".pull-right i",$(this).parents(".has_sub:last")).removeClass("fa-angle-down").addClass("fa-angle-up");
      $(".pull-right i",$(this).siblings("ul")).removeClass("fa-angle-up").addClass("fa-angle-down");
    }else if($(this).hasClass("subdrop")) {
      $(this).removeClass("subdrop");
      $(this).next("ul").slideUp(350);
      $(".pull-right i",$(this).parent()).removeClass("fa-angle-up").addClass("fa-angle-down");
      //$(".pull-right i",$(this).parents("ul:eq(1)")).removeClass("fa-chevron-down").addClass("fa-chevron-left");
    }
  }
});

// NAVIGATION HIGHLIGHT & OPEN PARENT
$("#sidebar-menu ul li.has_sub a.active").parents("li:last").children("a:first").addClass("active").trigger("click");

//WIDGET ACTIONS
$(".widget-header .widget-close").on("click",function(event){
  event.preventDefault();
  $item = $(this).parents(".widget:first");
  bootbox.confirm("Are you sure to remove this widget?", function(result) {
    if(result === true){
      $item.addClass("animated bounceOutUp");
        window.setTimeout(function () {
          if($item.data("is-app")){

            $item.removeClass("animated bounceOutUp");
            if($item.hasClass("ui-draggable")){
              $item.find(".widget-popout").click();
            }
            $item.hide();
            $("a[data-app='"+$item.attr("id")+"']").addClass("clickable");
          }else{
            $item.remove();
          }
        }, 300);
    }
  });
});

$(document).on("click", ".widget-header .widget-toggle", function(event){
  event.preventDefault();
  $(this).toggleClass("closed").parents(".widget:first").find(".widget-content").slideToggle();
});

$(document).on("click", ".widget-header .widget-popout", function(event){
  event.preventDefault();
  var widget = $(this).parents(".widget:first");
  if(widget.hasClass("modal-widget")){
    $("i",this).removeClass("icon-window").addClass("icon-publish");
    widget.removeAttr("style").removeClass("modal-widget");
    widget.find(".widget-maximize,.widget-toggle").removeClass("nevershow");
    widget.draggable("destroy").resizable("destroy");
  }else{
    widget.removeClass("maximized");
    widget.find(".widget-maximize,.widget-toggle").addClass("nevershow");
    $("i",this).removeClass("icon-publish").addClass("icon-window");
    var w = widget.width();
    var h = widget.height();
    widget.addClass("modal-widget").removeAttr("style").width(w).height(h);
    $(widget).draggable({ handle: ".widget-header",containment: ".content-page" }).css({"left":widget.position().left-2,"top":widget.position().top-2}).resizable({minHeight: 150,minWidth: 200});
  }
  window.setTimeout(function () {
    $("body").trigger("resize");
  },300);
});

$("a[data-app]").each(function(e){
    var app = $(this).data("app");
    var status = $(this).data("status");
    $("#"+app).data("is-app",true);
    if(status == "inactive"){
      $("#"+app).hide();
      $(this).addClass("clickable");
    }
});

$(document).on("click", "a[data-app].clickable", function(event){
    event.preventDefault();
    $(this).removeClass("clickable");
    var app = $(this).data("app");
    $("#"+app).show();
    $("#"+app+" .widget-popout").click();
    topd = $("#"+app).offset().top - $(window).scrollTop();
    $("#"+app).css({"left":"10","top":-(topd-60)+"px"}).addClass("fadeInDown animated");
    window.setTimeout(function () {
      $("#"+app).removeClass("fadeInDown animated");
    }, 300);
});

$(document).on("click", ".widget", function(){
    if($(this).hasClass("modal-widget")){
      $(".modal-widget").css("z-index",5);
      $(this).css("z-index",6);
    }
});

$(document).on("click", '.widget .reload', function (event) {
  event.preventDefault();
  var el = $(this).parents(".widget:first");
  blockUI(el);
    window.setTimeout(function () {
       unblockUI(el);
    }, 1000);
});

$(document).on("click", ".widget-header .widget-maximize", function(event){
    event.preventDefault();
    $(this).parents(".widget:first").removeAttr("style").toggleClass("maximized");
    $("i",this).toggleClass("icon-resize-full-1").toggleClass("icon-resize-small-1");
    $(this).parents(".widget:first").find(".widget-toggle").toggleClass("nevershow");
    $("body").trigger("resize");
    return false;
});

$( ".portlets" ).sortable({
    connectWith: ".portlets",
    handle: ".widget-header",
    cancel: ".modal-widget",
    opacity: 0.5,
    dropOnEmpty: true,
    forcePlaceholderSize: true,
    receive: function(event, ui) {$("body").trigger("resize")}
});

// Init Code Highlighter
prettyPrint();

//RUN RESIZE ITEMS
$(window).resize(debounce(resizeitems,100));
$("body").trigger("resize");

//SELECT
//$('.selectpicker').selectpicker();


//FILE INPUT
$('input[type=file]').bootstrapFileInput();


//DATE PICKER
$('.datepicker-input').datepicker();


//ICHECK
$('input:not(.ios-switch)').iCheck({
  checkboxClass: 'icheckbox_square-aero',
  radioClass: 'iradio_square-aero',
  increaseArea: '20%' // optional
});

// IOS7 SWITCH
$(".ios-switch").each(function(){
    mySwitch = new Switch(this);
});

//GALLERY
$('.gallery-wrap').each(function() { // the containers for all your galleries
    $(this).magnificPopup({
        delegate: 'a.zooming', // the selector for gallery item
        type: 'image',
    		removalDelay: 300,
    		mainClass: 'mfp-fade',
        gallery: {
          enabled:true
        }
    });
});



});
