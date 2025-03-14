#import "@preview/fauxreilly:0.1.1": *

#import "@preview/gentle-clues:1.2.0": *
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.8": *

#import "./helper.typ": print_type

#import "./../lib.typ": *

#let current_version = "1.1.3"

#show: codly-init.with()
#codly(languages: codly-languages)

#orly(
  color: rgb("663366"),
  title: "For FHICT Reports That Actually Look Good",
  top-text: "Because formatting should be easy, not a research project.",
  subtitle: [A Typst Template to Save Your Sanity - Version #current_version],
  // pic: image("chomskydoz.png", width: 100%, fit: "contain"),
  signature: "TomVer99",
)

#let code-icon(icon, ..args) = text(
  font: "tabler-icons",
  fallback: false,
  weight: "regular",
  size: 1em,
  icon,
  ..args,
)

#let icon-version = code-icon("\u{ff02}", fill: rgb("#E5007D"))
#let icon-ty = code-icon("\u{ea77}", fill: rgb("#B300B3"))
#let icon-val = code-icon("\u{f312}", fill: rgb("#007ACC"))

// Content begin
// #set text(font: "Roboto", size: 12pt)
#set heading(numbering: "1.")

// Photo by <a href="https://unsplash.com/@johncobb?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">John Cobb</a> on <a href="https://unsplash.com/photos/gray-fish-in-body-of-water-6btEyS3AJrI?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>


#outline()
#pagebreak()

= Introduction

Welcome to the FHICT Typst Document Template manual. This manual is designed to help you understand and utilize the features of the Typst document template tailored for FHICT (Fontys Hogeschool ICT). Whether you are a student or faculty member, this template will assist you in creating professional-looking documents with ease.

In this manual, you will find detailed information on the parameters available in the FHICT Typst Document Template, along with examples of how to use them. The template provides a range of customization options to suit your specific needs, from setting the document title and authors to enabling line numbering and generating a table of contents.

I hope you find this manual helpful and that it enhances your document creation experience with Typst.

Even if you are not specifically from the ICT course, this template may still be useful to you. It is designed to be flexible and can be adapted to suit various document types and purposes.
FHICT is never named specifically in the template, so it can be used for any Fontys course.

= License

This document template is licensed under the MIT License. You are free to use, modify, and distribute this template, provided that the original copyright notice and this permission notice are included in all copies or substantial portions of the template.

For more details, refer to the LICENSE file included in the repository.

= Versioning

This template follows semantic versioning. The version number is composed of three parts: major, minor, and patch. For example, in version 1.2.3:
- The first number (1) is the major version, which changes when there are significant updates that may include breaking changes.
- The second number (2) is the minor version, which changes when updates are added in a backward-compatible manner.
- The third number (3) is the patch version, which changes when backward-compatible bug fixes or small updates to documentation are made.

= Importing

To use the FHICT Typst Document Template, you need to import it into your Typst document. You can do this by including the following line at the beginning of your document:

```typ
#import "@preview/unofficial-fhict-document-template:version": *
```

It is also possible to download the template from the GitHub repository and import it locally.
In that case the import statement would look like this:

```typ
#import "path/to/lib.typ": *
```

#pagebreak()
= Requirements

To use the FHICT Typst Document Template, you need the `Roboto` font installed on your system. This font is used for the text in the document.

Version #current_version of the template is compatible with Typst version(s) 0.13.

It may work with other versions of Typst, but it is recommended to use the specified version for optimal compatibility.

#pagebreak()

= Main Function

The template can be used by calling the main function.
This is done by calling the `fhict-doc` function with the desired parameters.

#codly(header: [ #strong[Example code] ])
```typ
#show: fhict-doc.with(
  ...
)
```

Afterwards you can add the content of the document.

#codly(header: [ #strong[Example code] ])
```typ
#show: fhict-doc.with(
  ...
)

My amazing content
```

== title

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `"Document Title"`],
)

The `title` parameter is used to set the title of the document. If it is set to #print_type("none"), the title will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
title: "FHICT Typst Document Template Manual"
```

== subtitle

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `subtitle` parameter is used to set the subtitle of the document. If it is set to #print_type("none"), the subtitle will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
subtitle: "A Detailed Guide to Typst Template"
```

== language
<language>

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `"en"`],
)

The `language` parameter is used to set the language of the document. It determines the language of the text and formatting used in the document.

#codly(header: [ #strong[Example code] ])
```typ
language: "nl"
```

