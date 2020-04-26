import consumer from "./consumer"
import { updateArticles } from "articles"

const searchChannel = consumer.subscriptions.create("SearchChannel", {
  received: function(data) {
    console.log('-------------- Received');
    console.log(data);
    updateArticles(data.data);
  },

  start: function(searchString) {
    this.perform('search', { text: searchString });
  }
})

function startSearch(searchString) {
  searchChannel.start(searchString);
}

export { startSearch };
