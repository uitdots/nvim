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
] @module

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

; for declare, doing sth with a target
; but not all of the class type
(command
  . (identifier) @keyword
  . [
      (identifier) @variable
      (block
        (identifier) @variable)]
  (#any-of? @keyword
    "abstract"
    "activate"
    "annotation"
    "circle"
    "class"
    "class"
    "class"
    "dataclass"
    "deactivate"
    "diamond"
    "entity"
    "enum"
    "exception"
    "interface"
    "metaclass"
    "protocol"
    "record"
    "remove"
    "stereotype"
    "struct"))

(command
 . (identifier) @keyword
 (#any-of? @keyword
   "package"
   "rectangle"))

(command
 (identifier) @keyword
 (#any-of? @keyword
   "again"
   "as"
   "end"
   "endif"
   "equals"
   "over"
   "ref"
   "split"
   "start"
   "stop"
   "then"))

; for if elseif with empty ()
(method
 (identifier) @keyword
 (#any-of? @keyword
   "elseif"
   "if"))

(command
  (identifier) @keyword
  . (block
      (identifier) @string)
  (#any-of? @keyword
    "elseif"
    "if"
    "then"))

((identifier) @boolean
  (#any-of? @boolean
    "true"
    "false"))

; : hehe ;
(command
  (uniqkey) @punctuation.colon
  (_)* @string
  (uniqkey) @punctuation.semicolon
  (#eq? @punctuation.colon ":")
  (#eq? @punctuation.semicolon ";"))

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
      (_)+ @string
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
      . (_)+ @string
      (#eq? @punctuation.delimiter ":"))?
  (#any-of? @keyword
    "note"
    "ref"))

; actor a as A
(command
  . (identifier) @type
  . [
      (identifier) @variable
      (string) @variable]
  . (
      (identifier) @keyword.as
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
   "queue"
   "usecase")
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
  . (_)* @string
  (#any-of? @keyword
    "alt"
    "break"
    "opt"
    "critical"
    "database"
    "else"
    "end"
    "group"
    "json"
    "loop"
    "object"
    "par"))
