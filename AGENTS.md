# Academic Document Skill

## Package boundary

`academic-document/` is the installable document-writing skill. Keep repository
plans, tests, and engineering-skill configuration outside that directory; they
are not part of generated documents or the installed skill's writing workflow.

## Agent skills

### Issue tracker

Specs and tickets use local Markdown under `.scratch/`. Before publishing,
fetching, or updating work items, including wayfinding maps, read
[the issue-tracker configuration](docs/agents/issue-tracker.md).

### Triage labels

Use the five canonical triage roles as local `Status:` values. Before triaging
work items, read [the label mapping](docs/agents/triage-labels.md).

### Domain docs

This is a single-context project. Before repository exploration or domain
modeling, read [the domain documentation rules](docs/agents/domain.md).
