---
name: academic-document
description: >
  Use when starting or drafting a written document such as a research paper,
  report, research note, essay, proposal, or technical write-up, even when the
  user has not explicitly requested LaTeX or named a template. Also use when
  revising, migrating, compiling, or visually checking documents based on
  Document-Template. Start new documents from the bundled LaTeX article
  template; this is for prose documents, not presentation slides.
license: MIT for skill instructions and scripts (LICENSE); template terms in assets/template/LICENSE.txt.
compatibility: Requires latexmk, LuaLaTeX, and Biber for compilation; PDF inspection requires a renderer such as pdftoppm and image-viewing support.
---

# Academic Document

Use the bundled Document-Template as the starting point for written documents.
The template supplies the appearance; the user's purpose determines the structure.

## Template first

For a new document, copy the bundled starter and preserve `document.sty` rather
than designing another preamble. The default is a single-column, 12pt, US Letter
article with one-inch margins, Libertinus Serif, one-and-a-half-spaced prose,
a white page, and page numbers. Supported controls are `10pt`, `11pt`, or `12pt`
and `letterpaper` or `a4paper`; use the defaults unless the request says otherwise.

An explicit output format or mandatory journal/university class takes precedence.
Explain a template conflict rather than silently substituting this article class.
Ordinary chat answers, emails, README edits, and slide decks are outside this
skill's default scope.

## Workflow

1. **Read the inputs.** Inspect the supplied notes, papers, TeX, figures, and
   bibliography. Infer purpose, audience, language, length, and title metadata
   from the request and sources. Ask only about missing requirements that
   materially change the document; otherwise proceed with stated assumptions.
2. **Start from the template.** Resolve paths below relative to this `SKILL.md`,
   not the user's working directory. For a new project, run:

   ```sh
   bash <skill-directory>/scripts/create-document.sh <target-directory>
   ```

   Edit the generated `document.tex`. The helper also copies `document.sty`,
   `references.bib`, `.latexmkrc`, and `LICENSE.txt`, and refuses to overwrite
   existing destination files. In an existing template-based project, revise
   its own sources and preserve filenames, local style changes, and organization.
   For a requested migration, use a separate destination and carry over the
   actual figures, bibliography, and included files.
3. **Write the appropriate document.** Choose sections that serve the task.
   A short note may need only a title and a few sections; a paper may need an
   abstract, analysis, references, and appendices. The starter's section names
   are examples, not required structure. Draft directly unless the user asks
   to approve an outline. Read [authoring guidance](references/authoring.md)
   when adapting title metadata, citations, mathematical content, floats, or
   other template features. For concrete LaTeX patterns, consult the relevant
   parts of `assets/template/document.tex`, the complete upstream example.
4. **Replace the demonstration content.** Update the title, authors,
   affiliations, date, and PDF metadata together. Keep contact details and
   acknowledgements only when supplied. Remove sample instructions, the sample
   Melitz citation and bibliography entry unless actually relevant, and unused
   sections. Preserve source claims, notation, units, qualifications, and
   attribution. Missing evidence is an explicit gap in a draft, not an invented
   result or citation.
5. **Compile and inspect.** Follow the build and review steps below. Fix source
   errors and visible defects, rebuild, and reinspect affected pages.
6. **Deliver.** Report the editable source and PDF paths, page count, selected
   font/paper options, compilation status, visual-review coverage, and any
   remaining warnings or factual gaps. Distinguish a draft from a finished
   document and a compiled PDF from one actually inspected.

## Build and review

From the document directory, run:

```sh
latexmk -lualatex -interaction=nonstopmode -halt-on-error -file-line-error document.tex
```

The copied `.latexmkrc` writes `output/document.pdf` and build files to `output/`.
Use the actual entry-point filename in an existing project. LuaLaTeX is the
default; use the upstream-supported XeLaTeX (`-xelatex`) or pdfLaTeX (`-pdf`)
only when required, and report that choice. Use `latexmk` rather than a single
engine pass so Biber and cross-reference reruns complete.

Inspect the final `.log` and, when citations are used, `.blg`. Resolve build
errors, missing files or glyphs, undefined citations/references, font
substitutions, and pending rerun requests. Check overfull boxes against the PDF;
fix actual overflow without shrinking the whole document or changing its margins.

When a renderer is available, render the PDF to images, for example:

```sh
mkdir -p output/review
pdftoppm -scale-to 1600 -png output/document.pdf output/review/page
```

Inspect the title and metadata, page breaks, headings, equations, figure/table
placement, captions, code, and bibliography. For a new document, inspect every
page; after a targeted revision, inspect changed pages and adjacent pages as
well as any pagination affected downstream. Text extraction and a successful
build are not substitutes for visual inspection.

If TeX tools, fonts, or image inspection are unavailable, identify the exact
blocker and report the unperformed checks. Do not install system packages
without permission or claim an uncompiled/uninspected document is verified.
