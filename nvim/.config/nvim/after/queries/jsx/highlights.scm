; (jsx_attribute ["="] @punctuation.delimiter)

(
  (nested_identifier (identifier) @constructor)
  (#match? @constructor "^[A-Z]")
)

