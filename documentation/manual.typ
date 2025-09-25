#import "@preview/fauxreilly:0.1.1": *

#import "@preview/gentle-clues:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

#import "./helper.typ": print-param, print-type

#import "./../lib.typ": *


#let data = yaml("manual.yml")
#let current-version = data.at("template-version")
#let supported-typst-versions = data.at("compatible-typst-versions")

#show: codly-init.with()
#codly(languages: codly-languages)

#orly(
  color: rgb("663366"),
  title: "For FHICT Reports That Actually Look Good",
  top-text: "Because formatting should be easy, not a research project.",
  subtitle: [A Typst Template to Save Your Sanity - Version #current-version],
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

Please not that not all content in the template is licensed under the MIT License. For example, the Roboto font used in the template is subject to its own licensing terms.

When copying content from this template, make sure to respect the licenses of any third-party resources used in the template.

= Versioning

This template follows semantic versioning. The version number is composed of three parts: major, minor, and patch. For example, in version 1.2.3:
- The first number (1) is the major version, which changes when there are significant updates that may include breaking changes.
- The second number (2) is the minor version, which changes when small updates are added.
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

Version #current-version of the template is compatible with Typst version#if (supported-typst-versions.len() > 1) { [s] } #for value in supported-typst-versions {
  [#value] + if (value != supported-typst-versions.at(-1)) { [, ] }
}.

It may work with other versions of Typst, but it is recommended to use the specified version(s) for optimal compatibility.

#pagebreak()
= Functions

#for value in data.at("functions") {
  [
    #block(width: 100%, fill: luma(235), stroke: luma(200), inset: 10pt)[
      // Name
      == #value.at(0)

      #let func-info = value.at(1)

      // Description
      #func-info.remove("description")

      // Isolate return info to make parameter info printing easier
      #let return-info = func-info.remove("return")

      // Parameters
      #for info-value in func-info {
        [
          #print-param(
            name: info-value.at(0),
            types: info-value.at(1).at("types"),
            description: info-value.at(1).at("description"),
            default-val: if info-value.at(1).keys().contains("default") { info-value.at(1).at("default") } else {
              none
            },
            example: if info-value.at(1).keys().contains("example") { info-value.at(1).at("example") } else {
              none
            },
          )
        ]
      }
      #print-param(
        border: orange,
        name: "Return value",
        types: return-info.at("types"),
        description: if return-info.keys().contains("description") { return-info.at("description") } else {
          none
        },
        example: if return-info.keys().contains("example") { return-info.at("example") } else {
          none
        },
      )
    ]
  ]
}
