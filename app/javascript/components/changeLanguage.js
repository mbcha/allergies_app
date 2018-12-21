// const selected = document.querySelector('.selected')
// const options = document.querySelectorAll('.language-options div')
// const links = document.querySelectorAll('.link-to-translation')

// function changeLanguage() {
//   if (selected) {
//     options.forEach((option) => {
//       option.addEventListener('click', (event) => {
//         option.classList.add('selected');
//         options.forEach((other_option) => {
//           if (option != other_option) {
//             other_option.classList.remove('selected')
//           }
//         })
//         const code = document.querySelector('.selected p').innerText
//         links.forEach((link) => {
//           const firstPart = link.href.slice(0,-3)
//           link.href = `${firstPart}${code})`
//         })
//       })
//     })
//   }
// }

// export { changeLanguage };
