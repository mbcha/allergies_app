import Typed from 'typed.js';

const search = document.querySelector(".typed-text");

const typedText = () => {
  if (search) {
    new Typed('.typed-text', {
      strings: ["Search"],
      attr: 'placeholder',
      typeSpeed: 100,
      loop: true
    });
  }
};

export { typedText };
