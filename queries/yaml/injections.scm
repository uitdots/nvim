; Copied from nvim-treesitter (no `; extends`): its scalar `script` -> bash rule
; double-injects Azure task inputs. `script` kept only for GitLab list form.

((comment) @injection.content
  (#set! injection.language "comment"))

; Github actions ("run") / Gitlab CI ("scripts")
; Taskfile scripts ("cmds", "cmd", "sh")
(block_mapping_pair
  key: (flow_node) @_run
  (#any-of? @_run "run" "before_script" "after_script" "cmds" "cmd" "sh")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#set! injection.language "bash")))

(block_mapping_pair
  key: (flow_node) @_run
  (#any-of? @_run "run" "before_script" "after_script" "cmds" "cmd" "sh")
  value: (block_node
    (block_scalar) @injection.content
    (#set! injection.language "bash")
    (#offset! @injection.content 0 1 0 0)))

(block_mapping_pair
  key: (flow_node) @_run
  (#any-of? @_run "run" "script" "before_script" "after_script" "cmds" "sh")
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          (plain_scalar
            (string_scalar) @injection.content))
        (#set! injection.language "bash")))))

(block_mapping_pair
  key: (flow_node) @_run
  (#any-of? @_run "script" "before_script" "after_script" "cmds" "sh")
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_scalar) @injection.content
          (#set! injection.language "bash")
          (#offset! @injection.content 0 1 0 0))))))

; Prometheus Alertmanager ("expr")
(block_mapping_pair
  key: (flow_node) @_expr
  (#eq? @_expr "expr")
  value: (flow_node
    (plain_scalar
      (string_scalar) @injection.content)
    (#set! injection.language "promql")))

(block_mapping_pair
  key: (flow_node) @_expr
  (#eq? @_expr "expr")
  value: (block_node
    (block_scalar) @injection.content
    (#set! injection.language "promql")
    (#offset! @injection.content 0 1 0 0)))

(block_mapping_pair
  key: (flow_node) @_expr
  (#eq? @_expr "expr")
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          (plain_scalar
            (string_scalar) @injection.content))
        (#set! injection.language "promql")))))

(block_mapping_pair
  key: (flow_node) @_expr
  (#eq? @_expr "expr")
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_scalar) @injection.content
          (#set! injection.language "promql")
          (#offset! @injection.content 0 1 0 0))))))

; Azure Pipelines: bash / script / pwsh / powershell step shorthand
(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @injection.language
        (#any-of? @injection.language "bash" "script" "pwsh" "powershell")
        value: (block_node
          (block_scalar) @injection.content)
        (#gsub! @injection.language "^script$" "bash")
        (#gsub! @injection.language "^pwsh$" "powershell")
        (#offset! @injection.content 0 1 0 0)))))

(block_sequence_item
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @injection.language
        (#any-of? @injection.language "bash" "script" "pwsh" "powershell")
        value: (flow_node
          (plain_scalar
            (string_scalar) @injection.content))
        (#gsub! @injection.language "^script$" "bash")
        (#gsub! @injection.language "^pwsh$" "powershell")))))

; Azure Pipelines: task -> inputs -> script, language from task name
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @injection.language)
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#any-of? @_script_key "script" "inlineScript" "Inline" "inline")
          value: (block_node
            (block_scalar) @injection.content)))))
  (#gsub! @injection.language "^AzureCLI@%d+$" "")
  (#gsub! @injection.language "^.*[Pp]ower[Ss]hell@%d+$" "powershell")
  (#gsub! @injection.language "^Python.*@%d+$" "python")
  (#gsub! @injection.language "^.*@%d+$" "bash")
  (#offset! @injection.content 0 1 0 0))

(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @injection.language)
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#any-of? @_script_key "script" "inlineScript" "Inline" "inline")
          value: (flow_node
            (plain_scalar
              (string_scalar) @injection.content))))))
  (#gsub! @injection.language "^AzureCLI@%d+$" "")
  (#gsub! @injection.language "^.*[Pp]ower[Ss]hell@%d+$" "powershell")
  (#gsub! @injection.language "^Python.*@%d+$" "python")
  (#gsub! @injection.language "^.*@%d+$" "bash"))

; Azure Pipelines: AzureCLI@N -> inputs -> scriptType + inlineScript
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^AzureCLI@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_type_key
          (#eq? @_type_key "scriptType")
          value: (flow_node) @injection.language)
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "inlineScript")
          value: (block_node
            (block_scalar) @injection.content)))))
  (#gsub! @injection.language "['\"]" "")
  (#gsub! @injection.language "^pscore$" "powershell")
  (#gsub! @injection.language "^ps$" "powershell")
  (#gsub! @injection.language "^batch$" "")
  (#offset! @injection.content 0 1 0 0))

(block_mapping
  (block_mapping_pair
    key: (flow_node) @_task_key
    (#eq? @_task_key "task")
    value: (flow_node) @_task_val
    (#lua-match? @_task_val "^AzureCLI@%d+$"))
  (block_mapping_pair
    key: (flow_node) @_inputs_key
    (#eq? @_inputs_key "inputs")
    value: (block_node
      (block_mapping
        (block_mapping_pair
          key: (flow_node) @_type_key
          (#eq? @_type_key "scriptType")
          value: (flow_node) @injection.language)
        (block_mapping_pair
          key: (flow_node) @_script_key
          (#eq? @_script_key "inlineScript")
          value: (flow_node
            (plain_scalar
              (string_scalar) @injection.content))))))
  (#gsub! @injection.language "['\"]" "")
  (#gsub! @injection.language "^pscore$" "powershell")
  (#gsub! @injection.language "^ps$" "powershell")
  (#gsub! @injection.language "^batch$" ""))

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
