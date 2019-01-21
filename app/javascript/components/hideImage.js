const toggleSwitch = document.querySelector(".toggle-switch");
const image = document.querySelector(".allergy-image");

function hideImage() {
  if (toggleSwitch) {
    toggleSwitch.addEventListener('click', (event) => {
      console.log("yes")
      image.classList.toggle('hidden');
    })
  }
}

export { hideImage };
