# CHANGELOG

All notable changes to this project are documented here.

Format: `YYYY-MM-DD — Summary — Files Affected`

---

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

---

## Future Changes

_None logged yet. New entries will be added as changes occur._
