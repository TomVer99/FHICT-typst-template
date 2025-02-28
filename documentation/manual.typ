#import "@preview/mantys:0.1.4": *
#import "@preview/codly:1.0.0": *

#import "../lib.typ" as fhict-template
#import "../lib.typ": *

#show: mantys.with(
  name: "FHICT-Template",
  title: [Unofficial FHICT Template],
  subtitle: [An unofficial template for FHICT document generation.],
  authors: "TomVer99",
  url: "https://github.com/TomVer99/FHICT-typst-template",
  version: "1.1.3",
  date: datetime.today(),
  abstract: [
    This template allows the user to easily generate documents in the style of the Fontys Hogeschool ICT.
    The template provides a set style and layout for the document.
    It also provides a set of commands and macros to help the user generate content.
  ],
)


#let fontys-blue-2 = rgb("2F5496")
#let code-name-color = fontys-blue-2.lighten(35%)

#show: codly-init.with()
#codly(
  languages: (
    rust: (name: "Rust", color: code-name-color),
    rs: (name: "Rust", color: code-name-color),
    cmake: (name: "CMake", color: code-name-color),
    cpp: (name: "C++", color: code-name-color),
    c: (name: "C", color: code-name-color),
    py: (name: "Python", color: code-name-color),
    java: (name: "Java", color: code-name-color),
    js: (name: "JavaScript", color: code-name-color),
    sh: (name: "Shell", color: code-name-color),
    bash: (name: "Bash", color: code-name-color),
    json: (name: "JSON", color: code-name-color),
    xml: (name: "XML", color: code-name-color),
    yaml: (name: "YAML", color: code-name-color),
    typst: (name: "Typst", color: code-name-color),
  ),
  number-format: none,
  display-icon: false,
)

= Usage

== Pre Requisites

To use this template, you need to have the `roboto` font installed and a way to render Typst documents.

== Importing the template

There are two ways to import the template.

The first way is to download the template file and import it using the `#import` command with a relative path to the local file.

```typst
#import "./../fhict-template.typ": *
```
The second way is to import the template from the Typst Universe. If you have a method to render Typst documents that supports the Typst Universe, you can import the template using the following command:

```typst
#import "@preview/fhict-template:1.5.1": *
```

== First Document

To create a document using this template, you can use the `fhict-doc` command.

This command has a lot of arguments to customize the document.
Here is an example of a simple document:

```typst
#show: fhict-doc.with(
  title: "My Document",
  subtitle: "A simple document",
  authors: (
    (name: "TomVer99"),
  ),
)

= Introduction

This is a simple document.
```

= Available commands

