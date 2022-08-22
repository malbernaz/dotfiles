[(tag_name) (universal_selector)] @tag
[(class_name) (id_name)] @constructor
(unit) @operator
(nesting_selector) @operator
(attribute_selector ["[" "]"] @punctuation.bracket)
(attribute_selector ["="] @punctuation.delimiter)
(attribute_selector (attribute_name) @tag.attribute)
(plain_value) @constant
(pseudo_class_selector (class_name) @constant)

