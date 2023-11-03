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
  show heading.where(level: 4): h => {text(upper(h), size: 11pt, fill: rgb("2F5496"))}
  show heading.where(level: 5): h => {text(emph(upper(h)), size: 11pt, fill: rgb("2F5496"), font: "Calibri")}

  // Set Cover Page
  set page("a4",
  background: [
    // Main background triangle
    #place(top + left, path(
        fill: rgb("B59DB5"),
        closed: true,
        (0%, 0%),
        (5%, 0%),
        ((70%, 45%), (-20pt, -20pt)),
        ((75%, 50%), (0%, -15pt)),
        ((70%, 55%), (20pt, -20pt)),
        (5%, 100%),
        (0%, 100%)
    ))
    // For scociety image
    #place(top + left, dx: 70pt, dy: 70pt, image(
        "assets/Picture1.png",
        height: 9%,
    ))
    // Title
    #place(left + horizon, dy: -20pt, dx: 40pt,
        box(
            height: 40pt,
            inset: 10pt,
            fill: rgb("E4047C"),
            text(30pt, fill: white, font: "Roboto")[
                *#upper(title)*
            ]
        )
    )
    // Sub title
    #place(left + horizon, dy: 20pt, dx: 40pt,
        box(
            height: 30pt,
            inset: 10pt,
            fill: white,
            text(20pt, fill: rgb("663366"), font: "Roboto")[
                *#upper(subtitle)*
            ]
        )
    )
    // Authors
    // TODO: list the email
    #place(left + horizon, dy: 48pt + (
        if authors.len() == 1 {
          5pt
        } else {
          (authors.len() - 1) * 10pt
        }
      ), dx: 40pt,
        box(
            height: 20pt + ((authors.len() - 1) * 15pt),
            inset: 10pt,
            fill: white,
            text(10pt, fill: rgb("663366"), font: "Roboto")[
                *#authors.map(author => author.name).join(",\n")*
            ]
        )
    )
    // Date
    #place(right + horizon, dy: 330pt,
        box(
            width: 40%,
            height: 35pt,
            fill: rgb("E4047C"),
            place(left + horizon, dx: 10pt,
                text(30pt, fill: white, font: "Roboto")[
                    *#datetime.today().display()*
                ]
            )
        )
    )
  ]
  )

  box()
  pagebreak()

  // Set the page style
  set page("a4",
    background: [],
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