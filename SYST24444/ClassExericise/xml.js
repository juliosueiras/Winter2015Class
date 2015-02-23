/* globals document:false */
function readXML()
        {
            var xml=new XMLHttpRequest();
            xml.open('GET','employee.xml',false);
            xml.send();
            var xmlData=xml.response;

            document.write('<table border="1">');
            document.write('<tr><th rowspan="2">ID</th><th colspan="2">Name</th>'+
                           '<th colspan="3">Date of Birth</th><th rowspan="2">Department</th>');
            document.write('<tr><th>First name</th><th>Last name</th>' +
                           '<th>Month</th><th>Day</th><th>Year</th></tr>');

            if(xmlData)
            {
                xmlData=(new DOMParser()).parseFromString(xml.responseText, 'text/xml');
                var emp=xmlData.getElementsByTagName("employee");

                for(var i=0; i<emp.length; i++)
                {
                    var id=emp[i].getElementsByTagName("id")[0].firstChild.data;
                    var fname=emp[i].getElementsByTagName("name")[0].getElementsByTagName("fname")[0].firstChild.data;
                    var lname=emp[i].getElementsByTagName("name")[0].getElementsByTagName("lname")[0].firstChild.data;

                    var month=emp[i].getElementsByTagName("dob")[0].getElementsByTagName("month")[0].firstChild.data;
                    var day=emp[i].getElementsByTagName("dob")[0].getElementsByTagName("day")[0].firstChild.data;
                    var year=emp[i].getElementsByTagName("dob")[0].getElementsByTagName("year")[0].firstChild.data;

                    var dept=emp[i].getElementsByTagName("dept")[0].firstChild.data;
                    document.write("<tr><td>"+id+"</td>");
                    document.write("<td>"+fname+"</td>");
                    document.write("<td>"+lname+"</td>");
                    document.write("<td>"+month+"</td>");
                    document.write("<td>"+day+"</td>");
                    document.write("<td>"+year+"</td>");
                    document.write("<td>"+dept+"</td><tr>");
                }
            }
        }

