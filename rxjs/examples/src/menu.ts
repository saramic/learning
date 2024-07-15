(() => {
  const pages = [
    { text: "demo", href: "/" },
    { text: "unsubscribe demo", href: "/unsubscribe_demo" },
    { text: "cold observable", href: "/cold_observable" },
    { text: "hot observable", href: "/hot_observable" },
    { text: "creation functions", href: "/creation_functions" },
    { text: "fromEvent()", href: "/from_event" },
    { text: "timer()/interval()", href: "/timer_interval" },
    { text: "forkJoin()", href: "/fork_join" },
    { text: "combineLatest()", href: "/combine_latest" },
  ];
  pages.forEach((args, index) => {
    const menu = document.querySelector("#menu");
    if (!menu) {
      throw new Error("Button not found");
    }
    const anchor = document.createElement("a")
    anchor.setAttribute("href", args.href);
    const anchorText = document.createTextNode(args.text);
    anchor.appendChild(anchorText);
    menu.appendChild(anchor);
    if (index < pages.length - 1) {
      const sepratator = document.createTextNode(" | ");
      menu.appendChild(sepratator);
    }
  });
})();
