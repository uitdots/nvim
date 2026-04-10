; extends

(
  (comment) @injection.language
  .
  (code
    (let
      value: (field
        (raw_blck
          (blob) @injection.content))))

  (#gsub! @injection.language "^//%s*language:%s*([%w%-_]+)%s*$" "%1")
  (#set! injection.combined)
)
