/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $(".submenu").addClass("icn");
    $(".submenu .menu").hide();
    $(".sidemenu li.submenu").hover(function() {
            $(this).children(".menu").toggle("slow");
            $(this).toggleClass("icn");
    });

    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        endDate: '0d',
        todayHighlight: true
    });
});