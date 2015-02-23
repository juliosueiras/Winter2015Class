function readXML() {
    var xml=new XMLHttpRequest();
    xml.open('GET','empleyee.xml',false);
    xml.send();
    var xmlData=xml.response;

}
