// Many functions were taken from:
// https://github.com/Dherse/codly/blob/main/docs/docs.typ
// Some were slightly edited

#let link-to-typst-doc(ty) = {
  if ty == "array" {
    "https://typst.app/docs/reference/foundations/array/"
  } else if ty == "string" or ty == "str" {
    "https://typst.app/docs/reference/foundations/str/"
  } else if ty == "dictionary" {
    "https://typst.app/docs/reference/foundations/dictionary/"
  } else if ty == "type(none)" or ty == "none" {
    "https://typst.app/docs/reference/foundations/none/"
  } else if ty == "type(auto)" {
    "https://typst.app/docs/reference/foundations/auto/"
  } else if ty == "content" {
    "https://typst.app/docs/reference/foundations/content/"
  } else if ty == "bool" {
    "https://typst.app/docs/reference/foundations/bool/"
  } else if ty == "arguments" {
    "https://typst.app/docs/reference/foundations/arguments/"
  } else if ty == "function" {
    "https://typst.app/docs/reference/foundations/function/"
  } else if ty == "color" {
    "https://typst.app/docs/reference/visualize/color/"
  } else if ty == "gradient" {
    "https://typst.app/docs/reference/visualize/gradient/"
  } else if ty == "length" {
    "https://typst.app/docs/reference/layout/length/"
  } else if ty == "stroke" {
    "https://typst.app/docs/reference/visualize/stroke/"
  } else if ty == "alignment" {
    "https://typst.app/docs/reference/layout/alignment/"
  } else if ty == "int" {
    "https://typst.app/docs/reference/foundations/int/"
  } else if ty == "label" {
    "https://typst.app/docs/reference/foundations/label/"
  } else {
    panic("unknown type: " + ty)
  }
}

#let determine-color(ty) = {
  if ty == "array" {
    rgb("#f9dfff")
  } else if ty == "string" or ty == "str" {
    rgb("#d1ffe2")
  } else if ty == "dictionary" {
    rgb("#f9dfff")
  } else if ty == "type(none)" or ty == "none" {
    rgb("#ffcbc4")
  } else if ty == "type(auto)" {
    rgb("#ffcbc4")
  } else if ty == "content" {
    rgb("#a6ebe6")
  } else if ty == "bool" {
    rgb("#ffedc1")
  } else if ty == "arguments" {
    rgb("#f9dfff")
  } else if ty == "function" {
    rgb("#d1d4fd")
  } else if ty == "color" {
    gradient.linear(rgb("#7CD5FF"), rgb("#A6FBCA"), rgb("#FFF37C"), rgb("#FFA49D"))
  } else if ty == "gradient" {
    gradient.linear(rgb("#7CD5FF"), rgb("#A6FBCA"), rgb("#FFF37C"), rgb("#FFA49D"))
  } else if ty == "length" {
    rgb("#ffedc1")
  } else if ty == "stroke" {
    gradient.linear(rgb("#7CD5FF"), rgb("#A6FBCA"), rgb("#FFF37C"), rgb("#FFA49D"))
  } else if ty == "alignment" {
    rgb("#a6eaff")
  } else if ty == "int" {
    rgb("#ffedc1")
  } else if ty == "label" {
    rgb("#c6d6ec")
  } else {
    panic("unknown type: " + ty)
  }
}

#let print-type(type) = {
  // link(link-to-typst-doc(type), underline(text(fill: blue)[#raw(lang: "typ", type)]))
  link(
    link-to-typst-doc(type),
    box(radius: 4pt, outset: 3pt, fill: determine-color(type))[#underline(text(
      fill: blue,
    )[#raw(
      lang: "typ",
      type,
    )])]
      + [ ],
  )
}

#let print-param(border: teal, name: "N/A", types: none, description: none, default-val: none, example: none) = {
  block(width: 95%, fill: luma(255), stroke: 1pt + border, inset: 10pt, breakable: false)[
    #strong[#raw(name)]
    #h(2em)
    #for parameter-type in types {
      (
        print-type(parameter-type) + [#if (parameter-type != types.at(-1)) { h(0.15em) + sub[or] + h(0.4em) }]
      )
    }

    #if default-val != none {
      "Default: " + raw(default-val, lang: "typc")
    }

    #description

    #if example != none {
      "Example: " + raw(example, lang: "typc")
    }
  ]
}
