# Progress Oct 2020

* Thu 1st Oct

  **OptaPlanner**

  another look at this usefull but very complicated to get started library :p

  - this vehichle routing web app is kind of what you want to build but to
    integrate with your own site
    https://github.com/kiegroup/optaweb-vehicle-routing

  - maybe this herder demo app is simpler? https://github.com/palfrey/herder
    although it still has docker etc

  - after all [OptaPlanner](https://www.optaplanner.org/) is meant to be as easy as

    ```
      // My domain specific class as input
      MyRoster problem = ...;

      SolverFactory<MyRoster> factory = SolverFactory
          .createFromXmlResource(".../mySolverConfig.xml");
      Solver<MyRoster> solver = factory.buildSolver();

      // My domain specific class as output
      MyRoster solution = solver.solve(problem);

      for (MyShift shift : solution.getShifts()) {
        // Each shift is now assigned to an employee
        assertNotNull(shift.getEmployee());
      }
    ```

  - according to https://news.ycombinator.com/item?id=18820012
    - https://jsprit.github.io/ may be easier to get going with

