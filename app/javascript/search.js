import { startSearch } from "channels/search_channel";

function submitSearch(input) {
  startSearch(input.value);

  input.focus();
}

const form = document.querySelector(".js-search-box");

if (form) {
  const input = form.querySelector(".js-search-box__input");
  const button = form.querySelector(".js-search-box__button");

  const onSearchInput = (event) => {
    event.preventDefault();
    submitSearch(input);
  };

  // Search after each change in the input field
  input.addEventListener("keydown", (event) => {
    // don't prevent the default behaviour
    submitSearch(input);
  });
  input.addEventListener("change", onSearchInput);

  // Or by cicking a button
  button.addEventListener("click", onSearchInput);
}