<fhict-doc>
#command(
  "fhict-doc",
  arg[title],
  arg[subtitle],
  arg[language],
  arg[available-languages],
  arg[date],
  arg[authors-title],
  arg[authors],
  arg[assessors-title],
  arg[assessors],
  arg[version-history],
  arg[glossary-terms],
  arg[glossary-front],
  arg[bibliography-file],
  arg[citation-style],
  arg[toc-depth],
  arg[disable-toc],
  arg[disable-chapter-numbering],
  arg[disable-version-on-cover],
  arg[chapter-on-new-page],
  arg[pre-toc],
  arg[table-of-figures],
  arg[table-of-listings],
  arg[table-of-tables],
  arg[appendix],
  arg[watermark],
  arg[censored],
  arg[line-numbering],
  arg[line-numbering-scope],
  arg[print-extra-white-page],
  arg[secondary-organisation-color],
  arg[secondary-organisation-logo],
  arg[secondary-organisation-logo-height],
  arg[enable-index],
  arg[index-columns],
  barg[body],
)[
  Renders a document in the style of the Fontys Hogeschool ICT.

  #argument("title", types: "string", default: "Document Title")[
    The title of the document.
  ]

  #argument("subtitle", types: "string", default: "Document Subtitle")[
    The subtitle of the document.
  ]

  #colbreak()
  #argument("language", types: "string", default: "en")[
    The language of the document.
  ]

  #argument("available-languages", types: "array", default: none)[
    The available languages for the document.
    ```typst
    ("en", "nl", ...)
    ```
  ]

  #argument("date", types: "string", default: none)[
    Allows the user to manually specify a date to be displayed on the cover page.
    ```typst
    date: "28日8月24年"
    ```
    Can be any string.
    ```typst
    date: "I am not a date, but who cares?"
    ```
  ]

  #argument("authors-title", types: "string", default: none)[
    The title of the authors section.
  ]

  #argument("authors", types: "dict", default: none)[
    The author(s) of the document.
    Has the following structure:
    ```typst
    (
      name: "",
      email: "",
    ),
    ```
    Name can be a string or complex type. Email must be a string.
    Email is optional.

    If the `name` attribute is a complex type, it should have the following structure:
    ```typst
      name: (content: [Tom #sensitive("V.")], string: "Tom V."),
    ```

    Appart from using this complex type for sensitive information, there is not much use for it.
  ]

  #colbreak()
  #argument("assessors-title", types: "string", default: none)[
    The title of the assessors section.
  ]

  #argument("assessors", types: "dict", default: none)[
    The assessors of the document.
    Has the following structure:
    ```typst
    (
      (
        title: "",
        name: "",
        email: "",
      ),
      ...
    )
    ```
    All fields need to be strings.
  ]

  #argument("version-history", types: "dict", default: none)[
    The version history of the document.
    Has the following structure:
    ```typst
    (
      (
        version: "",
        date: "",
        author: "",
        changes: "",
      ),
      ...
    )
    ```
    All fields can be strings or content.
  ]

  #argument("glossary-terms", types: "dict", default: none)[
    A dictionary of glossary terms.
    For information on what fields are available, check the #hlink("https://typst.app/universe/package/glossarium", content: "Glossarium documentation").
  ]

  #argument("glossary-front", types: "bool", default: false)[
    Whether to show the glossary at the front of the document.
  ]

  #colbreak()
  #argument("bibliography-file", types: "bibliography", default: none)[
    The bibliography element to include in the document.
    ```typst
    #bibliography("your file path")
    ```
  ]

  #argument("citation-style", types: "string", default: "ieee")[
    The citation style to use for the bibliography.
  ]

  #argument("toc-depth", types: "int", default: 3)[
    The depth of the table of contents.
  ]

  #argument("disable-toc", types: "bool", default: false)[
    Whether to disable the table of contents.
  ]

  #argument("disable-chapter-numbering", types: "bool", default: false)[
    Whether to disable chapter numbering.
  ]

  #argument("disable-version-on-cover", types: "bool", default: false)[
    Whether to display the latests version number on the cover page or not.
  ]

  #argument("chapter-on-new-page", types: "bool", default: false)[
    Whether to start each chapter on a new page.
  ]

  #argument("pre-toc", types: "content", default: none)[
    Content to show before the table of contents.
  ]

  #argument("table-of-figures", types: "bool", default: false)[
    Whether to show a table of figures.
  ]

  #argument("table-of-listings", types: "bool", default: false)[
    Whether to show a table of listings.
  ]

  #colbreak()
  #argument("table-of-tables", types: "bool", default: false)[
    Whether to show a table of tables.
  ]

  #argument("appendix", types: "content", default: none)[
    Content to show in the appendix.
  ]

  #argument("watermark", types: "string", default: none)[
    The watermark to show on the document.
  ]

  #argument("censored", types: "int", default: 0)[
    Whether to show a censored watermark on the document.
    `1` for censorship, `0` for no censorship.
  ]

  #argument("line-numbering", types: "bool", default: false)[
    Controls if lines are numbered in the document. Only the pre-toc and body content will be numbered.
  ]

  #argument("line-numbering-scope", types: "string", default: "page")[
    If set to "page", the counter will reset on each page. If set to "document", the counter will not reset on each page, and will keep counting.
  ]

  #argument("print-extra-white-page", types: "bool", default: false)[
    Wether to make sure the beginning of sections start on the 'right hand' page.
    This does not affect chapter headings.
  ]

  #argument("secondary-organisation-color", types: "color", default: none)[
    The color of the secondary organisation.
  ]

  #argument("secondary-organisation-logo", types: "read", default: none)[
    The logo of the secondary organisation.
    ```typst
    #read("your file path")
    ```
  ]

  #colbreak()
  #argument("secondary-organisation-logo-height", types: "size", default: 6%)[
    The height of the secondary organisation logo.
  ]

  #argument("enable-index", types: "bool", default: false)[
    Whether to enable the index.
  ]

  #argument("index-columns", types: "int", default: 2)[
    The number of columns in the index.
  ]

  #argument("body", types: "content")[
    The content of the document.
  ]
]

