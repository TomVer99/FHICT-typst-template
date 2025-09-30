#import "../../lib.typ": *
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
  // chapter-on-new-page: true,
  available-languages: ("en", "nl", "de", "fr", "es"),
  version-history: (
    (
      version: "1.0",
      date: "2023-11-04",
      author: [TomVer99],
      changes: "Initial version",
    ),
  ),
  distribution-history: (
    (
      recipient: "GitHub Repo Users",
      organisation: "GitHub",
      date: "2025-09-30",
      method: "Repo",
      version: "1.0",
    ),
  ),
  table-of-figures: false,
  // table-of-listings: true,
  // table-of-tables: true,
  // print-extra-white-page: true,
  // line-numbering: true,
  // citation-style: "apa",
  bibliography-file: bibliography("my-sources.bib"),
  glossary-terms: term-list,
  secondary-organisation-logo: read("Company.svg", encoding: none),
  disable-secondary-organisation-logo-footer: true,
  secondary-organisation-color: rgb("184471"),
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
    "./../../assets/fontys-for-society.png",
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

#figure(
  ftable(
    columns: (auto, auto, auto, 1fr),
    [Header 1],
    [Header 2],
    [Header 3],
    [Header 4],
    [Cell 1],
    [Cell 2],
    [Cell 3],
    [Cell 4],
    [Cell 1],
    [Cell 2],
    [],
    [Cell 4],
  ),
  caption: "Table example",
)

The table above is made with the following code:

#figure(
  ```typst
  #ftable(
    columns: (auto, auto, auto, 1fr),
    [Header 1],[Header 2],[Header 3],[Header 4],
    [Cell 1],[Cell 2],[Cell 3],[Cell 4],
    [Cell 1],[Cell 2],[],[Cell 4],
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

#pagebreak()
= Lorem
#index[Lorem]

== Lorem 1

`Lorem` is a placeholder text commonly used to demonstrate the visual form of a document or a font without relying on meaningful content.

#lorem(20)

#ftable(
  columns: (auto, auto, auto, 1fr),
  [Header 1],
  [Header 2],
  [Header 3],
  [Header 4],
  [Cell 1],
  [Cell 2],
  [Cell 3],
  [Cell 4],
  [Cell 1],
  [Cell 2],
  [],
  [Cell 4],
)

```typst
#ftable(
  columns: (auto, auto, auto, 1fr),
  [Header 1],[Header 2],[Header 3],[Header 4],
  [Cell 1],[Cell 2],[Cell 3],[Cell 4],
  [Cell 1],[Cell 2],[],[Cell 4],
)
```

== Lorem 2

=== Lorem 3

$ a = (A_c + A_m dot sin(2 pi omega_m t)) dot sin(2 pi omega_c t) $

$ x(t) = 4 / pi sum_(k=1)^infinity sin((2 k - 1) 2 pi f t) / (2 k - 1) $

=== Lorem 4

#figure(
  image(
    "./../../assets/fontys-for-society.png",
    width: 50%,
  ),
  caption: "Figure example",
)

```typst
#figure(
  image(
    "./../../assets/fontys-for-society.png",
    width: 50%,
  ),
  caption: "Figure example",
)
```
