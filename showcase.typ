#import "fhict-template.typ": fhict_doc

#show: fhict_doc.with(
  title: "Hello World",
  subtitle: "Hello World",
  authors: (
    (
      name: "Jeroen Bransen",
      email: "test@test.nl",
    ),
    (
      name: "Jeroen Bransen",
      email: "test@test2.nl",
    )
  ),
)

= level 1

== level 2

=== level 3

==== level 4

===== level 5

#lorem(100)