#pagebreak()
== available-languages

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("array") of #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `available-languages` parameter is used to specify the languages in which the document is available. It is an array of strings representing the language codes.
If more than one language is specified, a language indicator will be displayed on the cover page to indicate the available languages.
If it is set to #print_type("none"), the language indicator will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
available-languages: ("en", "nl")
```

== date

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `date` parameter is used to set the date of the document. If it is set to #print_type("none"), the date will be automatically generated based on the current date.

#codly(header: [ #strong[Example code] ])
```typ
date: "2022-01-01"
```

== authors-title

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `authors-title` parameter is used to set the title of the authors section. If it is set to #print_type("none"), the authors section will not have a title.

#codly(header: [ #strong[Example code] ])
```typ
authors-title: "Authors"
```

== authors

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: (#print_type("array") of (#print_type("string") or #print_type("content")) and #print_type("string")) or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `authors` parameter is used to specify the authors of the document. It is an array of strings or content blocks representing the authors' names and emails.
If the array is set, the names are required, and emails are optional. If it is set to #print_type("none"), the authors section will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
authors: (
  (
    name: "John Doe",
    email: "some\@email.com",
  ),
  (
    name: "Jane Smith",
  ),
)
```

== assessors-title

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `assessors-title` parameter is used to set the title of the assessors section. If it is set to #print_type("none"), the assessors section will not have a title.

#codly(header: [ #strong[Example code] ])
```typ
assessors-title: "Helpful People"
```

