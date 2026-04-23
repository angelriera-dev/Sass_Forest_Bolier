# Skill Registry

**For orchestrator use only.** Used by delegating agents to discover available skills.
Sub-agents load individual SKILL.md files on-demand; they do NOT read this registry.

Follows progressive disclosure: skills are loaded on-demand, not pre-digested.

**Version**: 2.4.0 | **Last Updated**: 2026-04-22 | **Spec**: https://agentskills.io/specification

## Available Skills

### Global Technology Skills

| Trigger | Skill | Path | Version |
|---------|-------|------|---------|
| Django templates, HTMX, Alpine.js, Tailwind | django-htmx | `SKILLS/django-htmx/SKILL.md` | 1.0 |
| Django allauth setup, templates, configuration | django-allauth | `SKILLS/django-allauth/SKILL.md` | 1.0 |
| HTMX swap, events, OOB updates, indicators | htmx-patterns | `SKILLS/htmx-patterns/SKILL.md` | 1.0 |
| AppSec review, security audit, vulnerability scan | web-design-guidelines | `/home/rag/.agents/skills/web-design-guidelines/SKILL.md` | 1.0 |

### Local Architecture Skills

| Trigger | Skill | Path | Scope | Version |
|---------|-------|------|-------|---------|
| Editing docs, ADRs, governance, or documentation indexes | local-architecture-docs | `SKILLS/local-architecture-docs/SKILL.md` | `docs/` | 2.0 |
| Editing templates, components, or template conventions | local-architecture-templates | `SKILLS/local-architecture-templates/SKILL.md` | `templates/` | 2.2 |

**Note**: Each skill's SKILL.md contains complete rules. Delegators inject matching skills into sub-agent prompts; sub-agents do NOT pre-load all rules.

---

## Project Conventions

| File | Path | Notes |
|------|------|-------|
| Agent Configuration | `AGENTS.md` | Stack, conventions, build/test commands |
| Workflow Governance | `docs/workflow-governance.md` | Mandatory sequence for migrations, integrations, and new conventions |
| Security-First Roadmap | `docs/PDR/PDR.md` | 6-phase evolutionary plan |
| Architecture Decisions | `docs/adr/` | ADR-* files explaining design choices |
| Change History | `CHANGELOG.md` | Timestamped log of all modifications |
| Skills Overview | `SKILLS/README.md` | Index of all project skills |

See `AGENTS.md` for development standards and source-of-truth precedence. See `SKILLS/README.md` for a human-readable skill index.
