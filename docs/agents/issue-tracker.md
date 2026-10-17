# Issue tracker: Local Markdown

Specs and issues live in `.scratch/`. This repository has no Git remote
configured; publishing work means writing local files, not creating remote
issues or repositories.

## Conventions

- One feature per directory: `.scratch/<feature-slug>/`.
- Spec: `.scratch/<feature-slug>/spec.md`.
- Implementation tickets: `.scratch/<feature-slug>/issues/<NN>-<slug>.md`,
  numbered from `01` in dependency order, one file per ticket.
- Triage state: a `Status:` line near the top of the spec or ticket, using
  [the configured roles](triage-labels.md).
- Dependencies: a `Blocked by:` line referencing the prerequisite tickets.
- Conversation: append under `## Comments`; preserve previous entries.

When a skill says to publish a spec or ticket, create its file and parent
directories. When it says to fetch a ticket, read the referenced path; resolve a
bare number within the named feature's `issues/` directory. If the feature is
ambiguous, ask which feature rather than choosing an unrelated ticket.

## Wayfinding operations

For `/wayfinder`, use `.scratch/<effort>/map.md` for the Notes,
Decisions-so-far, and Fog sections, with one child ticket per question under
`.scratch/<effort>/issues/NN-<slug>.md`.

- `Type:` records `research`, `prototype`, `grilling`, or `task`.
- Wayfinding tickets use lifecycle `Status:` values (`open`, `claimed`,
  `resolved`), separate from implementation-ticket triage roles.
- `Blocked by: NN, NN` lists dependencies within the effort. A ticket is
  unblocked when every listed ticket is resolved.
- Frontier: take the lowest-numbered open, unblocked ticket.
- Claim: save `Status: claimed` before beginning work.
- Resolve: append the answer under `## Answer`, set `Status: resolved`, and add
  a gist plus link to Decisions-so-far in the map.

Keep research branches and artifacts local while there is no remote; link
artifacts from the relevant ticket instead of attempting a push.
