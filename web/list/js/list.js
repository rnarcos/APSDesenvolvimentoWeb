document.addEventListener("DOMContentLoaded", function(event) {
   var ajax = new XMLHttpRequest();
    ajax.open('GET', '/list?action=list_consultas');
    ajax.send();
    ajax.onreadystatechange = function() {
        if (ajax.readyState === ajax.DONE) {
            var tbody = document.getElementsByTagName('tbody')[0];
            
            JSON.parse(ajax.response).forEach(item => {
                var tr = document.createElement("tr");
                item.forEach(subItem => {
                    var td = document.createElement("td");
                    td.innerText = subItem;
                    tr.appendChild(td);
                });
                tbody.appendChild(tr);
            });
        }
    }
});