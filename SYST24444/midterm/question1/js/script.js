        function searchCar()
        {
            var xml=new XMLHttpRequest();
            xml.open('GET','../xml/autogen.xml',false);
            xml.send();
            var xmlData=xml.response;



            document.write('<table border="1">');
            document.write('<tr><th rowspan="2">Serial Number</th><th colspan="2">Make</th>'+
                           '<th colspan="3">Model</th><th rowspan="2">Kilometer</th>');
            document.write('<tr><th>Price</th><th>Last name</th>' +
                           '<th>Month</th><th>Day</th><th>Year</th></tr>');

            if(xmlData)
            {
                xmlData=(new DOMParser()).parseFromString(xml.responseText, 'text/xml');
                var carInfo=xmlData.getElementsByTagName("carInfo");

                for (var i=0; i < carInfo.length; ++i) {
                    var car=carInfo[i].getElementsByTagName("car")[0].firstChild.data;
                    var make=carInfo[i].getElementsByTagName("make")[0].getElementsByTagName("lname")[0].firstChild.data;
                    var model=carInfo[i].getElementsByTagName("model")[0].getElementsByTagName("month")[0].firstChild.data;
                }

                for(var i=0; i<carInfo.length; i++)
                {
                    var car=carInfo[i].getElementsByTagName("car")[0].firstChild.data;
                    var serialNumber=carInfo[i].getElementsByTagName("serialNumber")[0].getElementsByTagName("fname")[0].firstChild.data;
                    var make=carInfo[i].getElementsByTagName("make")[0].getElementsByTagName("lname")[0].firstChild.data;

                    var model=carInfo[i].getElementsByTagName("model")[0].getElementsByTagName("month")[0].firstChild.data;
                    var kilometer=carInfo[i].getElementsByTagName("kilometer")[0].getElementsByTagName("day")[0].firstChild.data;
                    var price=carInfo[i].getElementsByTagName("price")[0].getElementsByTagName("year")[0].firstChild.data;

                    document.write("<td>"+serialNumber+"</td>");
                    document.write("<td>"+make+"</td>");
                    document.write("<td>"+model+"</td>");
                    document.write("<td>"+kilometer+"</td>");
                    document.write("<td>"+price+"</td>");
                }
            }
        }
