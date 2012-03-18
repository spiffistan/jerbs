require 'sparql'

sparql = SPARQL::Client.new("http://dbpedia.org/sparql")

# Get all programming languages
queryString = "
SELECT ?name WHERE {
  ?lang a dbpedia-owl:ProgrammingLanguage;
        dbpprop:name ?name
}"

# Get all frameworks and their languages
queryString = "
SELECT ?name, ?lang WHERE {
  ?framework dbpedia-owl:genre dbpedia:Web_application_framework;
             dbpprop:name ?name;
             dbpprop:programmingLanguage ?lang
}"

# Get all frameworks for a specific language
queryString = "
SELECT ?name WHERE {
  ?framework dbpedia-owl:genre dbpedia:Web_application_framework;
             dbpprop:name ?name;
             dbpprop:programmingLanguage <http://dbpedia.org/resource/Ruby_%28programming_language%29>
}"

# query = sparql.select.where([:s, :p, :o]).offset(100).limit(10)
query = sparql.query(queryString)
query.each do |solution|
  puts solution.name
end
