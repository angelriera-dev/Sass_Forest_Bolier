---
name: local-architecture-docs
description: >
  Use this skill when editing files in docs/ or updating ADRs, governance docs,
  change summaries, documentation indexes, or documentation conventions for this
  repository. It describes the local architecture and operating rules specific
  to the docs/ area of this project.
license: MIT
metadata:
  author: rag
  version: "2.0"
---

## When to Use

Use this skill when:

- Editing documentation in `docs/`
- Creating or updating ADRs in `docs/adr/`
- Updating documentation indexes or navigation
- Documenting workflow, migration, or integration changes
- Revising folder-scoped documentation conventions for this repository

If the task changes project-wide workflow, architecture, or integration rules, follow `docs/workflow-governance.md` before implementation.

## Local Scope

- Primary folder: `docs/`
- Key decision records: `docs/adr/`
- Governance process: `docs/workflow-governance.md`

## Core Rules

1. Keep documentation concise and canonical.
2. Link to files instead of duplicating large content blocks.
3. Put governance process details in `docs/workflow-governance.md`, not in multiple files.
4. Record governance-impacting changes in `CHANGELOG.md`.
5. Keep documentation in English.

## Default Procedure

1. Classify the change as local-only or governance-impacting.
2. Update or add the relevant doc in `docs/`.
3. If conventions changed, update the related ADR and agent context files.
4. Update `CHANGELOG.md`.
5. Validate referenced paths and commands.

## Reference

- `AGENTS.md`
- `docs/workflow-governance.md`
- `docs/adr/`
- `CHANGELOG.md`
