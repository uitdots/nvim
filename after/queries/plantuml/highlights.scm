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
        (identifier) @punctuation.arrow
        (uniqkey)+ @punctuation.arrow
      )
      (
        (uniqkey)+ @punctuation.arrow
        (identifier) @punctuation.arrow
      )
      (
        (uniqkey)* @punctuation.arrow
        (identifier) @punctuation.arrow
        (uniqkey)* @punctuation.arrow
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
  . (identifier) @class
  . (identifier) @variable
  . (
      (identifier) @keyword.as
      . [
          (identifier) @variable
          (string) @string
      ]
  )?
  (#any-of? @class
   "actor"
   "boundary"
   "collections"
   "control"
   "entity"
   "participant"
   "queue"
   "usecase")
  (#eq? @keyword.as "as"))

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

(command
 . (identifier) @keyword
 . (_)* @string
 (#any-of? @keyword
   "alt"
   "as"
   "break"
   "class"
   "critical"
   "database"
   "else"
   "end"
   "group"
   "json"
   "loop"
   "note"
   "object"
   "par"))

(command
 . (identifier) @keyword
 (#any-of? @keyword
   "package"
   "rectangle"))

(command
 (identifier) @keyword
 (#any-of? @keyword
   "again"
   "elseif"
   "end"
   "endif"
   "equals"
   "if"
   "split"
   "start"
   "then"
   "stop"))

((identifier) @boolean
  (#any-of? @boolean
    "true"
    "false"))

; : hehe ;
(command
  (uniqkey) @punctuation.colon
  (_)*
  (uniqkey) @punctuation.semicolon
  (#eq? @punctuation.colon ":")
  (#eq? @punctuation.semicolon ";"))
