[
 "@startuml"
 "@startjson"
 "@startyaml"
 "@startmindmap"
 "@enduml"
 "@endjson"
 "@endyaml"
 "@endmindmap"
 "$"
] @keyword.directive

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "<"
  ">"
  "|"
] @punctuation.bracket

(uniqkey) @variable

(string) @string @spell

((identifier) @function
  . (#any-of? @function
    "autonumber"
    "skinparam"))

(uniquevar
  (identifier) @type.definition)

(block_style
  head: (identifier) @type.definition
  end: (identifier) @type.definition)

(block_1
  (identifier) @type.definition)

(comment) @comment

; left to right direction
(command
  . (identifier) @constant.direction
  . (identifier) @keyword.to
  . (identifier) @constant.direction
  . (identifier) @keyword.direction
  (#any-of? @constant.direction
     "down"
     "left"
     "right"
     "top")
  (#eq? @keyword.to "to")
  (#eq? @keyword.direction "direction"))

; doing something with var
(command
  . (identifier) @function.call
  . [
      (identifier) @variable
      (block
        (identifier) @variable)]
  (#any-of? @function.call
    "activate"
    "deactivate"
    "remove"))

; for declare, doing sth with a target
; but not all of the class type
(command
  . (identifier) @type
  . [
      (identifier) @variable
      (block
        (identifier) @variable)]
  (#any-of? @type
    "abstract"
    "annotation"
    "circle"
    "class"
    "dataclass"
    "diamond"
    "entity"
    "enum"
    "exception"
    "interface"
    "metaclass"
    "protocol"
    "record"
    "stereotype"
    "struct"))

(command
 . (identifier) @keyword.type
 (#any-of? @keyword.type
   "package"
   "rectangle"))

(command
  (identifier) @keyword
  (#any-of? @keyword
    "again"
    "as"
    "detach"
    "end"
    "endif"
    "endswitch"
    "equals"
    "is"
    "kill"
    "not"
    "over"
    "ref"
    "split"
    "start"
    "stop"
    "then"))

; loop
(command
  . (identifier) @keyword.repeat
  . (_)* @string @spell
  (#any-of? @keyword.repeat
    "loop"
    "repeat"))

; repeat while
(command
  . (identifier) @keyword.repeat.repeat
  . [
      ((method
        (identifier) @keyword.repeat.while))
      ((identifier) @keyword.repeat.while
      . (block
          (identifier)+ @string @spell))]
  . (identifier) @keyword.operator.is
  . [
      ((block
          (identifier)+ @string @spell))
      (method
        (identifier))]
  . (identifier) @keyword.operator.not
  . [
      ((block
          (identifier)+ @string @spell))
      (method
        (identifier))]
  (#eq? @keyword.repeat.repeat "repeat")
  (#eq? @keyword.repeat.while "while")
  (#eq? @keyword.operator.is "is")
  (#eq? @keyword.operator.not "not"))

; for if elseif with empty ()
(method
 (identifier) @keyword.conditional
 (#any-of? @keyword.conditional
   "elseif"
   "if"))

(command
  (identifier) @keyword.conditional
  . (block
      (_)* @string @spell)
  (#any-of? @keyword.conditional
    "else"
    "elseif"
    "if"
    "then"))

; conditional
(command
  . (identifier) @keyword.conditional
  . (_)* @string @spell
  (#any-of? @keyword.conditional
    "alt"
    "else"
    "opt"))

((identifier) @boolean
  (#any-of? @boolean
    "true"
    "false"))

; : hehe ;
(command
  . (identifier)? @keyword
  . (uniqkey) @punctuation.delimiter.colon
  . (_)* @string @spell
  . (uniqkey) @punctuation.delimiter.semicolon
  (#any-of? @keyword
    "backward")
  (#eq? @punctuation.delimiter.colon ":")
  (#eq? @punctuation.delimiter.semicolon ";"))

; a -- b
; a --> b: bla
; and more
(command
  . [
      (identifier) @variable
      (block
        (identifier) @variable)]
  . [
      (
        (identifier) @operator
        (uniqkey)+ @operator
      )
      (
        (uniqkey)+ @operator
        (identifier) @operator
      )
      (
        (uniqkey)* @operator
        (identifier) @operator
        (uniqkey)* @operator
      )
      (uniqkey)+ @operator]
  . [
      (identifier) @variable
      (block
        (identifier) @variable)]
  . (
      (uniqkey) @punctuation.delimiter
      . [
          (_)+ @string @spell
          (_ (_)* @string @spell)+ @string @spell
      ]
      (#eq? @punctuation.delimiter ":"))?
  (#not-any-of? @operator ":"))

; note, ref over, with direction
(command
  . (identifier) @keyword
  . [
      (
        (identifier) @constant.direction
        . (identifier) @keyword.of
        . [
            (string) @variable
            (identifier) @variable
            (block
              (identifier) @variable)]
        (#any-of? @constant.direction
           "down"
           "left"
           "right"
           "top")
        (#eq? @keyword.of "of"))
      (
        (identifier) @keyword.over
        . [
            (string) @variable
            (identifier) @variable
            (block
              (identifier) @variable)]
        . (
            (uniqkey) @punctuation.comma
            . [
                (string) @variable
                (identifier) @variable
                (block
                  (identifier) @variable)]
            (#eq? @punctuation.comma ","))?
        (#eq? @keyword.over "over"))]
  . (
      (uniqkey) @punctuation.delimiter
      . (_)+ @string @spell
      (#eq? @punctuation.delimiter ":"))?
  (#any-of? @keyword
    "note"
    "ref"))

; actor a as A
; FIXME: nah this is bad
(command
  . (identifier) @type
  . [
      (identifier) @string @spell
      (string)]
  . (
      (identifier) @keyword
      . [
          (identifier) @variable
          (string) @variable])?
  (#any-of? @type
   "actor"
   "boundary"
   "collections"
   "control"
   "entity"
   "participant"
   "queue")
  (#eq? @keyword "as"))

; for usecase
; (command
;   . (identifier) @type
;   [
;     (
;       [
;         (identifier) @variable
;         (string) @variable @spell]
;       . (
;           (identifier) @keyword
;           . [
;               (identifier) @string @spell
;               (string)])?)
;     (
;       (string)
;       .
;     )
;   (#eq? @type "usecase")
;   (#eq? @keyword "as"))

; usecase
(command
  . (identifier) @type
  . [
      (
        [
          (string)+ @string @spell
          (identifier)+ @string @spell
          (block
            (identifier)* @string @spell)
        ]
        . (identifier) @keyword.as
        . [
            (identifier) @variable
            (string) @variable
        ])
      (
        (identifier) @variable
        . (identifier) @keyword.as
        . (string) @string @spell)
  ]
  (#eq? @type "usecase")
  (#eq? @keyword.as "as"))

(command
  (uniqkey) @punctuation.bracket
  . [
      (identifier) @class
      (block
        (identifier) @class)]
  (uniqkey) @punctuation.bracket
  (#eq? @punctuation.bracket "|"))

; for keyword and string after it
(command
  . (identifier) @keyword
  . (_)* @string @spell
  (#any-of? @keyword
    "break"
    "critical"
    "database"
    "group"
    "json"
    "object"
    "par"))

; break
(command
  . (identifier) @keyword.return
  . (_)* @string @spell
  (#eq? @keyword.return
    "break"))
