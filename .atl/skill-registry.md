# Skill Registry

**For orchestrator use only.** Used by delegating agents to discover available skills.
Sub-agents load individual SKILL.md files on-demand; they do NOT read this registry.

Follows progressive disclosure: skills are loaded on-demand, not pre-digested.

**Version**: 2.0.0 | **Last Updated**: 2026-04-21 | **Spec**: https://agentskills.io/specification

## Available Skills

| Trigger | Skill | Path | Version |
|---------|-------|------|---------|
| Django templates, HTMX, Alpine.js, Tailwind | django-htmx | .config/opencode/skills/django-htmx/SKILL.md | 1.0 |
| Django allauth setup, templates, configuration | django-allauth | .config/opencode/skills/django-allauth/SKILL.md | 1.0 |
| HTMX swap, events, OOB updates, indicators | htmx-patterns | .config/opencode/skills/htmx-patterns/SKILL.md | 1.0 |
| Documentation management and reporting | documentation-management | docs/SKILL.md | 1.0 |
| Project templates and components | project-templates | templates/SKILL.md | 1.0 |

---

## Project-Local Skills

Project-local skills loaded on-demand by agents when triggered:

| Skill | Location | Trigger |
|-------|----------|---------|
| Documentation Management | `docs/SKILL.md` | Adding docs, preparing change reports |
| Project Templates | `templates/SKILL.md` | Modifying templates, creating components |

**Note**: Each skill's SKILL.md contains complete rules. Delegators inject matching skills into sub-agent prompts; sub-agents do NOT pre-load all rules.

---

## Project Conventions

| File | Path | Notes |
|------|------|-------|
| Agent Configuration | `AGENTS.md` | Stack, conventions, build/test commands |
| Security-First Roadmap | `docs/PDR/PDR.md` | 6-phase evolutionary plan |
| Architecture Decisions | `docs/adr/` | ADR-* files explaining design choices |
| Change History | `CHANGELOG.md` | Timestamped log of all modifications |

See `AGENTS.md` for development standards. See `.atl/skill-registry.md` itself for skill locations.
