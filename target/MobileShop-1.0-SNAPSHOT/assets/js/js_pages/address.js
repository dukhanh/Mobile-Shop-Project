function defaultProvince(province){
    const mySelect = document.getElementById('ls_province');
    for( let i, j = 0; i = mySelect.options[j]; j++) {
        if(i.value === province) {
            mySelect.selectedIndex = j;
            break;
        }
    }

}

function defaultDistrict(district){
    const mySelect = document.getElementById('ls_district');
    for( let i, j = 0; i = mySelect.options[j]; j++) {
        if(i.value === district) {
            mySelect.selectedIndex = j;
            break;
        }
    }
}

function defaultWard(ward){
    const mySelect = document.getElementById('ls_ward');
    for( let i, j = 0; i = mySelect.options[j]; j++) {
        if(i.value === ward) {
            mySelect.selectedIndex = j;
            break;
        }
    }
}