# Authoring with Document-Template

## Title and metadata

Keep `\providecommand{\documentfontsize}{...}` and
`\providecommand{\documentpaper}{...}` before `\documentclass` in the starter.
Keep content in the `.tex` entry point and reusable appearance in `document.sty`.
Ordinary drafting should not require editing the style file.

Set `\title`, `\author`, and `\date`, and update `pdftitle` and `pdfauthor` in
`\hypersetup` to match. Use `\and` inside `\author{...}` for multiple authors
and `\date{}` to omit the date. If the user's name or affiliation is unknown,
omit it or identify it as missing rather than retaining the sample identity.

When contact details and acknowledgements are available, place them in a single
`\thanks{...}` inside `\title{...}`: email first, then acknowledgements and any
supplied disclaimer. This keeps the title's asterisk off the author names.
Remove the sample email, `xxx`, and generic disclaimer when they are not provided.

An abstract and `\keywords{...}` are optional. If included, the abstract should
describe what this document actually establishes; a proposal describes planned
work rather than reporting findings it does not yet have.

## Bibliography

The style already loads `biblatex-chicago` with Biber and author--date citations.
Declare the project's database with `\addbibresource{references.bib}`; use
`\textcite{key}` in prose and `\parencite{key}` parenthetically. Keep
`\printbibliography[heading=bibintoc,title={References}]` only when the document
needs references. For a citation-free note, remove the example citation and
bibliography commands instead of printing an empty bibliography.

Use the supplied `.bib` records or verify bibliographic metadata against the
actual source. Preserve citation keys on revision and carry over databases on
migration. Strip machine-local attachment paths from shared entries. The sample
Melitz record demonstrates syntax; it is not a default source for a new topic.
The style hides DOI, URL, ISBN, and eprint fields in the rendered bibliography,
but they may remain in the database.

## Equations and statements

Use `equation`, `align`, `\label`, and `\eqref` for numbered mathematics. The
style numbers equations within sections. Theorem, lemma, proposition, corollary,
definition, assumption, remark, and example environments share a section-local
counter, with the usual `proof` environment available. Reuse these definitions
instead of redeclaring them. `\appendix` changes section prefixes to letters;
figure and table numbers remain continuous.

The complete example, `../assets/template/document.tex`, demonstrates `\bm`,
`\mathbcal`, `\mathbscr`, and `\mathbfrak` with the configured math fonts.
Keep notation consistent with the user's sources.

## Figures, tables, and code

Use the relevant environments in the complete example as working patterns:

- **Figures:** include the actual image, preferably a vector PDF for plots and
  diagrams, sized relative to `\linewidth`. Put `\label` after `\caption` and
  use `\figurenote{...}` for sources, units, and qualifications. Carry external
  assets with the project using relative paths.
- **Tables:** use `booktabs` rules, a caption above the table, and the same note
  command underneath. Use `tabularx` for wrapping text or `longtable` for tables
  spanning pages; `longtable` is not nested inside a floating `table`.
- **Algorithms:** use the provided `algorithm` and `algorithmic` environments
  from `algorithm` and `algpseudocode`.
- **Code:** use `lstlisting` or `\lstinputlisting` with the existing
  `minimalcode` style. These need no external syntax highlighter or shell escape.

The full example uses PGFPlots only for its self-contained demonstration plot.
A document using ordinary image files does not need that additional package.
Read the example for syntax; its optimization model and illustrative numbers
are not evidence for a user's research.

Prose is one-and-a-half spaced; abstracts, captions, floats, code, footnotes,
and bibliography entries already have compact spacing. Use a local `singlespace`
environment only where needed. Fix oversized objects by wrapping, splitting,
or resizing the object while keeping it readable. Use
`\hypersetup{hidelinks}` when a submission requires black links. For text in a
script the bundled fonts do not cover, add appropriate language/font support
and verify the rendered glyphs rather than silently losing characters.
