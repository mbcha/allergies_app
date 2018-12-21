const warning = document.querySelector('.warning')
const message = document.querySelector('.message')
const name = document.querySelector('.translated-name')
const nameInput = document.querySelector('.name-input')
const warningInput = document.querySelector('.warning-input')
const messageInput = document.querySelector('.message-input')
const form = document.querySelector('.update-translation')

function translate() {

  if (message) {
    name.addEventListener("DOMSubtreeModified", (event) => {
      if (message.innerText != "This person suffers from food allergies") {
        nameInput.value = name.innerText;
        messageInput.value = warning.innerText + ":" + message.innerText;
        form.submit();
      }
    })
  }
}

export { translate };
