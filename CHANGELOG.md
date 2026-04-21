# CHANGELOG

All notable changes to this project are documented here.

Format: `YYYY-MM-DD — Summary — Files Affected`

---

## 2026-04-21 — Rename folder-scoped skills to `lacal_architecture_*` and move them under `SKILLS/`

**Summary**: Adopted a dedicated naming convention for project-local architecture skills so folder-scoped guidance is clearly separated from reusable technology skills. Moved the local documentation and template skills into `SKILLS/`, updated indexes and references, and recorded the policy in a new ADR.

**Files Affected**:
- `docs/adr/ADR-002-local-architecture-skill-naming.md` — Recorded the naming convention and migration plan
- `SKILLS/lacal_architecture_docs/SKILL.md` — New local architecture skill for `docs/`
- `SKILLS/lacal_architecture_templates/SKILL.md` — New local architecture skill for `templates/`
- `AGENTS.md` — Replaced old local skill references with the new convention and clarified global vs local skills
- `.atl/skill-registry.md` — Reindexed skills with a dedicated Local Architecture Skills section
- `SKILLS/README.md` — Updated the human-readable index to the new skill names and paths
- `docs/Home.md` — Replaced stale references with a smaller current documentation index
- `docs/SKILL.md` — Removed old skill entry point
- `templates/SKILL.md` — Removed old skill entry point

## 2026-04-21 — Refactor agent configuration to comply with agents.md + agentskills.io spec

**Summary**: Migrated project configuration from mixed-language, non-compliant structure to standards-compliant English-only format. Removed pre-digested Compact Rules (violates progressive disclosure). Fixed stale path references. Added YAML frontmatter to agent and skill definitions.

**Files Affected**:
- `AGENTS.md` — Added YAML frontmatter, fixed path refs, translated Spanish → English, added build/test commands
- `docs/SKILL.md` — Converted to invocable "Documentation Management" skill, added YAML frontmatter, translated to English
- `templates/SKILL.md` — Updated description, removed broken global skill refs, ensured English output
- `.atl/skill-registry.md` — Removed Compact Rules block, fixed paths (/dj/htmx → /my_sass), translated comments, simplified format
- `CHANGELOG.md` — Created to log all changes going forward

**Spec References**:
- https://agents.md/ — Standard for AGENTS.md files
- https://agentskills.io/specification — Standard for SKILL.md files

**Notes**:
- No code changes; config-only refactoring
- All agent output now English-only
- Progressive disclosure enabled: skills load on-demand, not pre-digested
- Sub-agents discover skills via registry table; full rules load from SKILL.md files

## 2026-04-21 — Register formal workflow governance for migrations, integrations, and new conventions

**Summary**: Added a project-wide formal process for workflow/stack migrations and integration-driven feature changes. Introduced a governance document, recorded the decision as an ADR, and updated agent/skill context so governance updates happen before implementation when conventions change.

**Files Affected**:
- `AGENTS.md` — Added source-of-truth hierarchy and mandatory change-governance sequence
- `docs/workflow-governance.md` — Added formal process, checklists, and ADR template
- `docs/adr/ADR-001-workflow-governance.md` — Recorded the governance decision and rationale
- `docs/Home.md` — Added quick links to the new governance and agent docs
- `docs/SKILL.md` — Added governance-first documentation rules
- `templates/SKILL.md` — Added migration guardrail for template-system changes
- `.atl/skill-registry.md` — Registered governance doc as a project convention resource

---

## Future Changes

_None logged yet. New entries will be added as changes occur._
