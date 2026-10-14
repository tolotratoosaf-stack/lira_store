const form = document.querySelector("#searchBarForm");
const search = document.querySelector("#search");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  const value = search.value.trim();

  if (!value) {
    return;
  }

  window.location.href = `../listBook/listBook.php?search=${encodeURIComponent(value)}`;
});
