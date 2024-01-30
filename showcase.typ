#import "fhict-template.typ": *

#show: fhict_doc.with(
  title: "Showcase",
  subtitle: "FHICT Template Showcase",
  authors: (
    (
      name: [Tom #sensitive("V.")],
    ),
  ),
  version-history: (
    (
      version: "1.0",
      date: "2023-11-04",
      author: [Tom #sensitive("V.")],
      changes: "Initial version",
    ),
  ),
  pre-toc: [
    = Summary
    This document will show all the features of the FHICT Template.

    In this `pre-toc` section you can do anything you want, but it will not be shown in the Table of Contents.

    = Im a Heading that comes before the Table of Contents
  ],
  table-of-figures: true,
  table-of-listings: true,
  bibliography-file: "my-sources.bib",
  // disable-toc: true,
  // disable-chapter-numbering: true,
  // watermark: "THIS IS A WATERMARK",
  // glossary-front: true,
  glossary-terms:(
    (
      key: "fhict",
      short: "FHICT",
      long: "Fontys Hogeschool ICT",
      desc: [Fontys University of Applied Sciences],
    ),
    (
      key: "wip",
      short: "W.I.P.",
      long: "Work In Progress",
    ),
  ),
  censored: 1,
  )

= Examples

== Headings Example

=== level 3

==== level 4

===== level 5

====== level 6

Level 6 and higher are not supported in the custom syntax. They will still work, but will have the default styling.

== Text example

#lorem(100)

== Figures example

=== Image

This is a figure with an image. This will be shown in the list of figures if enabled.

#figure(
  image(
    "assets/Picture1.png",
    width: 50%,
  ),
  caption: "Figure example",
)

#pagebreak()
=== Code

This is a figure with code. This will be shown in the list of listings if enabled.

#figure(
  ```cpp
  int main() {
    return 0;
  }
  ```,
  caption: "Code example C++",
)

#figure(
  ```rust
  fn main() {
    println!("Hello, world!");
  }
  ```,
  caption: "Code example Rust",
)

== Citations

This is a citation #cite(<FHICT-typst-template>).

#pagebreak()
== Tables

There is a helper function called `fhict_table` that can be used to create tables. This function takes two manditory arguments: `columns` and `content`, and two optional arguments: `top_colored` and `left_colored`.

The `columns` argument is a list of column widths.

The `content` argument is a list of rows. Each row is a list of cells. Each cell is a string.

#fhict_table(
  columns: (auto, auto, auto, 1fr),
  content: (
    ("Header 1", "Header 2", "Header 3", "Header 4"),
    ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
    ("Cell 1", "Cell 2", "", "Cell 4"),
  ),
)

The table above is made with the following code:

#figure(
  ```typst
  #fhict_table(
    columns: (auto, auto, auto, 1fr),
    content: (
      ("Header 1", "Header 2", "Header 3", "Header 4"),
      ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
      ("Cell 1", "Cell 2", "", "Cell 4"),
    ),
  )
  ```,
  caption: "Table example",
)

The `top_colored` argument is `true` by default, and will color the top row of the table.

The `left_colored` argument is `false` by default, and will color the left column of the table.

You can combine these two arguments to create a table like this:

#fhict_table(
  columns: (auto, auto, auto, 1fr),
  content: (
    ("Header 1", "Header 2", "Header 3", "Header 4"),
    ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
    ("Cell 1", "Cell 2", "", "Cell 4"),
  ),
  left_colored: true,
)

Or disable both to create a table like this:

#fhict_table(
  columns: (auto, auto, auto, 1fr),
  content: (
    ("Header 1", "Header 2", "Header 3", "Header 4"),
    ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
    ("Cell 1", "Cell 2", "", "Cell 4"),
  ),
  top_colored: false,
)

#pagebreak()

You can also configure the color of the table by using the `background_color_heading`, `background_color`, `text_color_heading` and `text_color` arguments.

You can for example make a table like this:

#fhict_table(
  columns: (auto, auto, auto, 1fr),
  content: (
    ("Header 1", "Header 2", "Header 3", "Header 4"),
    ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
    ("Cell 1", "Cell 2", "", "Cell 4"),
  ),
  background_color_heading: rgb("4272f5"),
  text_color_heading: rgb("f5a142"),
  background_color: rgb("f54242"),
  text_color: rgb("42f5a1"),
)

Here is the code snippet for this table:

