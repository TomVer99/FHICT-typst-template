// CHANGE THIS TO THE CORRECT PATH
#import "./../../template/fhict-template.typ": *
#import "./terms.typ": term-list

#show: fhict-doc.with(
  title: "",
  subtitle: "",
  authors: (
    (
      name: "",
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
  appendix: [#include "./appendix.typ"],
  bibliography-file: bibliography("my-sources.bib"),
  glossary-terms: term-list,
)