#pagebreak()
#command(
  "ftable",
  arg[style],
  arg[columns],
  arg[content],
)[
  Renders a table in the style of the Fontys Hogeschool ICT.

  #argument("style", types: "int", default: 2)[
    The style of the table.
    Can be `1` through `8`.
  ]

  #argument("columns", types: "array", default: ())[
    The spacing and the number of columns. Just like a normal table.

    ```typst
    (size1, size2, ...)
    ```
  ]

  #argument("content", types: "array", default: ())[
    An array of contents for the table.

    Each element is a cell in the table.

    ```typst
    [], [], [], ...
    ```
  ]
]

#command("sensitive", arg[textl])[
  Renders a sensitive text block.

  #argument("text", types: "string")[
    The text to render.
  ]
]

#command(
  "hlink",
  arg[url],
  arg[content],
)[
  Renders a hyperlink.

  #argument("url", types: "string")[
    The URL to link to.
  ]

  #argument("content", types: "string", default: none)[
    The text that replaces the URL as the hyperlink.
  ]
]

#command(
  "set-code-line-nr",
  arg[start],
)[
  Sets the starting line number for code blocks.

  #argument("start", types: "int", default: 1)[
    The starting line number.

    If `-1` is given, the line numbers will be hidden.
  ]
]

#pagebreak()
#command(
  "text-box",
  arg[background-color],
  arg[stroke-color],
  arg[text-color],
  barg[content],
)[
  Renders a text box.

  #argument("background-color", types: "color", default: luma(240))[
    The background color of the text box.
  ]

  #argument("stroke-color", types: "color", default: black)[
    The stroke color of the text box.
  ]

  #argument("text-color", types: "color", default: black)[
    The text color of the text box.
  ]

  #argument("content", types: "content")[
    The content of the text box.
  ]
]

#command(
  "lined-box",
  arg[title],
  arg[body],
  arg[line-color],
)[
  Renders a box with a line on the left side.

  #argument("title", types: "string")[
    The title of the box.
  ]

  #argument("body", types: "content")[
    The content of the box.
  ]

  #argument("line-color", types: "color", default: red)[
    The color of the line.
  ]
]

= 3rd Party Libraries

== Codly

#emph[Current version: 1.1.1]

Library can be found at the #hlink("https://typst.app/universe/package/codly", content: "Typst Universe page").

This library improves the code rendering in the document. There are no additional commands to use this library. More information can be found on the Typst Universe page.

== Codly languages

#emph[Current version: 0.1.3]

Library can be found at the #hlink("https://typst.app/universe/package/codly-languages", content: "Typst Universe page").

This library implements a set number of programming languages for styling on code blocks. More information can be found on the Typst Universe page.

== Glossarium

#emph[Current version: 0.5.1]

Library can be found at the #hlink("https://typst.app/universe/package/glossarium", content: "Typst Universe page").

This library provides functionality to manage and render and manage a glossary in the document. For more information on how to use this library, check the documentation on the Typst Universe page.

== In-Dexter

#emph[Current version: 0.7.0]

Library can be found at the #hlink("https://typst.app/universe/package/in-dexter", content: "Typst Universe page").

This library provides functionality to manage and render an index in the document.

For more information on how to use this library, check the documentation on the Typst Universe page.

= Issues

If you have any issues with this template, you can report them on the GitHub repository.
Create a new issue and describe the problem you are experiencing.
Also include the version of the template you are using, and your document if possible.
If you have a solution to the problem, you can also create a pull request.
