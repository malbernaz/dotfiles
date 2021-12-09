;; ({ a = null }) => null
(
  (formal_parameters
    (object_pattern
      (object_assignment_pattern
        (shorthand_property_identifier_pattern) @parameter))))

;; ([a = null]) => null
(
  (formal_parameters
    (array_pattern
      (assignment_pattern
        left: (identifier) @parameter))))
