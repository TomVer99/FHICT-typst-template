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
  bibliography-file: "my-sources.bib",
)

= level 1

== level 2

=== level 3

==== level 4

===== level 5

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


This is a citation #cite(<FHICT-typst-template>).

#todo(lorem(100))
