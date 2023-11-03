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

  // Set the header style
  set heading(numbering: "1.")
  show heading.where(level: 1): h => {text(strong(upper(h)), size: 18pt)}
  show heading.where(level: 2): h => {text(strong(upper(h)), size: 14pt, fill: rgb("E4047C"))}
  show heading.where(level: 3): h => {text(upper(h), size: 12pt, fill: rgb("1F3763"))}
  show heading.where(level: 4): h => {text(emph(upper(h)), size: 11pt, fill: rgb("2F5496"))}
  show heading.where(level: 5): h => {text(emph(upper(h)), size: 11pt, fill: rgb("2F5496"), font: "Calibri")}

  // Set the page style
  set page("a4",
    footer: [
        #place(left + horizon, dy: -25pt,
            image("assets/Picture2.png", height: 200%)
        )
        #place(right + horizon, dy: -25pt,
            text(15pt, fill: rgb("663366"), font: "Roboto")[
                *#counter(page).display()*
            ]
        )
    ]
  )

  // Show the page's contents
  body

}