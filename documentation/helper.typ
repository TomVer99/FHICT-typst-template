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
  } else if ty == "pattern" {
    "https://typst.app/docs/reference/visualize/pattern/"
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

#let print_type(type) = {
  link(link-to-typst-doc(type), underline(text(fill: blue)[#raw(lang: "typ", type)]))
}