== assessors

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: (#print_type("array") of (#print_type("string") or #print_type("content")) and #print_type("string")) or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `assessors` parameter is used to specify the assessors of the document. It is an array of strings or content blocks representing the assessors' names and emails.
If the array is set, the names are required, and emails are optional. If it is set to #print_type("none"), the assessors section will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
assessors: (
  (
    name: "Dr. Helpful",
    email: "helpful\@email.com",
  ),
  (
    name: "Prof. Kind",
  ),
)
```
#pagebreak()
== version-history

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: (#print_type("array") of 4 #math.times (#print_type("string") or #print_type("content"))) or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `version-history` parameter is used to specify the version history of the document. It is an array of strings or content blocks representing the version number, data, author, and changes for each version.
If the array is set, all four fields are required. If it is set to #print_type("none"), the version history section will not be displayed.

The top entry is the array is the oldest version, and the bottom entry is the newest version.
The version number of the most recent version will be displayed on the cover page if @disable-version-on-cover is set to `true`.

#codly(header: [ #strong[Example code - strings] ])
```typ
version-history: (
  (
    version: "1.0.0",
    date: "2022-01-01",
    author: "John Doe",
    changes: "Initial release",
  ),
```

#codly(header: [ #strong[Example code - content] ])
```typ
version-history: (
  (
    version: [1.0.0],
    date: [2022-01-01],
    author: [John Doe],
    changes: [Initial release],
  ),
```

#pagebreak()
== glossary-terms

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("dictionary") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `glossary-terms` parameter is used to specify the glossary terms for the document. It should follow the format dictated by #link("https://typst.app/universe/package/glossarium", underline(text(fill: blue)[Glossarium])).

#codly(header: [ #strong[Example code] ])
```typ
glossary-terms: term-list
```

#codly(header: [ #strong[Example code - terms list] ])
```typ
#let term-list = (
  (
    key: "fhict",
    short: [FHICT],
    long: [Fontys Hogeschool ICT],
    description: [Fontys University of Applied Sciences],
    plural: [FHICTs],
    longplural: [Fontys Hogescholen ICT],
    group: [Education],
  ),
)
```

== glossary-front

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `glossary-front` parameter is used to specify whether the glossary should be displayed at the front of the document. If set to `true`, the glossary will be displayed at the beginning of the document, else it will be displayed at the end.

#codly(header: [ #strong[Example code] ])
```typ
glossary-front: true
```

== bibliography-file

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #link("https://typst.app/docs/reference/model/bibliography/", underline(text(fill: blue)[bibliography])) or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `bibliography-file` parameter is used to specify the bibliography file for the document.
This should be done using the built in #link("https://typst.app/docs/reference/model/bibliography/", underline(text(fill: blue)[bibliography])) function.
The file itself should be a #link("https://www.bibtex.org/", underline(text(fill: blue)[BibTeX])) file.

#codly(header: [ #strong[Example code] ])
```typ
bibliography-file: bibliography("my-sources.bib")
```

#pagebreak()
== citation-style

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `"ieee"`],
)

The `citation-style` parameter is used to specify the citation style for the document. It determines the format in which citations are displayed.

#codly(header: [ #strong[Example code] ])
```typ
citation-style: "apa"
```

== toc-depth

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("int")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `3`],
)

The `toc-depth` parameter is used to specify the depth of the table of contents (TOC) in the document. It determines how many levels of headings are included in the TOC.

#codly(header: [ #strong[Example code] ])
```typ
toc-depth: 2
```

== disable-toc

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `disable-toc` parameter is used to specify whether the table of contents (TOC) should be disabled in the document. If set to `true`, the TOC will not be generated.

#codly(header: [ #strong[Example code] ])
```typ
disable-toc: true
```

== disable-chapter-numbering

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `disable-chapter-numbering` parameter is used to specify whether chapter numbering should be disabled in the document. If set to `true`, chapters will not be numbered.

#codly(header: [ #strong[Example code] ])
```typ
disable-chapter-numbering: true
```

== disable-version-on-cover
<disable-version-on-cover>

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `disable-version-on-cover` parameter is used to specify whether the version number should be displayed on the cover page. If set to `true`, the version number will not be displayed.

#codly(header: [ #strong[Example code] ])
```typ
disable-version-on-cover: true
```

#pagebreak()
== chapter-on-new-page

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `chapter-on-new-page` parameter is used to specify whether each top level chapter should start on a new page. If set to `true`, each chapter will begin on a new page.

#codly(header: [ #strong[Example code] ])
```typ
chapter-on-new-page: true
```

== pre-toc

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("content") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `pre-toc` parameter is used to specify content that should be displayed before the table of contents (TOC) in the document. It can be used to add introductory content or other information.
The chapters that are added to the pre-toc will not be included in the TOC.

#codly(header: [ #strong[Example code] ])
```typ
pre-toc: [
  = Introduction

  This is the introduction to the document.
]
```

== table-of-figures

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `table-of-figures` parameter is used to specify whether a table of figures should be generated in the document. If set to `true`, a list of figures will be included in the document.

#codly(header: [ #strong[Example code] ])
```typ
table-of-figures: true
```

== table-of-listings

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `table-of-listings` parameter is used to specify whether a table of listings should be generated in the document. If set to `true`, a list of code listings will be included in the document.

#codly(header: [ #strong[Example code] ])
```typ
table-of-listings: true
```
#pagebreak()

== table-of-tables

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `table-of-tables` parameter is used to specify whether a table of tables should be generated in the document. If set to `true`, a list of tables will be included in the document.

#codly(header: [ #strong[Example code] ])
```typ
table-of-tables: true
```

== appendix

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("content") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `appendix` parameter is used to specify content that should be included in the appendix of the document. It can be used to add additional information, references, or other content.
The chapters that are added to the appendix will be included in the TOC under the appendix section.

#codly(header: [ #strong[Example code] ])
```typ
appendix: [
  = Additional Information

  This is additional information that will be included in the appendix.
]
```

== watermark

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `watermark` parameter is used to set a watermark text that will be displayed on each page of the document. If it is set to #print_type("none"), no watermark will be displayed.

#codly(header: [ #strong[Example code] ])
```typ
watermark: "DRAFT"
```

== censored

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("int")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `0`],
)

The `censored` parameter is used to specify wether the `sensitive` (@sensitive) should be censored in the document. If set to `1`, the sensitive content will be censored.

#codly(header: [ #strong[Example code] ])
```typ
censored: 1
```

#pagebreak()

== line-numbering

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `line-numbering` parameter is used to specify whether line numbering should be enabled in the document. If set to `true`, line numbers will be displayed in the document.

#codly(header: [ #strong[Example code] ])
```typ
line-numbering: true
```

== line-numbering-scope

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("string")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `"page"`],
)

The `line-numbering-scope` parameter is used to specify the scope of line numbering in the document. It determines where the count is reset.

Options are:

- `"page"`: Line numbers are reset on each page.
- `"document"`: Line numbers are continuous throughout the document.

For more (and more up to date) information on the options, see the #link("https://typst.app/docs/reference/model/par/#definitions-line-numbering-scope", underline(text(fill: blue)[Typst documentation])).

#codly(header: [ #strong[Example code] ])
```typ
line-numbering-scope: "document"
```

== print-extra-white-page

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `print-extra-white-page` parameter is used to specify whether an extra white page should be added at the end of a chapter#footnote[Currently only at the end of each section added by the template. Such as the table of contents, list of figures, etc.] to make sure each chapter starts facing the reader in the case of a printed document.

This feature is mostly intended for documents that will be printed and bound.

#codly(header: [ #strong[Example code] ])
```typ
print-extra-white-page: true
```

== secondary-organisation-color

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("color") or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `secondary-organisation-color` parameter is used to set the color of an organisation's logo or other elements in the document that is not Fontys.
It will be used on the cover page.

#codly(header: [ #strong[Example code] ])
```typ
secondary-organisation-color: rgb("FF0000")
```

#pagebreak()

== secondary-organisation-logo

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #link("https://typst.app/docs/reference/visualize/image/", underline(text(fill: blue)[image])) or #print_type("none")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `none`],
)

The `secondary-organisation-logo` parameter is used to set the logo of an organisation that is not Fontys. It will be displayed on the cover page.

#codly(header: [ #strong[Example code] ])
```typ
secondary-organisation-logo: image("secondary-logo.png", width: 100px)
```

== enable-index

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("bool")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `false`],
)

The `enable-index` parameter is used to specify whether an index should be generated in the document. If set to `true`, an index will be included in the document.

The index entries should be set using the `index` and `index-main` functions from #link("https://typst.app/universe/package/in-dexter", underline(text(fill: blue)[In Dexter])).

#codly(header: [ #strong[Example code] ])
```typ
enable-index: true
```

== index-columns

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Type: #print_type("int")],
)
#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-val\Default: `2`],
)

The `index-columns` parameter is used to specify the number of columns in the index. It determines how the index entries are displayed.

#codly(header: [ #strong[Example code] ])
```typ
index-columns: 3
```

#pagebreak()
= Helper functions

== hlink

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("string")\(url\), #print_type("content")\(text\)],
)

This function is used to create a styled hyperlink. The `url` parameter specifies the URL to link to, and the `text` parameter specifies the text to display as the link.

#codly(header: [ #strong[Example code] ])
```typ
#hlink("https://typst.app/", content: [Typst])
```

Which will look like this:

#hlink("https://typst.app/", content: [Typst])

== sensitive
<sensitive>

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("string")\(text\)],
)

This function is used to mark content as sensitive. The content will be censored if the `censored` parameter is set to `1`.

#codly(header: [ #strong[Example code] ])
```typ
#sensitive("This is sensitive content")
```

If the `censored` parameter is set to `0`, the content will not be censored.
It will end up looking like this:

This is sensitive content

If the `censored` parameter is set to `1`, the content will be censored.
It will end up looking like this:

█████████████████████████

#pagebreak()

== ftable

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("int")\(style\), #print_type("array")\(columns\), #print_type("content")\(content\)],
)

The `ftable` function is the same as a normal table function, except it only takes 2 parameters and one custom parameter.
The `ftable` parameter takes the `columns` and `content` parameters, just like the normal table function.
The `style` parameter is used to set the style of the table. The available styles are 1 through 7.

#codly(header: [ #strong[Example code] ])
```typ
#ftable(
  columns: (auto, auto, auto, 1fr),
  [Header 1], [Header 2], [Header 3], [Header 4],
  [Cell 1], [Cell 2], [Cell 3], [Cell 4],
  [Cell 1], [Cell 2], [], [Cell 4],
),
```

Which will look like this:

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

== set-code-line-nr

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("int")\(line\)],
)

This function is a helper function for the `codly` function. It is intended to simplify the process of setting the line number for code blocks.

#codly(header: [ #strong[Example code] ])
```typ
#set-code-line-nr(start: 5)
```

Which will look like this:

#set-code-line-nr(start: 5)
```typ
#set-code-line-nr(5)
```

You #emph[will] need to call this function again if you want to change the line number.
It does not reset the line number for the next code block.

#set-code-line-nr(start: 1)

#pagebreak()
== text-box

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("color")\(background-color\), #print_type("color")\(stroke-color\), #print_type("color")\(text-color\), #print_type("content")\(content\)],
)

All values except for the `content` parameter are optional.

The `text-box` function is used to create a styled text box. The `background-color` parameter specifies the background color of the box, the `stroke-color` parameter specifies the color of the box's border, and the `text-color` parameter specifies the color of the text inside the box.

#codly(header: [ #strong[Example code] ])
```typ
#text-box[Hi there]
```

Which will look like this:

#text-box[Hi there]

== lined-box

#box(
  stroke: 1pt + rgb("2F5496"),
  fill: rgb("2F5496").lighten(90%),
  inset: 0.35em,
  [#icon-ty\Parameters: #print_type("string")\(title\), #print_type("content")\(body\), #print_type("color")\(line-color\)],
)

The `lined-box` function is used to create a styled box with a title and body. The `title` parameter specifies the title of the box, the `body` parameter specifies the content of the box, and the `line-color` parameter specifies the color of the line surrounding the box, as well as the text color.

#codly(header: [ #strong[Example code] ])
```typ
#lined-box("Title", [Content])
```

Which will look like this:

#lined-box("Title", [Content])
