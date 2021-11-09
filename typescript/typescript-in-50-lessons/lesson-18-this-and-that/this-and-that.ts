import type { SearchFn } from "../lesson-17-substitutability/substitutability";
import { search } from "../lesson-17-substitutability/substitutability";

function displaySearchInline(
  inputId: "string",
  outputId: "string",
  search: SearchFn
): void {
  document.getElementById(inputId)?.addEventListener("change", function () {
    this.parentElement?.classList.add("active");
    if (this instanceof HTMLInputElement) {
      const searchTerm = this.value;
      search(searchTerm).then((results) => {
        // TODO
      });
    }
  });
}

function inputChangeHandler(this: HTMLElement) {
  this.parentElement?.classList.add("active");
  if (this instanceof HTMLInputElement) {
    const searchTerm = this.value;
    // search(searchTerm).then((results) => {}) // but API is as below, pass a callback
    search(searchTerm, (results) => {
      // TODO
    });
  }
}

function displaySearch(
  inputId: "string",
  outputId: "string",
  search: SearchFn
): void {
  document
    .getElementById(inputId)
    ?.addEventListener("change", inputChangeHandler);
}

displaySearch("search", "output", search);
