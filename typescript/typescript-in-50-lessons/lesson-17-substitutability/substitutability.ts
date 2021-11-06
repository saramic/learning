//@ts-check

type Result = {
  title: string;
  url: string;
  abstract: string;
};

type SearchFn = (
  query: string,
  tags?: string[] | undefined
) => Promise<Result[]>;

// allowed not to have the mandatory "query"
const dummyContentSearchFn: SearchFn = function () {
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

function displaySearch(
  inputId: string,
  outputId: string,
  searchFn: SearchFn
): void {
  searchFn(inputId).then((result) => console.log(outputId, ":", result));
}

// can still be called as in here
displaySearch("input", "output", dummyContentSearchFnTwo);

type FetchJson = {
  json: Function;
};

// fake fetch
function fakeFetch(url: RequestInfo): Promise<FetchJson> {
  console.log("fetching url: ", url);
  return Promise.resolve({
    json: () => Promise.resolve([{ url: url, data: "fake data" }]),
  });
}

function search(
  query: string,
  callback: (results: Result[]) => void,
  tags?: string[]
): void {
  let queryString = `?query=${query}`;
  if (tags && tags.length) {
    queryString += `&tags=${tags.join()}`;
  }
  fakeFetch(`/search${queryString}`)
    .then((res) => res.json() as Promise<Result[]>)
    .then((results) => callback(results));
}

function searchHandler(results: Result[]) {
  console.log(results);
}
search("Ember", searchHandler);

function searchHandler2(results: Result[]): number {
  console.log(results.length);
  return results.length;
}
search("Vue", searchHandler2);
