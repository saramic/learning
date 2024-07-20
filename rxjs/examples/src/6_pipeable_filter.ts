import { filter, Observable } from "rxjs";
import output from "./output";

output("App started");

interface NewsItem {
  category: "Business" | "Sports";
  content: string;
}

const newsFeed$ = new Observable<NewsItem>((subscriber) => {
  setTimeout(
    () => subscriber.next({ category: "Business", content: "A business" }),
    1000
  );
  setTimeout(
    () => subscriber.next({ category: "Sports", content: "B sports" }),
    3000
  );
  setTimeout(
    () => subscriber.next({ category: "Business", content: "C business" }),
    4000
  );
  setTimeout(
    () => subscriber.next({ category: "Sports", content: "D sports" }),
    6000
  );
  setTimeout(
    () => subscriber.next({ category: "Business", content: "E business" }),
    7000
  );
});

const soprtsNewsFeed$ = newsFeed$.pipe(
  filter(item => item.category === "Sports")
);

newsFeed$.subscribe({
  next: (item) => output(["🗞️ Feed subscription: ", item.content]),
});

soprtsNewsFeed$.subscribe({
  next: (item) => output(["⚽️ Feed subscription: ", item.content]),
});