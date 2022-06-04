let isOpen = false;

function toggleNavBar() {
    const navBarComponent = document.getElementsByTagName('nav-bar-component')[0];
    const navBarBackground = document.getElementsByTagName('nav-bar-background')[0];

    if (navBarComponent.style.marginLeft === '') {
        navBarComponent.style.marginLeft = '-400px';
        navBarBackground.style.display = 'none';
    } else {
        navBarComponent.style.marginLeft = '';
        navBarBackground.style.display = 'block';
    }
}

function updateToggleSelectType() {
    const selectType = document.getElementById('select-type');

    const icon = selectType.querySelector("i:nth-child(3)");

    const items = document.getElementById("select-type-items");

    if (isOpen) {
        icon.classList.remove('fa-caret-down');
        icon.classList.add('fa-caret-up');
        items.style.display = 'flex';
    } else {
        icon.classList.remove('fa-caret-up');
        icon.classList.add('fa-caret-down');
        items.style.display = 'none';
    }
}

function toggleSelectType() {
    isOpen = !isOpen;
    updateToggleSelectType();
}

function openSearch(){
    let element = document.getElementsByClassName("web__header__searchbar__popup")[0];
    element.style.display="block";
    document.getElementById("search-bar-popup").focus();
}
function closeSearch(){
    let element = document.getElementsByClassName("web__header__searchbar__popup")[0];
    element.style.display="none";
}


updateToggleSelectType();

