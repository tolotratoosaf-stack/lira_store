const inputSearch = document.querySelector("input[type='search']");
const form = document.querySelector("#book-filter-form");

console.log("JS chargé !");
console.log("Formulaire trouvé :", form);

form.addEventListener("reset", (e) => {
    e.preventDefault();
    const search = new URLSearchParams(window.location.search).get("search");
    console.log("Reset");
    window.location.href = search
        ? `listBook.php?search=${encodeURIComponent(search)}`
        : "listBook.php";
});