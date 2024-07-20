import { filter, map, of, tap } from "rxjs";
import output from "./output";

output("App started");

of(1, 7, 3, 6, 2)
  .pipe(
    filter((value) => value > 5),
    map((value) => value * 2),
    tap((value) => output(["Spy: ", value]))
  )
  .subscribe((value) => output(value));
