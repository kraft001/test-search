// we need to import sendMessage from our client/chat.js
import { searchChannel } from "channels/search_channel";

function startSearch(input) {
  searchChannel.start(input.value);

  input.focus();
}

const form = document.querySelector(".js-search-box");

if (form) {
  const input = form.querySelector(".js-search-box__input");
  const button = form.querySelector(".js-search-box__button");

  // Search after each change in the input field
  // input.addEventListener("change", event => {
  //   event.preventDefault();
  //   startSearch(input);
  // });

  // Or by cicking a button
  button.addEventListener("click", event => {
    event.preventDefault();
    startSearch(input);
  });
}
