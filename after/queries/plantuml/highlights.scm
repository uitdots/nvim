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
] @keyword

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "<"
  ">"
] @punctuation.bracket

(uniqkey) @variable

(string) @string

((identifier) @function
  . (#any-of? @function
    "autonumber"
    "skinparam"))

(uniquevar
  (identifier) @type.definition)

(command
 . (identifier) @keyword
 . (_)* @string
 (#any-of? @keyword
   "actor"
   "alt"
   "as"
   "boundary"
   "break"
   "class"
   "collections"
   "control"
   "critical"
   "database"
   "else"
   "end"
   "entity"
   "group"
   "json"
   "loop"
   "note"
   "object"
   "package"
   "par"
   "participant"
   "queue"
   "rectangle"))

((identifier) @boolean
  (#any-of? @boolean
    "true"
    "false"))

(block_style
  head: (identifier) @type.definition
  end: (identifier) @type.definition)

(block_1
  (identifier) @type.definition)

(comment) @comment

; a -- b
; a --> b: bla
; and more
(command
  . [
      (identifier) @variable
      (block
        (identifier) @variable)
  ]
  . [
      (
        (uniqkey)+ @punctuation.arrow
        (identifier) @punctuation.arrow
        (uniqkey)* @punctuation.arrow
      )
      (
        (uniqkey)* @punctuation.arrow
        (identifier) @punctuation.arrow
        (uniqkey)+ @punctuation.arrow
      )
      (uniqkey)+ @punctuation.arrow
  ]
  . [
      (identifier) @variable
      (block
        (identifier) @variable)
  ]
  . (
      (uniqkey) @punctuation.delimiter
      (_)+ @string
      (#eq? @punctuation.delimiter ":"))?
  (#not-any-of? @punctuation.arrow ":"))

; left to right direction
(command
  . (identifier) @constant
  . (identifier) @keyword
  . (identifier) @constant
  . (identifier) @keyword.direction
  (#eq? @keyword.direction "direction"))

; note
(command
  . (identifier) @keyword.note
  . (identifier) @constant.direction
  . (identifier) @keyword.of
  . [
      (string) @vairable
      (identifier) @variable
      (block
        (identifier) @variable)
  ]
  . (
      (uniqkey)? @punctuation.delimiter
      (_)* @string
      (#eq? @punctuation.delimiter ":"))?
  (#eq? @keyword.note "note")
  (#any-of? @constant.direction
    "down"
    "left"
    "right"
    "top"))

; actor a as A
(command
  . (identifier) @keyword
  . (identifier) @variable
  . (identifier) @keyword.as
  . [
    (identifier) @variable
    (block
      (identifier) @variable)
  ] (#eq? @keyword.as "as"))

; activate a
; deactivate a
(command
  . (identifier) @keyword
  . [
      (identifier) @variable
      (block
        (identifier) @variable)
  ]
  (#any-of? @keyword
    "activate"
    "deactivate"))
