; extends

; Azure Pipelines: task: PowerShell@<N> -> inputs -> script
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^PowerShell@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "script")
          value: (block_node
            (block_scalar) @injection.content
            (#set! injection.language "powershell")
            (#offset! @injection.content 0 1 0 0)))))))

; Azure Pipelines: task: PowerShell@<N> -> inputs -> script (single-line)
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^PowerShell@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "script")
          value: (flow_node
            (plain_scalar
              (string_scalar) @injection.content)
            (#set! injection.language "powershell")))))))

; Azure Pipelines: pwsh shorthand (block scalar)
(block_mapping_pair
  key: (flow_node) @_pwsh
  (#any-of? @_pwsh "pwsh" "powershell")
  value: (block_node
    (block_scalar) @injection.content
    (#set! injection.language "powershell")
    (#offset! @injection.content 0 1 0 0)))

; Azure Pipelines: pwsh shorthand (single-line)
(block_mapping_pair
  key: (flow_node) @_pwsh
  (#any-of? @_pwsh "pwsh" "powershell")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#set! injection.language "powershell")))

; Azure Pipelines: task: Bash@<N> -> inputs -> script
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^Bash@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "script")
          value: (block_node
            (block_scalar) @injection.content
            (#set! injection.language "bash")
            (#offset! @injection.content 0 1 0 0)))))))

; Azure Pipelines: task: Bash@<N> -> inputs -> script (single-line)
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^Bash@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "script")
          value: (flow_node
            (plain_scalar
              (string_scalar) @injection.content)
            (#set! injection.language "bash")))))))

; Azure Pipelines: bash shorthand (block scalar)
(block_mapping_pair
  key: (flow_node) @_bash
  (#eq? @_bash "bash")
  value: (block_node
    (block_scalar) @injection.content
    (#set! injection.language "bash")
    (#offset! @injection.content 0 1 0 0)))

; Azure Pipelines: bash shorthand (single-line)
(block_mapping_pair
  key: (flow_node) @_bash
  (#eq? @_bash "bash")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#set! injection.language "bash")))

; inject the language

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

; Github Actions
([
  (string_scalar)
  (block_scalar)
  (double_quote_scalar)
  (single_quote_scalar)
  (ERROR)
] @injection.content
  (#lua-match? @injection.content "[$]{{")
  (#set! injection.language "ghactions"))
