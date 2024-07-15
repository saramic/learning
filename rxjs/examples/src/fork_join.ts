import { forkJoin, retry } from "rxjs";
import { ajax } from "rxjs/ajax";
import output from "./output";

output("App started");
const randomName$ = ajax<any>(
  "https://random-data-api.com/api/name/random_name"
);
const randomNation$ = ajax<any>(
  "https://random-data-api.com/api/nation/random_nation"
);
const randomFood$ = ajax<any>(
  "https://random-data-api.com/api/food/random_food"
);

// retry after a delay to get around 429 errors
const randomNamePipe = randomName$.pipe(
  // retry({ delay: () => 1000, attempts: 3 })
);
const randomNationPipe = randomNation$.pipe(
  // retry({ delay: 1000, attempts: 3 })
);
const randomFoodPipe = randomFood$.pipe(
  // retry({ delay: 1000, attempts: 3 })
);

// NOTE: plain old subscription
// randomName$.subscribe(ajaxResposne => output(ajaxResposne.response.first_name));
// randomNation$.subscribe(ajaxResposne => output(ajaxResposne.response.capital));
// randomFood$.subscribe(ajaxResposne => output(ajaxResposne.response.dish));

forkJoin([randomNamePipe, randomNationPipe, randomFoodPipe]).subscribe({
  next: ([nameAjax, nationAjax, foodAjax]) => {
    output(`
      ${nameAjax.response.first_name}
      is from ${nationAjax.response.capital}
      and loves ${foodAjax.response.dish}
    `);
  },
  error: (error) => output(error),
  complete: () => output("Complete"),
});
