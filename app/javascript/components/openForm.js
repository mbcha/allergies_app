const contacts = document.querySelector(".contacts");

const contactNames = document.querySelectorAll(".contact-name");
const emergencyDiv = document.querySelector('.contacts-container');

const newContactButton = document.querySelector('.new-contact-button');
const newContactForm = document.querySelector('.new-contact-form');
const cancel = document.querySelector('.add-cancel');

function openForm() {
  if (contactNames && contactNames.length > 0) {
    contactNames.forEach((name) => {
      let compact = name.innerText.replace(" ", "")

      let edit = document.querySelector(`.edit-${compact}`);
      let editCancel = document.querySelector(`.edit-cancel-${compact}`);

      let form = document.querySelector(`.form-${compact}`);
      let info = document.querySelector(`.info-${compact}`);

      edit.addEventListener('click', (event) => {
        form.classList.toggle('hidden');
        info.classList.toggle('hidden');
      })
      editCancel.addEventListener('click', (event) => {
        form.classList.add('hidden');
        info.classList.remove('hidden');
    })
    })
  }
  if (emergencyDiv) {
    $(document).ready(function () {
      if(window.location.href.indexOf("#newcontact") > -1) {
        newContactForm.classList.remove('hidden');
        newContactButton.classList.add('hidden');
        contacts.classList.add('hidden');
      } else if(window.location.href.indexOf("#updatecontact") > -1) {
        let a = window.location.href;
        let b = a.match(/#([a-z]+)#/i)

        let form = document.querySelector(`.form-${b[1]}`);
        let info = document.querySelector(`.info-${b[1]}`);

        form.classList.toggle('hidden');
        info.classList.toggle('hidden');
      }
    })
    newContactButton.addEventListener('click', (event) => {
      newContactForm.classList.remove('hidden');
      newContactButton.classList.add('hidden');
      contacts.classList.add('hidden');
    })
    cancel.addEventListener('click', (event) => {
      newContactForm.classList.add('hidden');
      newContactButton.classList.remove('hidden');
      contacts.classList.remove('hidden');
    })
  }
}

export { openForm };
