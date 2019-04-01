const initLogin = () => {
  const button = document.getElementById("landing-button");
  button.addEventListener("onClick", (event) => {
    event.preventDefault();
    console.log(event);
  })
};

export { initLogin };
