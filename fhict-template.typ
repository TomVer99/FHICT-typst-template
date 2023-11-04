#let fontys_purple_1 = rgb("663366")

#let fhict_doc(
  title: "Document Title",

  subtitle: "Document Subtitle",

  authors: (),

  version-history: none,

  bibliography-file: none,

  summary: none,
  table-of-figures: none,
  table-of-listings: none,

  body
) = {

  // Set metadata
  set document(title: title, author: authors.map(author => author.name))

  // Set the document's style
  set text(font: "Roboto", size: 11pt, fill: black)
  set cite(style: "ieee")

  // Set the header style
  set heading(numbering: "1.")
  show heading.where(level: 1): h => {text(strong(upper(h)), size: 18pt, fill: fontys_purple_1)}
  show heading.where(level: 2): h => {text(strong(upper(h)), size: 14pt, fill: rgb("E4047C"))}
  show heading.where(level: 3): h => {text(upper(h), size: 12pt, fill: rgb("1F3763"))}
  show heading.where(level: 4): h => {text(upper(h), size: 11pt, fill: rgb("2F5496"))}
  show heading.where(level: 5): h => {text(emph(upper(h)), size: 11pt, fill: rgb("2F5496"), font: "Calibri")}

  // Set the listing style
  show figure.where(kind: raw): it => {
    set align(left)
    it.body
    it.caption
  }

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
            text(20pt, fill: fontys_purple_1, font: "Roboto")[
                *#upper(subtitle)*
            ]
        )
    )
    // Authors
    // TODO: Option with email
    #set text(fill: fontys_purple_1)
    #place(left + horizon, dy: 60pt + (
          (authors.len() - 1) * 15pt
      ), dx: 40pt,
        box(
            height: 35pt + ((authors.len() - 1) * 30pt),
            inset: 10pt,
            fill: white,
            text(10pt)[
                #authors.map(author => strong(author.name) + linebreak() + "      " + link("mailto:" + author.email)).join(",\n")
            ]
        )
    )
    #set text(fill: black)
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

  // Show the cover page
  box()
  pagebreak()

  // Set the page style for non body pages
  set page("a4",
    background: [],
    footer: [
        #place(left + horizon, dy: -25pt,
            image("assets/Picture2.png", height: 200%)
        )
        #place(right + horizon, dy: -25pt,
            text(15pt, fill: fontys_purple_1, font: "Roboto")[
                *#counter(page).display("I")*
            ]
        )
    ]
  )
  counter(page).update(1)

  // Show the version history
  if version-history != none {
    heading("version history", outlined: false, numbering: none)
    table(
    columns: (auto, auto, auto, 1fr),
    inset: 7pt,
    align: horizon,
    fill: (_, row) => if row==0 { rgb("663366") } else { white },
    [#text(fill: white)[*VERSION*]], [#text(fill: white)[*DATE*]], [#text(fill: white)[*AUTHOR*]], [#text(fill: white)[*CHANGES*]],
    ..for version in version-history { ([#version.version], [#version.date], [#version.author], [#version.changes],) }
    )
    pagebreak()
  }

  // Show the summary
  if summary != none {
    heading("summary", outlined: false, numbering: none)
    summary
    pagebreak()
  }

  // Show the table of contents
  outline(
    title: "Table of Contents",
    depth: 3,
    indent: n => [#h(1em)] * n,
  )
  pagebreak()

  // Show the table of figures if requested
  if table-of-figures != none {
    outline(
      title: "Table Of Figures",
      target: figure.where(kind: image),
    )
    pagebreak()
  }

  // Show the table of listings if requested
  if table-of-listings != none {
    outline(
      title: "Table Of Listings",
      target: figure.where(kind: raw),
    )
    pagebreak()
  }

  // Set the page style for body pages
  set page("a4",
    background: [],
    footer: [
        #place(left + horizon, dy: -25pt,
            image("assets/Picture2.png", height: 200%)
        )
        #place(right + horizon, dy: -25pt,
            text(15pt, fill: fontys_purple_1, font: "Roboto")[
                *#counter(page).display()*
            ]
        )
    ]
  )
  counter(page).update(1)

  // Show the page's contents
  body

  // Show the bibliography
  if bibliography-file != none {
    pagebreak()
    bibliography(bibliography-file, title: "References", style: "ieee")
  }

}

#let todo(body) = block(
  above: 2em, stroke: 0.5pt + red,
  width: 100%, inset: 14pt,
  breakable: false
)[
  #set text(font: "Roboto", fill: red)
  #place(
    top + left,
    dy: -6pt - 14pt,
    dx: 6pt - 14pt,
    block(fill: white, inset: 2pt)[*DRAFT*]
  )
  #body
]