#figure(
  ```typst
#fhict_table(
  columns: (auto, auto, auto, 1fr),
  content: (
    ("Header 1", "Header 2", "Header 3", "Header 4"),
    ("Cell 1", "Cell 2", "Cell 3", "Cell 4"),
    ("Cell 1", "Cell 2", "", "Cell 4"),
  ),
  background_color_heading: rgb("4272f5"),
  text_color_heading: rgb("f5a142"),
  background_color: rgb("f54242"),
  text_color: rgb("42f5a1"),
)
  ```,
  caption: "Table example with custom colors",
)

== Using Terms

You can quote a term by using one of the following syntaxes:

- `#gls("term")`
- `#glspl("term")`
- `@term`

If you use a term for the first time, it will display the long version of the term. If you use it again, it will display the short version of the term.

For example, the term `#gls("fhict")` will be shown as #gls("fhict"). But the second time you use it, it will be shown as #gls("fhict").

And `@wip` will be shown as @wip. But the second time you use it, it will be shown as @wip.

#pagebreak()
== Boxes
=== colorful-boxes
<BoxesA>

#colorbox(
  title: lorem(5),
  color: "red",
  radius: 2pt,
  width: auto
)[
  #lorem(20)
]

#slantedColorbox(
  title: lorem(5),
  color: "green",
  radius: 2pt,
  width: auto
)[
  #lorem(20)
]

#outlinebox(
  title: lorem(5),
  color: "blue",
  radius: 2pt,
  width: auto
)[
  #lorem(20)
]

#outlinebox(
  title: lorem(5),
  color: "red",
  radius: 2pt,
  width: auto,
  centering: true
)[
  #lorem(20)
]

=== showybox
<BoxesB>

#showybox(
  frame: (
    border-color: red.darken(50%),
    title-color: red.lighten(60%),
    body-color: red.lighten(80%)
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: "Red-ish showybox with separated sections!",
  lorem(20),
  lorem(12)
)

#showybox(
  frame: (
    dash: "dashed",
    border-color: red.darken(40%)
  ),
  body-style: (
    align: center
  ),
  sep: (
    dash: "dashed"
  ),
  shadow: (
	  offset: (x: 2pt, y: 3pt),
    color: yellow.lighten(70%)
  ),
  [#lorem(20)],
  [#lorem(25)]
)

#pagebreak()
=== Custom Boxes

#text_box[
  I am a grey box!
  You can use me for a less intrusive box.

  Put whatever you want in here. $I = V / R$
]

#text_box(background-color: fontys_purple_2,
stroke-color: fontys_purple_1, text-color: fontys_blue_1)[
  You can also customize the color of the background, stroke and text.
]

#figure(
  ```typst
  #text_box[
    I am a grey box!
    You can use me for a less intrusive box.

    Put whatever you want in here. $I = V / R$
  ]

  #text_box(background-color: fontys_purple_2,
  stroke-color: fontys_purple_1, text-color: fontys_blue_1)[
    You can also customize the color of the background, stroke and text.
  ]
  ```,
  caption: "Custom Boxes Example",
)

== lined_box

#lined_box("lined_box", [
  This is a lined_box. This box can be used to indicate anything you want.
])

#lined_box("lined_box, but black", [
  You can also change the color of the lines.
], line-color: black)

== sensitive information

You can censor sensitive information by using the `#sensitive` function. Each character will be replaced by a black rectangle, making it impossible to read or copy the text.

#sensitive("I am sensitive information")

```typst
#sensitive("I am sensitive information")
```

You can set if the text should be censored or not by setting the `censored` option in the document options.

`1` means censored, `0` means not censored.

#pagebreak()
== Links

You can create links by using the `#hlink` function. This function takes two arguments: `url` and `content`. The `url` argument is the url the link should point to. The `content` argument is the text that should be shown in the document and is optional. If the `content` argument is not set, the `url` argument will be used as the content.

The following code will create two links, one with the content "Google" and one with the content "www.google.com". Both links will point to the same url.

```typst
#hlink("www.google.com", content: "Google")

#hlink("www.google.com")
```

#hlink("www.google.com", content: "Google")

#hlink("www.google.com")

#pagebreak()
= Document options

== Title and Subtitle

The title and subtitle can be set by using the following options:

#figure(
  ```typst
  title: "YOUR TITLE",
  subtitle: "YOUR SUBTITLE",
  ```,
  caption: "Title and Subtitle Options",
)

== Authors

The authors can be set by using the following option:

#figure(
  ```typst
  authors: (
    (
      name: "YOUR NAME",
      email: "YOUR EMAIL",
    ),
    (
      name: "YOUR NAME",
      email: "YOUR EMAIL",
    ),
  ),
  ```,
  caption: "Authors Option",
)

