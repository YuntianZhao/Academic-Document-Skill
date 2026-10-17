# Triage labels

For local specs and implementation tickets, record the mapped value on the
`Status:` line.

| Role in mattpocock/skills | Local status | Meaning |
| --- | --- | --- |
| `needs-triage` | `needs-triage` | Maintainer needs to evaluate the issue |
| `needs-info` | `needs-info` | Waiting on the reporter for information |
| `ready-for-agent` | `ready-for-agent` | Fully specified, ready for an autonomous agent |
| `ready-for-human` | `ready-for-human` | Requires human implementation |
| `wontfix` | `wontfix` | Will not be actioned |

When a skill asks to apply or remove a triage label, update the file's `Status:`
value. These are file-based states; no remote labels need creating.
Wayfinding tickets instead use the lifecycle defined in
[the issue-tracker configuration](issue-tracker.md#wayfinding-operations).
