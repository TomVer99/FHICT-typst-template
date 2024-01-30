#import "./../template/fhict-template.typ": *

#show: fhict_doc.with(
  title: "",
  subtitle: "",
  authors: (
    (
      name: [],
    ),
  ),
  version-history: (
    (
      version: "",
      date: "",
      author: [],
      changes: "",
    ),
  ),
  pre-toc: [
  ],
  bibliography-file: "my-sources.bib",
)