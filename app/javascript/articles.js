function markup(article) {
  return `
    <div class="article">
      <div class="article__author">${article.author}</div>
      <div class="article__title">${article.title}</div>
      <div class="article__summary">${article.summary}</div>
    </div>
  `;
}

const container = document.querySelector(".js-articles-container");

function updateArticles(articles) {
  // clear the airticles container
  container.innerHTML = '';

  for (const articleData of articles) {
    container.insertAdjacentHTML('beforeend', markup(articleData.attributes));
  }
}

export { updateArticles };
