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

(command
 . (identifier) @keyword
 (_)* @string
 (#any-of? @keyword
   "activate"
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
   "deactivate"
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

(uniquevar
  (identifier) @type.definition)

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
  . (identifier) @variable
  . (uniqkey)* @punctuation.arrow
  . (identifier) @variable
  . (uniqkey)? @punctuation.delimiter
  (_)* @string
  (#eq? @punctuation.delimiter ":"))

; a .. b
; a ..> b: bla
(command
  . (identifier) @variable
  . (uniqkey)* @punctuation.arrow
  . (identifier) @punctuation.arrow
  . (uniqkey)* @punctuation.arrow
  . (identifier) @variable
  . (uniqkey)? @punctuation.delimiter
  (_)* @string
  (#eq? @punctuation.delimiter ":"))

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
  . (identifier) @variable
  . (uniqkey) @punctuation.delimiter
  (_)* @string
  (#eq? @keyword.note "note")
  (#any-of? @constant.direction
    "down"
    "left"
    "right"
    "top")
  (#eq? @punctuation.delimiter ":"))

; actor a as A
(command
  . (identifier) @keyword
  . (identifier) @variable
  . (identifier) @keyword.as
  [
    (identifier) @variable
    (string)
  ] (#eq? @keyword.as "as"))

; activate a
; deactivate a
(command
  . (identifier) @keyword
  . (identifier) @variable
  (#any-of? @keyword
    "activate"
    "deactivate"))
