document.addEventListener("DOMContentLoaded", function(event) {
    let ajax = new XMLHttpRequest();
    ajax.open('GET', '/list?action=list_consultas');
    ajax.send();
    ajax.onreadystatechange = function() {
        if (ajax.readyState === ajax.DONE) {
            if (ajax.status === 200) {
                let data = JSON.parse(ajax.response);
                if (data.length === 0) {
                    console.warn('I don\'t have any data to show.');
                } else {
                    let table, thead, tbody, tr, td;
                    table = document.createElement('table');
                    thead = document.createElement('thead');
                    tbody = document.createElement('tbody');
                    tr = document.createElement('tr');
                    ['Medico', 'Especialidade', 'Paciente', 'Data', 'Convenio'].forEach(item => {
                        td = document.createElement('td');
                        td.innerText = item;
                        tr.appendChild(td);
                    });
                    thead.appendChild(tr);
                    data.forEach(item => {
                        tr = document.createElement('tr');
                        item.forEach(subItem => {
                            td = document.createElement('td');
                            td.innerText = subItem;
                            tr.appendChild(td);
                        });
                        tbody.appendChild(tr);
                    });
                    [thead, tbody].forEach(item => table.append(item));
                    document.getElementById('main').appendChild(table);
                }
            } else {
                console.error('I wasn\'t able to retrieve the data for this request.');
            }
        }
    }
});