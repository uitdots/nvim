; extends

; help deal with for yaml's norway problem https://www.bram.us/2022/01/11/yaml-the-norway-problem/
; only using `true` and `false`, since Treesitter parser targets YAML spec 1.2 https://github.com/nvim-treesitter/nvim-treesitter/pull/7512#issuecomment-2565397302
(block_mapping_pair
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          (plain_scalar
            (string_scalar) @boolean
            (#any-of? @boolean "TRUE" "FALSE" "True" "False" "true" "false")))))))

(block_mapping_pair
  value: (flow_node
    (plain_scalar
      (string_scalar) @boolean
      (#any-of? @boolean "TRUE" "FALSE" "True" "False" "true" "false"))))
