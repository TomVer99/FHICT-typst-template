#import "@preview/codly:0.2.0": *
#import "@preview/colorful-boxes:1.2.0": *
#import "@preview/showybox:2.0.1": *
#import "@preview/glossarium:0.2.6": make-glossary, print-glossary, gls, glspl

#let fontys_purple_1 = rgb("663366")
#let fontys_purple_2 = rgb("B59DB5")
#let fontys_pink_1   = rgb("E4047C")
#let fontys_blue_1   = rgb("1F3763")
#let fontys_blue_2   = rgb("2F5496")
#let code_name_color = fontys_blue_2.lighten(35%)

// States
#let censored_state = state("style", "0")

// Misc functions
#let hlink(url, content: none) = {
  link(url)[
    #underline[#text([
      #if content == none {
        url
      } else {
        content
      }
    ], fill: fontys_blue_2)]
  ]
}

#let sensitive(textl) = locate(loc => {
  if (censored_state.at(loc) == 1) {
    text(
      textl.replace(regex("."), "█"),
      fill: black,
      font: "Arial"
    )
  } else {
    textl
  }
})

#let fhict_table(
  columns: (),
  content: (),
  background_color_heading: fontys_purple_1,
  background_color: white,
  text_color_heading: white,
  text_color: black,
  top_colored: true,
  left_colored: false,
) = {
  table(
    columns: columns,
    inset: 7pt,
    align: horizon,
    fill: (
      if top_colored and left_colored {
        (column, row) => if column==0 or row==0 { background_color_heading } else { background_color }
      } else if top_colored {
        (_, row) => if row==0 { background_color_heading } else { background_color }
      } else if left_colored {
        (column, _) => if column==0 { background_color_heading } else { background_color }
      }
    ),
    ..for row in content {
      if (row == content.at(0)) and top_colored {
        for item in row {
          (text(fill: text_color_heading)[#strong(item)],)
        }
      } else {
        for item in row {
          if (item == row.at(0)) and left_colored {
            (text(fill: text_color_heading)[#strong(item)],)
          } else {
            (text(fill: text_color)[#item],)
          }
        }
      }
    }
  )
}

#let text_box(background-color: luma(240), stroke-color: black, text-color: black, content) = {
  rect(fill: background-color, width: 100%, stroke: (left: 0.25em + stroke-color))[
    #text(
      fill: text-color,
      content
    )
  ]
}

#let lined_box(title, body, line-color: red) = block(
  above: 2em, stroke: 0.5pt + line-color,
  width: 100%, inset: 14pt,
  breakable: false
)[
  #set text(font: "Roboto", fill: line-color)
  #place(
    top + left,
    dy: -6pt - 14pt,
    dx: 6pt - 14pt,
    block(fill: white, inset: 2pt)[*#title*]
  )
  #body
]

// Document
#let fhict_doc(
  title: "Document Title",
  subtitle: "Document Subtitle",
  subtitle-lines: 1,

  authors: none,

  version-history: none,

  glossary-terms: none,
  glossary-front: false,

  bibliography-file: none,
  citation-style: "ieee",

  disable-toc: false,
  disable-chapter-numbering: false,

  pre-toc: none,
  table-of-figures: none,
  table-of-listings: none,

  appendix: none,

  watermark: none,
  censored: 0,

  body
) = {
  show: make-glossary

  let meta_authors = ""

  // Set metadata
  if authors != none and censored == 0 {
    if type(authors.at(0).name) == dictionary {
      meta_authors = authors.map(author => author.name.string)
    } else {
      meta_authors = authors.map(author => author.name)
    }
  }

  set document(
    title: title,
    author: meta_authors,
  )

  // Set the document's style
  set text(font: "Roboto", fallback: false, size: 11pt, fill: black)
  set cite(style: citation-style)

  // Set the header style
  let numbering_set = none
  if disable-chapter-numbering == false {
    numbering_set = "1."
  } else {
    numbering_set = none
  }

  set heading(numbering: numbering_set)

  show heading.where(level: 1): h => {text(strong(upper(h)), size: 18pt, fill: fontys_purple_1)}
  show heading.where(level: 2): h => {text(strong(upper(h)), size: 14pt, fill: fontys_pink_1)}
  show heading.where(level: 3): h => {text(upper(h), size: 12pt, fill: fontys_blue_1)}
  show heading.where(level: 4): h => {text(upper(h), size: 11pt, fill: fontys_blue_2)}
  show heading.where(level: 5): h => {text(emph(upper(h)), size: 11pt, fill: fontys_blue_2, font: "Calibri")}

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
        fill: fontys_purple_2,
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
            fill: fontys_pink_1,
            text(30pt, fill: white, font: "Roboto")[
                *#upper(title)*
            ]
        )
    )
    // Sub title
    #place(left + horizon, dy: 20pt + ((22pt * (subtitle-lines - 1)) / 2), dx: 40pt,
        box(
            height: 30pt + (22pt * (subtitle-lines - 1)),
            inset: 10pt,
            fill: white,
            text(20pt, fill: fontys_purple_1, font: "Roboto")[
                *#upper(subtitle)*
            ]
        )
    )
    // Authors
    #censored_state.update(censored)
    #set text(fill: fontys_purple_1)
    #if authors != none {
      if authors.all(x => "email" in x) {
        place(left + horizon,
        dy: 60pt + (
          (authors.len() - 1) * 15pt
        ) + (22pt * (subtitle-lines - 1)), dx: 40pt,
        box(
          height: 35pt + ((authors.len() - 1) * 30pt),
          inset: 10pt,
          fill: white,
          text(10pt)[
            #if type(authors.at(0).name) == dictionary {
              authors.map(author => strong(author.name.content) + linebreak() + "      " + link("mailto:" + author.email)[#author.email]).join(",\n")
            } else {
              authors.map(author => strong(author.name) + linebreak() + "      " + link("mailto:" + author.email)).join(",\n")
            }]))
      } else {
        place(left + horizon, dy: 48pt + (
          if authors.len() == 1 {
            5pt
          } else {
            (authors.len() - 1) * 10pt
          }
        ) + (22pt * (subtitle-lines - 1)), dx: 40pt,
        box(
          inset: 10pt,
          fill: white,
          height: 20pt + ((authors.len() - 1) * 15pt),
          text(10pt, fill: fontys_purple_1, font: "Roboto")[
            #if type(authors.at(0).name) == dictionary {
              [*#authors.map(author => author.name.content).join(",\n")*]
            } else {
              [*#authors.map(author => author.name).join(",\n")*]
            }
          ]))
      }
    }

    #set text(fill: black)
    // Date
    #place(right + horizon, dy: 330pt,
        box(
            width: 40%,
            height: 35pt,
            fill: fontys_pink_1,
            place(left + horizon, dx: 10pt,
                text(30pt, fill: white, font: "Roboto")[
                    *#datetime.today().display()*
                ]
            )
        )
    )
  ],
  foreground: [
    #if watermark != none [
    #place(center + horizon, rotate(24deg,
        text(60pt, fill: rgb(0, 0, 0, 70), font: "Roboto")[
            *#upper(watermark)*
        ]
    ))
    ]
  ]
  )

  // Show the cover page
  censored_state.update(censored)
  box()
  pagebreak()

  let pre_toc_numbering = "1"

  if (version-history != none) or (pre-toc != none) or (disable-toc == false) or (disable-toc == false) or (glossary-terms != none and glossary-front == true) or ((table-of-figures != none) and (table-of-figures != false)) or ((table-of-listings != none) and (table-of-listings != false)) {
    pre_toc_numbering = "I"
  }

  // Set the page style for non body pages
  set page("a4",
    background: [],
    footer: [
        #place(left + horizon, dy: -25pt,
            image("assets/Picture2.png", height: 200%)
        )
        #place(right + horizon, dy: -25pt,
            text(15pt, fill: fontys_purple_1, font: "Roboto")[
              *#counter(page).display(pre_toc_numbering)*
            ]
        )
    ],
    numbering: pre_toc_numbering
  )
  counter(page).update(1)

  // Show the version history
  if version-history != none {
    heading("version history", outlined: false, numbering: none)
    fhict_table(
      columns: (auto, auto, auto, 1fr),
      content: (
        ("Version", "Date", "Author", "Changes"),
        ..version-history.map(version => (
          version.version,
          version.date,
          version.author,
          version.changes,
        )),
      ),
    )
    pagebreak()
  }

  show: codly-init.with()
  codly(languages: (
      rust: (name: "Rust", color: code_name_color),
      rs: (name: "Rust", color: code_name_color),
      cmake: (name: "CMake", color: code_name_color),
      cpp: (name: "C++", color: code_name_color),
      c: (name: "C", color: code_name_color),
      py: (name: "Python", color: code_name_color),
      java: (name: "Java", color: code_name_color),
      js: (name: "JavaScript", color: code_name_color),
      sh: (name: "Shell", color: code_name_color),
      bash: (name: "Bash", color: code_name_color),
      json: (name: "JSON", color: code_name_color),
      xml: (name: "XML", color: code_name_color),
      yaml: (name: "YAML", color: code_name_color),
      typst: (name: "Typst", color: code_name_color),
    ),
    enable-numbers: false,
    display-icon: false,
  )

  // Show the pre-toc
  if pre-toc != none {
    // Disable heading numbering and appearing in the TOC
    set heading(numbering: none, outlined: false)
    pre-toc
    set heading(numbering: numbering_set, outlined: true)
    pagebreak()
  }

  // Show the table of contents
  if disable-toc == false {
    outline(
      title: "Table of Contents",
      depth: 3,
      indent: n => [#h(1em)] * n,
    )
    pagebreak()
  }

  // Show the Glossary in the front
  if glossary-terms != none and glossary-front == true {
    heading("Glossary", numbering: none, outlined: false)
    print-glossary(
    (
      glossary-terms
    ),
    )
    pagebreak()
  }

  // Show the table of figures if requested
  if (table-of-figures != none) and (table-of-figures != false) {
    outline(
      title: "Table Of Figures",
      target: figure.where(kind: image),
    )
    pagebreak()
  }

  // Show the table of listings if requested
  if (table-of-listings != none) and (table-of-listings != false) {
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
    ],
    numbering: "1"
  )
  counter(page).update(1)

  // Show the page's contents
  body

  // Show the Glossary in the back
  if glossary-terms != none and glossary-front == false {
    pagebreak()
    heading("Glossary", numbering: none)
    print-glossary(
    (
      glossary-terms
    ),
    )
  }

  // Show the bibliography
  if bibliography-file != none {
    pagebreak()
    bibliography(bibliography-file, title: "References", style: "ieee")
  }

  // Show the appendix
  if appendix != none {
    // Set appendix page style
    counter(heading).update(0)
    // TODO: Wait for Typst 0.11 to be released
    set heading(numbering: "A.", outlined: false)
    show heading.where(level: 1): set heading(outlined: true)

    pagebreak()
    appendix
  }
}
