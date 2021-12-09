;; not working

(
  (jsx_element
    open_tag: (jsx_opening_element
      (name: (identifier) @_name ((#eq? @_name "style")))
       attribute: (jsx_attribute (property_identifier) @_attr (#eq? @_attr "jsx")))
    (jsx_expression (template_string) @css (#offset! @css 0 1 0 -1)))
)
