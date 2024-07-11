import { ajax } from "rxjs/ajax";
import output from "./output";

// creates a new obsrvable for us
const ajax$ = ajax<any>(
  'https://random-data-api.com/api/name/random_name'
)
ajax$.subscribe({
  next: value => output(["Sub 1:", value.response.first_name]),
  error: error => output(["Sub 1 error:", error])
});
ajax$.subscribe({
  next: value => output(["Sub 2:", value.response.first_name]),
  error: error => output(["Sub 2 error:", error])
});
ajax$.subscribe({
  next: value => output(["Sub 3:", value.response.first_name]),
  error: error => output(["Sub 3 error:", error])
});
