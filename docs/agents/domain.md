# Domain docs

This project uses a single context: a root `GLOSSARY.md` and `docs/adr/`.
Domain modeling creates them lazily when terminology or decisions are resolved.

## Before exploring

Read `GLOSSARY.md` and any ADRs in `docs/adr/` relevant to the area being changed.
If they do not exist, proceed silently; their absence is not a setup task.

If a future reorganization introduces `GLOSSARY-MAP.md`, follow its pointers to
relevant context glossaries and read both system-wide and context-specific ADRs.

## Vocabulary and decisions

Use the glossary's terms in code, issue titles, proposals, and tests. If a new
concept has no entry, first check whether an existing term covers it; otherwise
record the gap for `/domain-modeling`.

If a proposal contradicts an ADR, identify the decision and explain why it
should be reopened rather than silently overriding it.
