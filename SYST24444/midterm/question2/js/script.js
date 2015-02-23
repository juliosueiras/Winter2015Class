/*global $:false */

function switchColor(targetItem) {

    var tempColor = $(targetItem).css("color");

    $(targetItem).css("color", $(targetItem).css("background-color"));

    $(targetItem).css("background-color", tempColor);



}


$("h1").on("click", switchColor("h1"));


$(".flowerImage").focusin( function () {
    var width = $(this).css("width");
    var height = $(this).css("height");
    $(this).css("width", width*200 );
    $(this).css("height", height*200 );
});

$(".flowerImage").focusout( function () {
    var width = $(this).css("width");
    var height = $(this).css("height");
    $(this).css("width", width/200 );
    $(this).css("height", height/200 );
});
