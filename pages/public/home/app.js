let searchBar = document.querySelector("#searchBar");
let inputSearch = document.querySelector("input[type='search']");


searchBar.addEventListener("submit",(e)=>{
    e.preventDefault();
    if(!inputSearch.value.trim()) {
        return;
    }
    window.location.href = `../listBook/listBook.php?search=${encodeURIComponent(inputSearch.value.trim())}`;
})