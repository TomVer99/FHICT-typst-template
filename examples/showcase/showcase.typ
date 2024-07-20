#import "./../../template/fhict-template.typ": *
#import "./terms.typ": term-list

#show: fhict-doc.with(
  title: "Showcase",
  subtitle: "FHICT Template Showcase",
  authors: (
    (
      name: "TomVer99",
    ),
  ),
  // language: "nl",
  available-languages: ("en", "nl", "de", "fr", "es"),
  version-history: (
    (
      version: "1.0",
      date: "2023-11-04",
      author: [TomVer99],
      changes: "Initial version",
    ),
  ),
  bibliography-file: bibliography("my-sources.bib"),
  glossary-terms: term-list,
  secondary-organisation-logo: read("Company.svg"),
  secondary-organisation-color: rgb("184471"),
  secondary-organisation-logo-height: 3.5cm,
  enable-index: true,
)

= Examples

== Headings Example
#index-main[Headings]

=== level 3

==== level 4

===== level 5

====== level 6

Level 6 and higher are not supported in the custom syntax. They will still work, but will have the default styling.

== Text example
#index[Text]

#lorem(100)

== Figures example
#index[Figures]

=== Image
#index[Image embed]

This is a figure with an image. This will be shown in the list of figures if enabled.

#figure(
  image(
    "./../../template/assets/fontys-for-society.png",
    width: 50%,
  ),
  caption: "Figure example",
)

#pagebreak()
=== Code
#index[Code embed]

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
#index[Citations]

This is a citation #cite(<FHICT-typst-template>).

== Tables
#index[Tables]

#fhict-table(
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
  #fhict-table(
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

== Using Terms
#index[Terms]

Using terms for the first time will show the term with a 'long' variant if it is set. If it is not set, the 'short' variant will be shown. If the term is used again, only the 'short' variant will be shown.

`@wip` will be shown as @wip. But the second time you use it, it will be shown as @wip.

#pagebreak()
== Links
#index[Links]

```typst
#hlink("www.google.com", content: "Google")

#hlink("www.google.com")
```

#hlink("www.google.com", content: "Google")

#hlink("www.google.com")

= Cover Page
#index[Cover Page]

The cover page in this document has a 'secondary organisation' added to it.
