# Academic Document Skill

An Agent Skill for writing papers, reports, research notes, essays, proposals,
and technical documents using the bundled **Document-Template**.

The template is the starting point, not a prescribed document structure. Unlike
the companion Academic Beamer skill, this skill has no outline-approval gate or
presentation rules: a short note can stay short, and sections follow the task.

## Install

From this repository's root, install the self-contained `academic-document/`
directory into your agent's skill directory.

For agents using `~/.agents/skills` (including Codex):

```sh
mkdir -p ~/.agents/skills
cp -R academic-document ~/.agents/skills/academic-document
```

For Claude Code:

```sh
mkdir -p ~/.claude/skills
cp -R academic-document ~/.claude/skills/academic-document
```

These commands assume the destination skill does not already exist. For a
project-local installation, use `.agents/skills/academic-document` or
`.claude/skills/academic-document` inside that project instead. Restart or refresh
the agent's skill discovery after installation. Neither sibling template
repository is needed at runtime.

## Use

The skill's description covers starting written documents even when the prompt
does not mention LaTeX. Automatic selection depends on the agent host; name the
skill explicitly when you want to ensure it is selected:

```text
Use academic-document to write a short research note from notes.md.
```

```text
Use academic-document to draft a proposal using these notes and references.bib.
Use A4 paper; no abstract is needed.
```

```text
Use academic-document to migrate draft.tex into a separate project using my
Document-Template. Preserve the figures, citations, and notation.
```

The workflow reads available sources, creates or revises the document, removes
sample content, compiles it, and inspects the rendered pages when tools permit.
It respects explicitly requested output formats and mandatory venue classes;
it is not a rule to turn chat replies, emails, or README edits into PDFs.

## Requirements

- `latexmk`, LuaLaTeX, and Biber. A complete TeX Live installation (MacTeX on
  macOS) is the simplest way to supply the style's packages and fonts.
- For visual review: a PDF renderer such as Poppler's `pdftoppm` and an agent
  capable of inspecting images. `pdfinfo` is useful for page counts and metadata.

Project creation is offline and does not require TeX. The skill reports missing
build or inspection tools instead of treating unverified source as finished.

## Create a project directly

```sh
bash academic-document/scripts/create-document.sh ./my-document
cd my-document
# Replace the sample content in document.tex and references.bib.
latexmk document.tex
```

The helper copies the minimal starter as `document.tex`, along with
`document.sty`, `references.bib`, `.latexmkrc`, and `LICENSE.txt`. It checks all
destination filenames before copying and refuses collisions, including dangling
symlinks. Existing unrelated files are left alone.

The PDF is `my-document/output/document.pdf`. Defaults are 12pt, US Letter,
single-column layout, Libertinus Serif, one-inch margins, and one-and-a-half
spacing. The starter also supports 10pt/11pt and A4. LuaLaTeX is the default;
the upstream template additionally supports XeLaTeX and pdfLaTeX.

The complete example at
[`academic-document/assets/template/document.tex`](academic-document/assets/template/document.tex)
shows mathematics, theorems, figures, tables, code, citations, and appendices.
It is a reference, not content to retain in a new document.

## Template source and maintenance

The bundled files are an unmodified local snapshot of `Document-Template`.
[`template-source.json`](template-source.json) records their SHA-256 hashes and
source directory; it does not claim a published release or remote repository.
The original template directory is not modified by this skill.

To refresh the snapshot, copy the files listed in that manifest from the updated
template, refresh their hashes, and compile both the minimal starter and complete
example in a disposable directory. Inspect the resulting pages before shipping.

Run the project-creation safety checks with:

```sh
bash tests/test_create_document.sh
```

These exercise existing-file and dangling-symlink protection. They do not replace
an actual LaTeX build and PDF inspection.

## License

Skill instructions, scripts, tests, and documentation use the MIT license in
[`LICENSE`](LICENSE). The installable package includes its own copy.
Bundled template notices and LPPL-1.3c-or-later terms are retained separately;
see [`THIRD_PARTY_LICENSES.md`](THIRD_PARTY_LICENSES.md).
