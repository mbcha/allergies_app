const input = document.querySelector(".search-input");
const form = document.querySelector(".form");
const results = document.querySelectorAll(".results li");
const allergiesDiv = document.querySelector(".create-user-allergy");
const submitAllergy = document.querySelector(".submit-allergy-button");

function search() {
  if (allergiesDiv) {
    input.addEventListener("keyup", showResults);
    form.addEventListener("submit", pickFirstResult);
  }
  else if (input) {
    input.addEventListener("keyup", showResults);
    form.addEventListener("submit", pickFirstResult);
    results.forEach(submitIfClicked);
  }
};

const showResults = (event) => {
  let num = 1;

  results.forEach((result) => {
    result.classList.add('hidden');
    result.classList.remove('selected');
    if (allergiesDiv) {
      submitAllergy.classList.add('hidden');
    }

    if (input.value.length > 0) {
      let match = result.innerText.match(new RegExp('^[\n\ ]+' + input.value, "i"))

      if (match) {
        if (num < 11) {
          result.classList.remove('hidden');
          result.classList.add('selected');
        }
        num += 1
      }
    }
    let first_result = document.querySelector(".selected");

    if (first_result == null && allergiesDiv) {
      submitAllergy.classList.remove('hidden');
    }
  });

  if (allergiesDiv) {
    if (!submitAllergy.classList.contains('hidden')) {
      submitAllergy.value = "Add";
      if (input.value != '') {
        submitAllergy.value += ` '${input.value}'`;
        submitAllergy.addEventListener('click', (event) => {
          form.submit();
        })
      }
    }
  }
};

const pickFirstResult = (event) => {
  if (submitAllergy.classList.contains('hidden')) {
    event.preventDefault();
    let first_result = document.querySelector(".selected");
    if (first_result && allergiesDiv == null)
    {
      first_result.click();
    }
    else if (first_result)
    {
      input.value = first_result.innerText
      form.submit();
    }
  }
  else
  {
    form.submit();
  }
};

const submitIfClicked = result => {
  result.addEventListener('click', (event) => {
    event.preventDefault();
    input.value = event.currentTarget.innerText;
    form.submit();
  })
};

export { search };
