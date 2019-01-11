const input = document.querySelector(".search-input");
const form = document.getElementById("form");
const results = document.querySelectorAll(".results li");
const countriesDiv = document.querySelector(".create-user-country");

let showResults = (event) => {
  let num = 1

  results.forEach((result) => {
    result.classList.add('hidden');
    result.classList.remove('selected');

    let match = result.innerText.match(new RegExp('^[\n\ ]+' + input.value, "i"))

    if (match) {
      if (num < 11) {
        result.classList.remove('hidden');
        result.classList.add('selected');
      }
      num += 1
    }
  })
};

let pickFirstResult = (event) => {
  event.preventDefault();
  const first_result = document.querySelector(".selected a");
  if (first_result && countriesDiv) {
    first_result.click();
  } else if (!countriesDiv) {
    if (first_result) {
      input.value = first_result.innerText
      form.submit();
    } else {
      form.submit();
    }
  }
};

function search() {
  if (input) {
    input.addEventListener("keyup", showResults);
    form.addEventListener("submit", pickFirstResult);
  }
};

export { search };
