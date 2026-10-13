const card = document.querySelector("#authCard");
const showRegister = document.querySelector("#showRegister");
const showLogin = document.querySelector("#showLogin");
const front = document.querySelector(".card-front");
const back = document.querySelector(".card-back");

function setFace(showBack) {
  card.classList.toggle("is-flipped", showBack);

  front.inert = showBack;
  back.inert = !showBack;
}

setFace(false);

showRegister.addEventListener("click", () => {
  setFace(true);
});

showLogin.addEventListener("click", () => {
  setFace(false);
});
