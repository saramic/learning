# Citation Page Rank

get the citation data

    ```{bash}
    wget --directory-prefix=data http://snap.stanford.edu/data/cit-HepTh.txt.gz
    gunzip cit-HepTh.txt.gz
    ```

run the project

    ```{bash}
    sbt run
    ```

to get the output

    ```{bash}
    Most degrees in
    (9711200,2414)
    first 10 verticies
    (9405166,1)
    (108150,1)
    (110163,1)
    ...
    first 10 vericies with pagerank calculated
    (9405166,1.336783076434938)
    (108150,0.5836164464324066)
    (110163,0.15)
    ...
    PageRank vertex
    (9207016,85.27317386053808)
    [success] Total time: 26 s
    ```

