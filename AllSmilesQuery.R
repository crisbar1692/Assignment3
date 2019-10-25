library(WikidataQueryServiceR)

query <- 'SELECT DISTINCT ?compound ?smiles ?isoSmiles WHERE {
  ?compound wdt:P233 | wdt:P2017 [] .
  OPTIONAL { ?compound wdt:P233 ?smiles }
  OPTIONAL { ?compound wdt:P2017 ?isoSmiles }
}'

r <- query_wikidata(query)
n=10000
r2<-r[1:n,]

write.table(r, file = "AllSmilesWikidata.tsv", sep = "\t", row.names = FALSE,
            quote = F)


write.table(r2, file = "Small.tsv", sep = "\t", row.names = FALSE,
            quote = F)