const card = document.querySelector("#authCard");
const showRegister = document.querySelector("#showRegister");
const showLogin = document.querySelector("#showLogin");
const front = document.querySelector(".card-front");
const back = document.querySelector(".card-back");

const form = document.querySelector("form");

const loginEmail = document.querySelector("#loginEmail");
const loginPassword = document.querySelector("#loginPassword");

form.addEventListener("submit", (e) => {
  const email = loginEmail.value.trim();
  const password = loginPassword.value;

  if (!email || !password) {
    e.preventDefault();
    alert("Veuillez remplir tous les champs !");
  }
});

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
