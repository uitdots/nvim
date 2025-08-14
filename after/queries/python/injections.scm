; extends

((comment) @injection.language
  (#gsub! @injection.language "#%s*language=%s*([%w%p]+)%s*" "%1")
  .
  (expression_statement
    (assignment
      right: (string
        (string_start)
        (string_content) @injection.content
        (string_end)))))

((comment) @injection.language
  (#gsub! @injection.language "#%s*language=%s*([%w%p]+)%s*" "%1")
  .
  (expression_statement
    (assignment
      left: (identifier)
      right: (string
        (string_start)
        (string_content) @injection.content
        (string_end)))))
