import consumer from "./consumer"

export const searchChannel = consumer.subscriptions.create("SearchChannel", {
  received: function(data) {
    console.log('-------------- Received');
    console.log(data);
  },

  start: function(searchString) {
    this.perform('search', { text: searchString });
  }
})
