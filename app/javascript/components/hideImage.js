const toggleSwitches = document.querySelectorAll(".toggle-switch");
const images = document.querySelectorAll(".allergy-image");
const names = document.querySelectorAll(".translated-allergy");

function hideImage() {
  if (toggleSwitches.length > 1) {
    toggleSwitches.forEach(toggleSwitch => {
      toggleSwitch.addEventListener('click', (event) => {
        names.forEach((name) => {
          let nameToMatch = name.innerText.replace(" ", "").trim()
          if (toggleSwitch.classList.contains(nameToMatch)) {
            images.forEach(image => {
              if (image.classList.contains(nameToMatch)) {
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
