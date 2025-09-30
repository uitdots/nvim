" Add to your ~/.vim/after/syntax/go.vim or runtime path's after/syntax/go.vim
" This will augment the existing Go syntax with Swag annotations

" Set higher priority for Swag annotations to override Tree-sitter and LSP
syn cluster goCommentGroup add=goSwagAnnotation

" Swag annotation regions - match the entire comment line including "//"
syn match goSwagAnnotation "//\s*@\(title\|version\|description\|tag\|termsOfService\|contact\|license\|host\|BasePath\|accept\|produce\|query\|schemes\|externalDocs\|x-\|securityDefinitions\|securitydefinitions\|in\|name\|tokenUrl\|authorizationurl\|scope\|Summary\|Description\|ID\|Tags\|Accept\|Produce\|Security\|deprecated\|Param\|Success\|Failure\|response\|Header\|Router\|deprecatedrouter\)\S*.*$" contains=goSwagComment,swagGeneral,swagOperation,swagParam,swagSecurity,swagRouter,swagStatus contained containedin=goComment
syn match goSwagComment "^//\s*" contained

" ============================================================================
" General API Info annotations
" ============================================================================

" Basic info: @title, @version, @description
syn match swagGeneral "@\(title\|version\|description\|termsOfService\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained
syn match swagGeneralKeyword "@\(title\|version\|description\|termsOfService\)" contained

" Markdown description
syn match swagGeneral "@description\.markdown\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" Tag info: @tag.name, @tag.description, @tag.docs.url, @tag.docs.description
syn match swagGeneral "@tag\.\(name\|description\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained
syn match swagGeneral "@tag\.docs\.\(url\|description\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained
syn match swagGeneral "@tag\.description\.markdown\s*" contains=swagGeneralKeyword contained

" Contact info: @contact.name, @contact.url, @contact.email
syn match swagGeneral "@contact\.\(name\|url\|email\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" License info: @license.name, @license.url
syn match swagGeneral "@license\.\(name\|url\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" Host and path: @host, @BasePath
syn match swagGeneral "@\(host\|BasePath\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" MIME types: @accept, @produce
syn match swagGeneral "@\(accept\|produce\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" Query collection format
syn match swagGeneral "@query\.collection\.format\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" Schemes: @schemes
syn match swagGeneral "@schemes\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" External docs: @externalDocs.description, @externalDocs.url
syn match swagGeneral "@externalDocs\.\(description\|url\)\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

" Extensions: @x-*
syn match swagGeneral "@x-[a-zA-Z0-9_-]\+\s\+.*" contains=swagGeneralKeyword,swagGeneralValue contained

syn match swagGeneralValue "\s\+.*" contained

" ============================================================================
" Security Definitions
" ============================================================================

" Security definitions: @securityDefinitions.basic, @securitydefinitions.apikey, etc.
syn match swagSecurity "@securityDefinitions\.\(basic\|apikey\)\s\+.*" contains=swagSecurityKeyword,swagSecurityValue contained
syn match swagSecurity "@securitydefinitions\.oauth2\.\(application\|implicit\|password\|accessCode\)\s\+.*" contains=swagSecurityKeyword,swagSecurityValue contained

" Security parameters: @in, @name, @tokenUrl, @authorizationurl, @scope.*
syn match swagSecurity "@\(in\|name\|tokenUrl\|authorizationurl\)\s\+.*" contains=swagSecurityKeyword,swagSecurityValue contained
syn match swagSecurity "@scope\.[a-zA-Z0-9_-]\+\s\+.*" contains=swagSecurityKeyword,swagSecurityValue contained

syn match swagSecurityKeyword "@\(securityDefinitions\|securitydefinitions\|in\|name\|tokenUrl\|authorizationurl\|scope\)" contained
syn match swagSecurityValue "\s\+.*" contained

" ============================================================================
" API Operation annotations
" ============================================================================

