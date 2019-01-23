const toggleSwitches = document.querySelectorAll(".toggle-switch");
const images = document.querySelectorAll(".allergy-image");
const names = document.querySelectorAll(".translated-allergy");

function hideImage() {
  if (toggleSwitches.length > 1) {
    toggleSwitches.forEach(toggleSwitch => {
      toggleSwitch.addEventListener('click', (event) => {
        names.forEach((name) => {
          if (toggleSwitch.classList.contains(name.innerText.trim())) {
            images.forEach(image => {
              if (image.classList.contains(name.innerText.trim())) {
                image.classList.toggle('hidden');
              }
            })
          }
        })
      })
    })
  }
  else if (toggleSwitches.length == 1) {
    toggleSwitches[0].addEventListener('click', (event) => {
      images[0].classList.toggle('hidden');
    })
  }
}

export { hideImage };
