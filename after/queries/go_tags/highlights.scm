; extends

;; https://go.dev/wiki/Well-known-struct-tags
(document
  key: (identifier) @variable
  . value: (statement
    (statement_content) @spell)
  (#any-of? @variable
    "binding"
    "bson"
    "db"
    "gorm"
    "graphql"
    "json"
    "properties"
    "protobuf"
    "toml"
    "xml"
    "yaml"))
