; extends

((comment) @injection.language [
  (block_node
    (block_mapping
      (block_mapping_pair
        value: (block_node
          (block_scalar) @injection.content))))
  (block_mapping_pair
    value: (block_node
      (block_scalar) @injection.content))]
  (#offset! @injection.content 0 1 0 0)
  (#gsub! @injection.language "%s*language=%s*([%w%p]+)%s*" "%1")
  (#set! "priority" 110))

((comment) @injection.language . [
  (block_node
    . (block_mapping
      . (block_mapping_pair
        . value: (flow_node
          . (plain_scalar
            . (string_scalar) @injection.content)))))
  (block_mapping_pair
    . value: (flow_node
      . (plain_scalar
        . (string_scalar) @injection.content)))]
  (#gsub! @injection.language "%s*language=%s*([%w%p]+)%s*" "%1")
  (#set! "priority" 110))

(block_mapping_pair
  value: (block_node [
    (block_sequence
      (block_sequence_item
        (block_node
          (block_scalar
            (comment) @injection.language) @injection.content)))
    (block_scalar
      (comment) @injection.language) @injection.content])
  (#offset! @injection.content 0 1 0 0)
  (#gsub! @injection.language ".*language?%s*[%:=]%s*([%w%p]+).*" "%1")
  (#set! "priority" 110))

(block_mapping_pair
  (comment) @injection.language
  . value: (block_node
    (block_mapping
      (block_mapping_pair
        value: (block_node
          (block_scalar) @injection.content))))
  (#offset! @injection.content 0 1 0 0)
  (#gsub! @injection.language ".*language?%s*[%:=]%s*([%w%p]+).*" "%1")
  (#set! "priority" 110))

(block_mapping
  (comment) @injection.language
  . (block_mapping_pair
    value: (block_node
      (block_scalar) @injection.content))
  (#offset! @injection.content 0 1 0 0)
  (#gsub! @injection.language ".*language?%s*[%:=]%s*([%w%p]+).*" "%1")
  (#set! "priority" 110))

(block_mapping_pair
  (comment) @injection.language
  . value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          (plain_scalar
            (string_scalar) @injection.content)))))
  (#gsub! @injection.language ".*language?%s*[%:=]%s*([%w%p]+).*" "%1")
  (#set! "priority" 110))

;;;;;;;;;;;; FOR GITHUB ACTION

([
  (string_scalar)
  (block_scalar)
  (double_quote_scalar)
  (single_quote_scalar)
  (ERROR)
] @injection.content
  (#lua-match? @injection.content "[$]{{")
  (#set! injection.language "ghactions"))
