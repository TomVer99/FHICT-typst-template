// CHANGE THIS TO THE CORRECT PATH
#import "./../../template/fhict-template.typ": *
#import "./terms.typ": term_list

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
  pre-toc: [#include "./pre-toc.typ"],
  bibliography-file: "my-sources.bib",
  glossary-terms: term_list,
)
