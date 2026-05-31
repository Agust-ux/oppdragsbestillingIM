console.log("Landing page loaded");

const buttons = document.querySelectorAll("button");

buttons.forEach(button => {
  button.addEventListener("click", () => {
    console.log(`${button.innerText} clicked`);
  });
});