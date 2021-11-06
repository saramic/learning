"use strict";
//@ts-check
// allowed not to have the mandatory "query"
const dummyContentSearchFn = function () {
    return Promise.resolve([
        {
            title: "from Deistn Patterns",
            url: "/from-design-patterns",
            abstract: "A practical book on accessible forms",
        },
    ]);
};
// but above can be called as
dummyContentSearchFn("Ember"); // Good!
dummyContentSearchFn("Ember", ["JavaScript"]); // Good!
// dummyContentSearchFn() // Nope - typescript error!
// if not typed
const dummyContentSearchFnTwo = function () {
    return Promise.resolve([
        {
            title: "from Deistn Patterns",
            url: "/from-design-patterns",
            abstract: "A practical book on accessible forms",
        },
    ]);
};
// but above cannot be called
// dummyContentSearchFnTwo("Ember"); // Nope!
// dummyContentSearchFnTwo("Ember", ["JavaScript"]); // Nope!
dummyContentSearchFnTwo(); // Good
function displaySearch(inputId, outputId, searchFn) {
    searchFn(inputId).then((result) => console.log(outputId, ":", result));
}
// can still be called as in here
displaySearch("input", "output", dummyContentSearchFnTwo);
// fake fetch
function fakeFetch(url) {
    console.log("fetching url: ", url);
    return Promise.resolve({
        json: () => Promise.resolve([{ url: url, data: "fake data" }]),
    });
}
function search(query, callback, tags) {
    let queryString = `?query=${query}`;
    if (tags && tags.length) {
        queryString += `&tags=${tags.join()}`;
    }
    fakeFetch(`/search${queryString}`)
        .then((res) => res.json())
        .then((results) => callback(results));
}
function searchHandler(results) {
    console.log(results);
}
search("Ember", searchHandler);
function searchHandler2(results) {
    console.log(results.length);
    return results.length;
}
search("Vue", searchHandler2);
