document.addEventListener("DOMContentLoaded", function(event) {
    if (document.getElementById('action').value === 'schedule') {
        var dropDown = document.getElementById('medico') || document.getElementById('especialidade');
        var AJAXString = document.getElementById('medico')? '/schedule?action=list_medicos&especialidade=' + document.getElementById('especialidade').value: '/schedule?action=list_especialidades';
        ajaxRequest('GET', AJAXString, dropDown);
    }
});
function ajaxRequest(method, url, dropDownInput) {
    var ajax = new XMLHttpRequest();
    ajax.open(method, url);
    ajax.send();
    ajax.onreadystatechange = function() {
        if (ajax.readyState === ajax.DONE) {
            updateDropDownList(dropDownInput, JSON.parse(ajax.response));
        }
    }
}

function updateDropDownList(selectInput, list) {
    selectInput.innerHTML = "";
    list.forEach(item => {
        let option = document.createElement("option");
        option.value = item;
        option.text = item;
        selectInput.add(option, null);
    });
}