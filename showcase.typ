#import "fhict-template.typ": *

#show: fhict_doc.with(
  title: "Showcase",
  subtitle: "FHICT Template Showcase",
  authors: (
    (
      name: "Tom V.",
      email: "not@my.mail",
    ),
  ),
  version-history: (
    (
      version: "1.0",
      date: "2023-11-04",
      author: "Tom V.",
      changes: "Initial version",
    ),
  ),
  summary: [
    This document will show all the features of the FHICT Template.
  ],
  table-of-figures: true,
  table-of-listings: true,
  bibliography-file: "my-sources.bib",
  // watermark: "THIS IS A WATERMARK",
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

== Todo

#todo([
  This is a DRAFT / TODO box. This box can be used to indicate that (part of) the document is not finished yet.

  Keep in mind this box is not breakable, so it will not be split over multiple pages.
])

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

#todo([
  It is planned to add support for no authors, but this is not yet implemented.
])

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

== Table of ...

On top of the Table of Contents, the template also supports a Table of Figures and a Table of Listings. These can be enabled by setting the following options:

#figure(
  ```typst
  table-of-figures: true,
  table-of-listings: true,
  ```,
  caption: "Table of Figures Option",
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