At least one author is required, otherwise the cover page will contain an empty white square.

If any one author does not have an email address, the email addresses will not be shown at all on the cover page.

#figure(
  ```typst
  authors: (
    (
      name: "YOUR NAME",
    ),
    (
      name: "YOUR NAME",
      email: "YOUR EMAIL",
    ),
  ),
  ```,
  caption: "Authors Option with Missing Email",
)

You can also chose to not set any authors. In this case, no authors will be shown on the cover page.

// #todo([
//   It is planned to add support for email / no email for a case by case basis, but this is not yet implemented.
// ])

== Version History

The version history can be set by using the following option:

#figure(
  ```typst
  version-history: (
    (
      version: "1.0.0",
      date: "2020-01-01",
      author: "Jeroen Van De Lange",
      changes: "Initial version",
    ),
    (
      version: "1.0.1",
      date: "2020-01-02",
      author: "Jeroen Van De Lange",
      changes: "Added a new feature",
    ),
  ),
  ```,
  caption: "Version History Option",
)

The version history is optional. If it is not set, the version history will not be shown.

== Summary

It is possible to add a summary to the document. This can be done by setting the following option:

#figure(
  ```typst
  summary: [
    YOUR SUMMARY TEXT
  ],
  ```,
  caption: "Summary Option",
)

#pagebreak()
== Table of ...

On top of the Table of Contents, the template also supports a Table of Figures and a Table of Listings. These can be enabled by setting the following options:

#figure(
  ```typst
  table-of-figures: true,
  table-of-listings: true,
  ```,
  caption: "Table of Figures Option",
)

You can disable these by settings the options to false, or leaving them out entirely.

#figure(
  ```typst
  table-of-figures: false,
  ```,
  caption: "TOF / TOL disabled Option",
)

== Watermark

The watermark can be set by using the following option:

#figure(
  ```typst
  watermark: "YOUR WATERMARK TEXT",
  ```,
  caption: "Watermark Option",
)

== Bibliography

The bibliography can be set by using the following option:

#figure(
  ```typst
  bibliography-file: "YOUR BIBLIOGRAPHY FILE",
  ```,
  caption: "Bibliography Option",
)

You will need to use a .bib file for this. The template will automatically generate the bibliography based on the citations in the document.

#text_box[
  Note that the path to the bibliography file is relative to the _template_ document, not the document you are writing.
]

== Citation style

The citation style can be set by using the following option:

#figure(
  ```typst
  citation-style: "YOUR CITATION STYLE",
  ```,
  caption: "Citation Style Option",
)

The standard style is `ieee`.

== Disabling Table of Contents

For certain extremely small documents, it might be desirable to disable the Table of Contents. This can be done by setting the following option:

#figure(
  ```typst
  disable-toc: true,
  ```,
  caption: "Table of Contents Option",
)

For normal documents, this option should not be used.

#pagebreak()

== Disabling Chapter Numbering

For certain extremely small documents, it might be desirable to disable the chapter numbering. This can be done by setting the following option:

#figure(
  ```typst
  disable-chapter-numbering: true,
  ```,
  caption: "Chapter Numbering Option",
)

== Glossary

=== Setting terms

You can set terms by using the following option:

#figure(
  ```typst
  glossary-terms:(
    (
      key: "KEY",
      short: "SHORT",
      long: "LONG",
      desc: [DESCRIPTION],
    ),
    ...
  )
  ```,
  caption: "Glossary Option",
)

`long` and `desc` are optional.

=== Front vs Back

By default the glossary will be shown in the back of the document. You can change this by setting the following option:

#figure(
  ```typst
  glossary-front: true,
  ```,
  caption: "Glossary Location Option",
)

If set to `true`, the glossary will be placed after the Table of Contents. If set to `false`, the glossary will be placed after the references.

#pagebreak()
= Default Included Packages

== Codly

This package makes code blocks look nicer.

For example, a C++ code block will look like this:

#figure(
  ```cpp
  int main() {
    return 0;
  }
  ```,
  caption: "Codly C++ Example",
)

Instead of something like this:

#figure(
raw(
"int main() {
  return 0;
}\n "),
  caption: "Raw C++ Example",
)

== colorful-boxes

This package adds support for colored boxes.

Examples can be seen here in the #link(label("BoxesA"))[Boxes] section.

== showybox

This package adds support for colored boxes.

Examples can be seen here in the #link(label("BoxesB"))[Boxes] section.

== Glossarium

This package handles the glossary.
