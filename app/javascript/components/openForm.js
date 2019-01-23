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

      // console.log(form)
      // let contactRelationship = document.querySelector(`.contact-relationship-${compact}`);
      // let contactEmail = document.querySelector(`.contact-email-${compact}`);
      // let contactNumber = document.querySelector(`.contact-number-${compact}`);
      // let editName = document.querySelector(`.contact-name-edit-${compact}`);
      // let editRelationship = document.querySelector(`.contact-relationship-edit-${compact}`);
      // let editEmail = document.querySelector(`.contact-email-edit-${compact}`);
      // let editNumber = document.querySelector(`.contact-number-edit-${compact}`);
      // let submit = document.querySelector(`.contact-edit-submit-${compact}`);

      edit.addEventListener('click', (event) => {
        form.classList.toggle('hidden');
        info.classList.toggle('hidden');
        // name.classList.toggle('hidden');
        // contactRelationship.classList.toggle('hidden');
        // contactEmail.classList.toggle('hidden');
        // contactNumber.classList.toggle('hidden');
        // editName.classList.toggle('hidden');
        // editRelationship.classList.toggle('hidden');
        // editEmail.classList.toggle('hidden');
        // editNumber.classList.toggle('hidden');
        // submit.classList.toggle('hidden');
      })
      editCancel.addEventListener('click', (event) => {
        form.classList.add('hidden');
        info.classList.remove('hidden');
      // contacts.classList.remove('hidden');
    })
    })
  }
  if (emergencyDiv) {
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
