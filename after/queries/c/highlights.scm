;; extends

((storage_class_specifier) @storageclass
  (#eq? @storageclass "static")
  (#set! priority 110))

(["enum" "struct" "union"] @keyword.declaration_type
  (#set! priority 110))

((type_qualifier) @storageclass
  (#eq? @storageclass "const")
  (#set! priority 110))
