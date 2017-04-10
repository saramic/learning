# Deriving Taxonomies

get the data files via https://www.manning.com/books/spark-graphx-in-action

run the project, takes around 200 s

    ```{bash}
    sbt run
    ```

then open the generated graph file `animal_taxonomy.gexf` in Gephi or similar.

## Raw data

via https://code.google.com/archive/p/word2vec/ get the 1.5Gb
`GoogleNews-vectors-negative300.bin.gz` file. Unzip and put it into
`data/GoogleNews-vectors-negative300.bin`

```{bash}
pip install -r requirements.txt

```

