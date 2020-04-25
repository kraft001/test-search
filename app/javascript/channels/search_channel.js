import consumer from "./consumer"

consumer.subscriptions.create("SearchChannel", {
  received: function(data) {
    console.log(data);
  },

  search: function(searchString) {
    this.perform('search', { text: searchString });
  }
})