" Operation details: @Summary, @Description, @ID, @Tags
syn match swagOperation "@\(Summary\|Description\|ID\|Tags\)\s\+.*" contains=swagOperationKeyword,swagOperationValue contained
syn match swagOperation "@description\.markdown\s\+.*" contains=swagOperationKeyword,swagOperationValue contained

" Accept/Produce
syn match swagOperation "@\(Accept\|Produce\)\s\+.*" contains=swagOperationKeyword,swagOperationValue contained

" Security
syn match swagOperation "@Security\s\+.*" contains=swagOperationKeyword,swagOperationValue contained

" Deprecated
syn match swagOperation "@deprecated\s*$" contains=swagOperationKeyword contained

" Extension
syn match swagOperation "@x-[a-zA-Z0-9_-]\+\s\+.*" contains=swagOperationKeyword,swagOperationValue contained
syn match swagOperation "@x-codeSample\s\+.*" contains=swagOperationKeyword,swagOperationValue contained

syn match swagOperationKeyword "@\(Summary\|Description\|ID\|Tags\|Accept\|Produce\|Security\|deprecated\|x-[a-zA-Z0-9_-]\+\)" contained
syn match swagOperationValue "\s\+.*" contained

" ============================================================================
" @Param - Enhanced to handle all cases
" ============================================================================

syn match swagParam "@Param\s\+\S\+\s\+\(query\|path\|header\|body\|formData\)\s\+\S\+\s\+\(true\|false\)\s\+.*" contains=swagParamKeyword,swagParamName,swagParamLocation,swagParamType,swagParamRequired,swagParamDesc,swagParamAttribute contained
syn match swagParamKeyword "@Param" contained
syn match swagParamName "\s\+\S\+" contained nextgroup=swagParamLocation skipwhite
syn match swagParamLocation "\(query\|path\|header\|body\|formData\)" contained nextgroup=swagParamType skipwhite
syn match swagParamType "\(\[\]\)\?\(string\|int\|integer\|number\|boolean\|object\|array\|file\)" contained nextgroup=swagParamRequired skipwhite
syn match swagParamRequired "\(true\|false\)" contained nextgroup=swagParamDesc skipwhite
syn match swagParamDesc '"\([^"]\|\\"\)*"' contained nextgroup=swagParamAttribute skipwhite

" Param attributes: Enums, Format, minlength, maxlength, minimum, maximum, default, example, collectionFormat, extensions
syn match swagParamAttribute "\(Enums\|Format\|minlength\|maxlength\|minimum\|maximum\|multipleOf\|default\|example\|collectionFormat\|extensions\|SchemaExample\)([^)]*)" contained contains=swagParamAttributeName,swagParamAttributeValue
syn match swagParamAttributeName "\(Enums\|Format\|minlength\|maxlength\|minimum\|maximum\|multipleOf\|default\|example\|collectionFormat\|extensions\|SchemaExample\)" contained
syn match swagParamAttributeValue "([^)]*)" contained

" ============================================================================
" @Success, @Failure, @Response, @Header
" ============================================================================

" Enhanced patterns to properly match all components including the model/type name
" Pattern: @Success 200 {type} model.Name "description"
syn match swagStatus "@\(Success\|Failure\|response\)\s\+\(\d\+\|default\)\s\+{\([^}]\+\)}\s\+\(\S\+\)\(\s\+.*\)\?" contains=swagStatusKeyword,swagStatusCode,swagStatusBrace,swagStatusType,swagStatusModel,swagStatusComment contained

" Header pattern
syn match swagStatus "@Header\s\+\(all\|\d\+\(,\d\+\)*\(,default\)\?\)\s\+{\([^}]\+\)}\s\+\(\S\+\)\s\+.*" contains=swagStatusKeyword,swagStatusCode,swagStatusBrace,swagStatusType,swagStatusModel,swagStatusComment contained

" Individual components
syn match swagStatusKeyword "@\(Success\|Failure\|response\|Header\)" contained
syn match swagStatusCode "\(\d\+\|default\|all\)" contained
syn match swagStatusBrace "[{}]" contained

" Type inside braces: {object}, {array}, {string}, etc.
syn match swagStatusType "{\@<=[^}]\+}\@=" contained

