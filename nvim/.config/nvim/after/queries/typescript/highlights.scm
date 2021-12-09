(type_parameters ["<" ">"] @punctuation.bracket)

;; ({ a = null }) => null
(
  (required_parameter
    (object_pattern
      (object_assignment_pattern
        (shorthand_property_identifier_pattern) @parameter))))

;; ([a = null]) => null
(
  (required_parameter
    (array_pattern
      (assignment_pattern
        left: (identifier) @parameter))))
