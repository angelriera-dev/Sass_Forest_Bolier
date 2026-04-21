---
name: django-fortress-saas
description: >
  Security-first Django 6.x SaaS monolith with HTMX, Alpine.js, Tailwind CSS, and DaisyUI.
  Reference implementation of OWASP Top 10 2026 mitigations with modular, tested architecture.
version: "1.0"
---

# Django Fortress SaaS — Agent Configuration

## Project Overview

**Django Fortress** is a security-first SaaS boilerplate implementing OWASP Top 10 2026 standards natively.
While AI can generate code, developers own data integrity and architectural security.
This project provides a production-ready, audited foundation with zero shortcuts.

**Current Phase**: Phase 1 (Foundations & Hardening) — See `docs/PDR/` for full 6-phase roadmap.

## Development Standards

- Deliver small, correct, validated, and verifiable changes
- Security by default: OWASP mitigations are non-negotiable
- Test-driven: strict pytest-django mode active; 90%+ coverage required
- Educational: every decision backed by ADR explaining the "why"
- English-only output from agents

## Tech Stack

| Layer | Technology |
|-------|------------|
| Backend | Django 6.x |
| Auth | django-allauth |
| Frontend | HTMX + Alpine.js |
| CSS | Tailwind CSS + DaisyUI |
| DB | SQLite (dev) / PostgreSQL (prod) |
| Testing | pytest-django (Strict TDD) |
| Quality | Ruff, Pyright, Bandit, Semgrep |

## Project Structure

```
my_sass/
├── apps/
│   ├── users/          # User management + allauth
│   └── dashboard/      # Main app views
├── templates/
│   ├── components/     # Reusable UI components
│   ├── account/        # allauth templates
│   └── dashboard/      # App templates
├── config/
│   └── settings/       # Django settings (modular hierarchy)
├── docs/
│   ├── PDR/            # Product Requirements Document
│   └── adr/            # Architecture Decision Records
├── AGENTS.md           # This file
├── CHANGELOG.md        # Change log
├── Makefile            # Build entry point
└── requirements.txt
```

## Available Skills

| Skill | Trigger | Location |
|-------|---------|----------|
| **Documentation Management** | Adding docs, preparing reports | `docs/SKILL.md` |
| **Project Templates** | Modifying templates, creating components | `templates/SKILL.md` |
| **django-htmx** (global) | HTMX, Alpine.js, Tailwind patterns | Loaded on-demand |
| **django-allauth** (global) | Authentication, OAuth, MFA | Loaded on-demand |

## Build & Test Commands

- `make install` — Install dependencies
- `make run` — Start development server
- `make test` — Run pytest with coverage
- `make lint` — Run Ruff linter
- `make type-check` — Run Pyright static type checker

## Pre-Commit Workflow

1. Make changes in topic branch
2. Run `make test && make lint && make type-check`
3. If all pass: commit with conventional format — `git add . && git commit -m "type: subject"`
4. Update CHANGELOG.md BEFORE push
5. Create PR for review

## Key Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | This file; agent configuration |
| `docs/PDR/` | Product Requirements Document; 6-phase roadmap |
| `.atl/skill-registry.md` | Skill discovery registry (delegator-internal) |
| `CHANGELOG.md` | Timestamped record of all changes |
| `Makefile` | Single point of entry for all commands |

## Reference

- Product Vision: `docs/PDR/PDR.md`
- Phase 1 Details: `docs/PDR/Fase1.md`
- Security Standards: `docs/adr/`
- Change History: `CHANGELOG.md`
