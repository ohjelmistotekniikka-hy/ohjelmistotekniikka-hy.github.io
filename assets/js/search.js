(() => {
  const getQueryVariable = () => {
    const query = window.location.search.substring(1);
    if (!query) return null;
    const queryTerm = query.split('=')[1];
    return decodeURIComponent(queryTerm.replace(/\+/g, '* ')) + '*';
  };

  const searchTerm = getQueryVariable();

  if (searchTerm) {
    const searchIndex = lunr(function () {
      this.field('title', { boost: 10 });
      this.field('content');
      for (let key in window.pages) {
        if (key !== 'ohjaajan-ohje') {
          this.add({
            id: key,
            title: pages[key].title,
            content: pages[key].content,
          });
        }
      }
    });

    const results = searchIndex.search(searchTerm + '*');
    const resultPages = results.map((match) => pages[match.ref]);

    let resultsString = '';
    resultPages.forEach((r) => {
      resultsString += '<li style="margin-bottom: 15px;">';
      resultsString +=
        "<a class='result' href='" + r.url + "'><h3>" + r.title + '</h3></a>';
      let foundSpot = r.content.search(searchTerm);
      if (foundSpot === -1) foundSpot = 0;
      resultsString +=
        "<div class='snippet'>" +
        r.content.substring(foundSpot, foundSpot + 200) +
        '</div>';
      resultsString += '</li>';
    });

    document.querySelector('#search-results').innerHTML = resultsString;
  }
})();
