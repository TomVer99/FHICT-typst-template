#import "fhict-template.typ": *

#show: fhict_doc.with(
  title: "Showcase",
  subtitle: "FHICT Template Showcase",
  authors: (
    (
      name: "Jeroen Van De Lange",
      email: "test@test.nl",
    ),
    (
      name: "Jeroen Bransen",
      email: "test@test2.nl",
    ),
    (
      name: "Jeroen Van De Lange Ook",
      email: "test2@test2.nl",
    )
  ),
  summary: [
    This is a document that is meant to showcase the FHICT template.
  ],
  table-of-figures: true,
  table-of-listings: true,
  bibliography-file: "my-sources.bib",
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

=== Code

This is a figure with code. This will be shown in the list of listings if enabled.

#figure(
  ```cpp
    int main() {
      return 0;
    }
  ```,
  caption: "Code example",
)

#todo([
  There is currently a package in developement that will allow for better code blocks. Until then, the code blocks will be rather plain and not very pretty.
])

== Citations

This is a citation #cite(<FHICT-typst-template>).

== Todo

#todo([
  This is a DRAFT / TODO box. This box can be used to indicate that (part of) the document is not finished yet.

  Keep in mind this box is not breakable, so it will not be split over multiple pages.
])
