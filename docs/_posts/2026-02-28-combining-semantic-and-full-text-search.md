---
layout: post
title:  "Combining Semantic and Full Text Search"
date:   2026-02-28 18:00:00 +1100
categories: AI, search, sematic
---

# Combining Semantic and Full Text Search

"how to merge text search with vector search results"

> ✨ AI Overview
>
> Merging text (keyword) and vector (semantic) search, known as hybrid search,
> combines precise term matching with conceptual understanding for better
> accuracy. This is achieved by executing both searches in parallel,
> normalizing their results, and merging them using techniques like Reciprocal
> Rank Fusion (RRF) weighted scoring, or reranking models to produce a
> unified, ranked list.
>
> ### Key Methods for Merging Results
>
> * **Reciprocal Rank Fusion (RRF)**: This is a popular, effective method that
>   combines results based on their rankings in both lists without requiring
>   normalized scores. It calculates a score for each document based on
>    ```
>          1
>    Σ  --------
>       k + rank
>    ```
>
>   ![RRF formula](https://latex.codecogs.com/svg.image?\text{RRF}(d)=\sum\frac{1}{k+\text{rank}(d)})
>
>    , where `k` is a constant (often 60).
>
> * **Weighted Fusion (Alpha Parameter)**: You can assign weights to each
>   method, such as assigning 70% weight to keyword search and 30% to vector
>   search (or vice versa), using an alpha parameter `(0 <= ⍺ <= 1)`.
>
> * **Re-ranking (Two-Stage Search)**: A faster approach is to use keyword
>   search to identify a large set of candidate documents, then use a reranker
>   model (e.g., Cohere) to rank them based on semantic relevance to the query.
>
> * **Normalized Score Combination**: Normalize the scores from both systems
>   (e.g., scaling them to a 0-1 range) and then combine them, allowing for a
>   balanced, combined score.
>
> ### Steps to Implement Hybrid Search
>
> * **Generate Embeddings**: Use an AI model to create vector representations
>   of your data for the vector search.
>
> * **Set Up Indexes**: Create a search index that supports both full-text
>   (BM25) and vector (ANN) search, such as Elasticsearch, Pinecone, or Azure
>   AI Search.
>
> * **Execute Parallel Queries**: Send the same search query to both the text
>   search and vector search engines simultaneously.
>
> * **Combine and Rerank**: Use RRF or weighted scoring to combine the top
>   results from both methods into one list, sorted by the final score.

- [ ] [https://www.tigerdata.com/blog/combining-semantic-search-and-full-text-search-in-postgresql-with-cohere-pgvector-and-pgai](
  https://www.tigerdata.com/blog/combining-semantic-search-and-full-text-search-in-postgresql-with-cohere-pgvector-and-pgai)

> **Implementing Hybrid Search**
>
> We’ll combine the results of both search functions to implement hybrid
> search. To sort the results by relevance, we’ll use a Cohere reranker model,
> rerank-english-v3.0.

```sql
-- SQL query for reranking using pgai
SELECT
  x."index",
  x.document->>'text' as "text",
  x.relevance_score
FROM jsonb_to_recordset(
  ai.cohere_rerank(
    'rerank-english-v3.0',
    %s,
    %s::jsonb,
    return_documents => true,
    api_key=>%s
  )->'results'
) AS x("index" int, "document" jsonb, relevance_score float8)
ORDER BY relevance_score DESC
LIMIT 5;
```

The function cohere_rerank uses a language model to assess the relevance of
each document to the query and then reorders the documents based on their
relevance.

- [ ] [https://cloud.google.com/blog/topics/developers-practitioners/hybrid-search-in-spanner-combine-full-text-and-vector-search](
  https://cloud.google.com/blog/topics/developers-practitioners/hybrid-search-in-spanner-combine-full-text-and-vector-search)
- [ ] [https://milvus.io/ai-quick-reference/how-do-hybrid-approaches-combine-fulltext-and-vector-search](
  https://milvus.io/ai-quick-reference/how-do-hybrid-approaches-combine-fulltext-and-vector-search)
- [ ] [https://medium.com/codex/96-hybrid-search-combining-bm25-and-vector-search-7a93adfd3f4e](
  https://medium.com/codex/96-hybrid-search-combining-bm25-and-vector-search-7a93adfd3f4e)
- [ ] [https://thenewstack.io/combining-the-power-of-text-based-keyword-and-vector-search/](
  https://thenewstack.io/combining-the-power-of-text-based-keyword-and-vector-search/)
  - [ ] **Vector Search: The Future of Data Querying Explained | Semantic
    Searching - MongoDB**

  [![
    Vector Search: The Future of Data Querying Explained | Semantic Searching -
    MongoDB
  ](
    http://img.youtube.com/vi/1ZIYVNvRVsY/0.jpg
  )](https://youtu.be/1ZIYVNvRVsY)

- [ ] **20. Hybrid Search Explained: Combining Keyword and Vector Search for
  Maximum Accuracy - AI Academy**

  [![
    Hybrid Search Explained: Combining Keyword and Vector Search for
    Maximum Accuracy - AI Academy
  ](
    http://img.youtube.com/vi/obr2XV2vI3Q/0.jpg
  )](https://youtu.be/obr2XV2vI3Q)
