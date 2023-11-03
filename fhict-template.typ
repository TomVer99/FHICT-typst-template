#let fhict_doc(
  title: "Document Title",

  subtitle: "Document Subtitle",

  authors: (),

  bibliography-file: none,

  body
) = {

  // Set metadata
  set document(title: title, author: authors.map(author => author.name))

  // Set the document's style
  set text(font: "Roboto", size: 11pt, fill: rgb("663366"))
  set cite(style: "ieee")


  // Show the page's contents
  body

}