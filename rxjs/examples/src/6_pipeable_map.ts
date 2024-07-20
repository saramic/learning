import { forkJoin, map, retry } from "rxjs";
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
  retry({ delay: () => 1000, attempts: 3 })
).pipe(
  map(ajaxResponse => ajaxResponse.response.first_name)
);
// NOTE: can just comman in more pipe calls as below
const randomNationPipe = randomNation$.pipe(
  retry({ delay: 1000, attempts: 3 }),
  map(ajaxResponse => ajaxResponse.response.capital)
);
const randomFoodPipe = randomFood$.pipe(
  retry({ delay: 1000, attempts: 3 }),
  map(ajaxResponse => ajaxResponse.response.dish)
);

// randomNamePipe.subscribe(name => output(name));
// randomNationPipe.subscribe(nation => output(nation));
// randomFoodPipe.subscribe(food => output(food));

// forkJoin([randomNamePipe, randomNationPipe, randomFoodPipe]).subscribe({
//   next: ([nameAjax, nationAjax, foodAjax]) => {
//     output(`
//       ${nameAjax.response.first_name}
//       is from ${nationAjax.response.capital}
//       and loves ${foodAjax.response.dish}
//     `);
//   },
//   error: (error) => output(error),
//   complete: () => output("Complete"),
// });

forkJoin([randomNamePipe, randomNationPipe, randomFoodPipe]).subscribe({
  next: ([name, nation, food]) => {
    output(`${name} is from ${nation} and loves ${food}`);
  },
  error: (error) => output(error),
  complete: () => output("Complete"),
});
