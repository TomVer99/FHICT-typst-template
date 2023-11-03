#let fhict_doc(
  title: "Document Title",

  subtitle: "Document Subtitle",

  authors: (),

  bibliography-file: none,

  body
) = {

  // Set metadata
  set document(title: title, author: authors.map(author => author.name))

  // Show the page's contents
  body

}