" Model name after the braces (e.g., model.Account, string, httputil.HTTPError)
syn match swagStatusModel "}\s*\zs\S\+" contained

" Description in quotes or plain text at the end
syn match swagStatusComment '"\([^"]\|\\"\)*"' contained
syn match swagStatusComment '\s\+[^"{]\+$' contained

" ============================================================================
" @Router and @deprecatedrouter
" ============================================================================

syn match swagRouter "@\(Router\|deprecatedrouter\)\s\+\S\+\s\+\[\(get\|post\|put\|delete\|head\|connect\|options\|patch\|trace\)\]" contains=swagRouterKeyword,swagRouterPath,swagRouterBracket,swagRouterMethod contained
syn match swagRouterKeyword "@\(Router\|deprecatedrouter\)" contained
syn match swagRouterPath "\s\+\S\+" contained
syn match swagRouterBracket "[\[\]]" contained
syn match swagRouterMethod "\(get\|post\|put\|delete\|head\|connect\|options\|patch\|trace\)" contained

" ============================================================================
" Godoc pattern
" ============================================================================

syn match swagGodoc "//\s*\S.*\s\+godoc\s*$" contains=swagGodocText,swagGodocKeyword contained containedin=goComment
syn match swagGodocText "//\s*\S.*" contained
syn match swagGodocKeyword "godoc" contained

" ============================================================================
" Highlighting - Use high priority
" ============================================================================

" Comment prefix
hi def link goSwagComment Comment

" General API Info
hi def link swagGeneralKeyword Type
hi def link swagGeneralValue String

" Security
hi def link swagSecurityKeyword Type
hi def link swagSecurityValue Identifier

" Operation
hi def link swagOperationKeyword Type
hi def link swagOperationValue String

" Param
hi def link swagParamKeyword Type
hi def link swagParamName Identifier
hi def link swagParamLocation Function
hi def link swagParamType Keyword
hi def link swagParamRequired Constant
hi def link swagParamDesc String
hi def link swagParamAttributeName Function
hi def link swagParamAttributeValue Constant

" Status (Success/Failure/Response/Header)
hi def link swagStatusKeyword Type
hi def link swagStatusCode Number
hi def link swagStatusBrace Special
hi def link swagStatusType Keyword
hi def link swagStatusModel Type
hi def link swagStatusComment String

" Router
hi def link swagRouterKeyword Type
hi def link swagRouterPath String
hi def link swagRouterBracket Special
hi def link swagRouterMethod Function

" Godoc
hi def link swagGodocText Comment
hi def link swagGodocKeyword Bold

" ============================================================================
" Neovim-specific configuration to override LSP and Tree-sitter
" ============================================================================

" Force syntax highlighting priority (add this at the end of the file)
if has('nvim')
  " Set syntax priority higher than semantic tokens
  syn sync fromstart

  " Ensure our highlight groups take precedence
  hi! link goSwagComment Comment
  hi! link swagGeneralKeyword Type
  hi! link swagGeneralValue String
  hi! link swagSecurityKeyword Type
  hi! link swagSecurityValue Identifier
  hi! link swagOperationKeyword Type
  hi! link swagOperationValue String
  hi! link swagParamKeyword Type
  hi! link swagParamName Identifier
  hi! link swagParamLocation Function
  hi! link swagParamType Keyword
  hi! link swagParamRequired Constant
  hi! link swagParamDesc String
  hi! link swagParamAttributeName Function
  hi! link swagParamAttributeValue Constant
  hi! link swagStatusKeyword Type
  hi! link swagStatusCode Number
  hi! link swagStatusBrace Special
  hi! link swagStatusType Keyword
  hi! link swagStatusModel Type
  hi! link swagStatusComment String
  hi! link swagRouterKeyword Type
  hi! link swagRouterPath String
  hi! link swagRouterBracket Special
  hi! link swagRouterMethod Function
  hi! link swagGodocText Comment
  hi! link swagGodocKeyword Bold
endif
