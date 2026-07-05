(function () {
  var ids = Array.from(document.querySelectorAll(".lightbox")).map(function (el) {
    return el.id;
  });

  function currentIndex() {
    return ids.indexOf(window.location.hash.slice(1));
  }

  function unzoomAll() {
    document.querySelectorAll(".lightbox img.zoomed").forEach(function (img) {
      img.classList.remove("zoomed");
    });
  }

  document.addEventListener("keydown", function (event) {
    var openIndex = currentIndex();
    if (openIndex === -1) return;

    if (event.key === "Escape") {
      event.preventDefault();
      window.location.hash = "";
    } else if (event.key === "ArrowRight" || event.key === " " || event.key === "Spacebar") {
      event.preventDefault();
      window.location.hash = ids[(openIndex + 1) % ids.length];
    } else if (event.key === "ArrowLeft") {
      event.preventDefault();
      window.location.hash = ids[(openIndex - 1 + ids.length) % ids.length];
    }
  });

  window.addEventListener("hashchange", unzoomAll);

  document.querySelectorAll(".lightbox img").forEach(function (img) {
    img.addEventListener("click", function (event) {
      event.stopPropagation();
      img.classList.toggle("zoomed");
    });
  });
})();
