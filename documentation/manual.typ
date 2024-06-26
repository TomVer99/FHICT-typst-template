#import "@preview/mantys:0.1.4": *

#import "../template/fhict-template.typ"
#import "../template/fhict-template.typ": *

#show: mantys.with(
	name:		  "FHICT-Template",
	title:    [Unofficial FHICT Template],
	subtitle: [An unofficial template for FHICT document generation.],
	authors:	"TomVer99",
	url:		  "https://github.com/TomVer99/FHICT-typst-template",
	version:	"1.5.1",
	date:		  datetime.today(),
	abstract: [
    This template allows the user to easily generate documents in the style of the Fontys Hogeschool ICT.
    The template provides a set style and layout for the document.
    It also provides a set of commands and macros to help the user generate content.
	],
)

= Usage

== Pre Requisites

To use this template, you need to have the `roboto` font installed.

== Importing the template

To use this template, you first need to download the `template.zip` attatched to the release.
Extract the contents of the zip file to a folder on your computer.
Afterwards, you can include this template in your file by adding the following line at the top of your file:

```typst
#import "some/path/fhict-template.typ": *
```

Your path may vary depending on the location of the template file.
In the future it may also be possible to use:

```typst
#import "@preview/fhict-template:1.5.1": *
```

In this case you won't need to download the template file.

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
)[
  = Introduction
  This is a simple document.
]
```

= Available commands

<fhict-doc>
#command("fhict-doc",
  arg[title],
  arg[subtitle],
  arg[subtitle-lines],
  arg[authors],
  arg[version-history],
  arg[glossary-terms],
  arg[glossary-front],
  arg[bibliography-file],
  arg[citation-style],
  arg[toc-depth],
  arg[disable-toc],
  arg[disable-chapter-numbering],
  arg[pre-toc],
  arg[table-of-figures],
  arg[table-of-listings],
  arg[appendix],
  arg[watermark],
  arg[censored],
  arg[print-extra-white-page],
  arg[secondary-organisation-color],
  arg[secondary-organisation-logo],
  arg[secondary-organisation-logo-height],
  arg[enable-index],
  arg[index-columns],
  barg[body]
)[
  Renders a document in the style of the Fontys Hogeschool ICT.

  #argument("title", types:"string", default: "Document Title")[
    The title of the document.
  ]

  #argument("subtitle", types:"string", default: "Document Subtitle")[
    The subtitle of the document.
  ]

  #argument("subtitle-lines", types:"int", default:1)[
    The number of lines the subtitle should span.
  ]

  #colbreak()
  #argument("authors", types:"dict", default: none)[
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

  #argument("version-history", types:"dict", default: none)[
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

  #argument("glossary-terms", types:"dict", default: none)[
    A dictionary of glossary terms.
    Has the following structure:
    ```typst
    (
      (
        key: "",
        short: [],
        long: [],
        desc: [],
      ),
      ...
    )
    ```
    Where all options except `key` are optional.
  ]

  #argument("glossary-front", types:"bool", default: false)[
    Whether to show the glossary at the front of the document.
  ]

  #argument("bibliography-file", types:"bibliography", default: none)[
    The bibliography element to include in the document.
    ```typst
    #bibliography("your file path")
    ```
  ]

  #argument("citation-style", types:"string", default: "ieee")[
    The citation style to use for the bibliography.
  ]

  #argument("toc-depth", types:"int", default: 3)[
    The depth of the table of contents.
  ]

  #argument("disable-toc", types:"bool", default: false)[
    Whether to disable the table of contents.
  ]

  #argument("disable-chapter-numbering", types:"bool", default: false)[
    Whether to disable chapter numbering.
  ]

  #argument("pre-toc", types:"content", default: none)[
    Content to show before the table of contents.
  ]

  #argument("table-of-figures", types:"bool", default: false)[
    Whether to show a table of figures.
  ]

  #argument("table-of-listings", types:"bool", default: false)[
    Whether to show a table of listings.
  ]

  #argument("appendix", types:"content", default: none)[
    Content to show in the appendix.
  ]

  #argument("watermark", types:"string", default: none)[
    The watermark to show on the document.
  ]

  #colbreak()
  #argument("censored", types:"int", default: 0)[
    Whether to show a censored watermark on the document.
    `1` for censorship, `0` for no censorship.
  ]

  #argument("print-extra-white-page", types:"bool", default: false)[
    Wether to make sure the beginning of sections start on the 'right hand' page.
    This does not affect chapter headings.
  ]

  #argument("secondary-organisation-color", types:"color", default: none)[
    The color of the secondary organisation.
  ]

  #argument("secondary-organisation-logo", types:"read", default: none)[
    The logo of the secondary organisation.
    ```typst
    #read("your file path")
    ```
  ]

  #argument("secondary-organisation-logo-height", types:"size", default: "6%")[
    The height of the secondary organisation logo.
  ]

  #argument("enable-index", types:"bool", default: false)[
    Whether to enable the index.
  ]

  #argument("index-columns", types:"int", default: 2)[
    The number of columns in the index.
  ]

  #argument("body", types:"content")[
    The content of the document.
  ]
]

#pagebreak()
#command("fhict-table",
  arg[columns],
  arg[content],
  arg[background-color-heading],
  arg[background-color],
  arg[text-color-heading],
  arg[text-color],
  arg[top-colored],
  arg[left-colored],
)[
  Renders a table in the style of the Fontys Hogeschool ICT.

  #argument("columns", types:"array", default: ())[
    The spacing of the columns.
  ]

  #argument("content", types:"array", default: ())[
    A 2D array of the content of the table.
    ```typst
    (
      (header1, header2, ...),
      (row1, row2, ...),
      ...
    )
    ```
  ]

  #argument("background-color-heading", types:"color", default: fontys-purple-1)[
    The background color of the heading row/column.
  ]

  #argument("background-color", types:"color", default: white)[
    The background color of the other rows/columns.
  ]

  #argument("text-color-heading", types:"color", default: white)[
    The text color of the heading row/column.
  ]

  #argument("text-color", types:"color", default: black)[
    The text color of the other rows/columns.
  ]

  #argument("top-colored", types:"bool", default: true)[
    Whether the top row should be colored.
  ]

  #colbreak()
  #argument("left-colored", types:"bool", default: false)[
    Whether the left column should be colored.
  ]
]

#pagebreak()
#command("sensitive", arg[textl])[
  Renders a sensitive text block.

  #argument("text", types:"string")[
    The text to render.
  ]
]

#command("hlink",
  arg[url],
  arg[content],
)[
  Renders a hyperlink.

  #argument("url", types:"string")[
    The URL to link to.
  ]

  #argument("content", types:"string", default: none)[
    The text that replaces the URL as the hyperlink.
  ]
]

#command("text-box",
  arg[background-color],
  arg[stroke-color],
  arg[text-color],
  barg[content],
)[
  Renders a text box.

  #argument("background-color", types:"color", default: luma(240))[
    The background color of the text box.
  ]

  #argument("stroke-color", types:"color", default: black)[
    The stroke color of the text box.
  ]

  #argument("text-color", types:"color", default: black)[
    The text color of the text box.
  ]

  #argument("content", types:"content")[
    The content of the text box.
  ]
]

#pagebreak()
#command("lined-box",
  arg[title],
  arg[body],
  arg[line-color],
)[
  Renders a box with a line on the left side.

  #argument("title", types:"string")[
    The title of the box.
  ]

  #argument("body", types:"content")[
    The content of the box.
  ]

  #argument("line-color", types:"color", default: red)[
    The color of the line.
  ]
]

= 3rd Party Libraries

This template uses the following 3rd party libraries:

- `codly:0.2.0`
- `colorful-boxes:1.2.0`
- `showybox:2.0.1`
- `glossarium:0.2.6`
- `in-dexter:0.3.0`

== Codly

Library can be found at the #hlink("https://typst.app/universe/package/codly", content: "Typst Universe page").

This library improves the code rendering in the document. There are no additional commands to use this library.

== Colorful Boxes

Library can be found at the #hlink("https://typst.app/universe/package/colorful-boxes", content: "Typst Universe page").

This library provides a couple of commands to render colorful boxes in the document.

More information can be found on the Typst Universe page.

== Showybox

Library can be found at the #hlink("https://typst.app/universe/package/showybox", content: "Typst Universe page").

This library provides a couple of commands to render colorful boxes in the document.

More information can be found on the Typst Universe page.

#pagebreak()
== Glossarium

Library can be found at the #hlink("https://typst.app/universe/package/glossarium", content: "Typst Universe page").

This library provides functionality to manage and render a glossary in the document. There are two commands of interest in this library: `gls` and `glspl`.

The following documentation will assume you use the terms list as described in the fhict-doc command in @fhict-doc.

#command("gls",
  barg[body]
)[
  Inserts a glossary term.

  #argument("body", types:"string")[
    The term to insert.
  ]
]

#command("glspl",
  barg[body]
)[
  Inserts a glossary term in plural form.

  #argument("body", types:"string")[
    The term to insert.
  ]
]

You can also simple use `@term` to insert a term in the document.

== In-Dexter

Library can be found at the #hlink("https://typst.app/universe/package/in-dexter", content: "Typst Universe page").

This library provides functionality to manage and render an index in the document. There is one command of interest in this library: `index`.

#command("index",
  barg[title],
)[
  Inserts an index location in the document. It does not render anything in the document itself.

  #argument("title", types:"string")[
    The title of the index.
  ]
]

= Issues

If you have any issues with this template, you can report them on the GitHub repository.
Create a new issue and describe the problem you are experiencing.
Also include the version of the template you are using, and your document if possible.
If you have a solution to the problem, you can also create a pull request.
