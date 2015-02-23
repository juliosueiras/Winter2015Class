/*global $:false */

function switchColor(targetItem) {

    var tempColor = $(targetItem).css("color");

    $(targetItem).css("color", $(targetItem).css("background-color"));

    $(targetItem).css("background-color", tempColor);



}

$("h1").on("click", switchColor("h1"));
