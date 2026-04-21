---
name: local-architecture-templates
description: >
  Use this skill when editing files in templates/ or defining component,
  rendering, or styling conventions for the template layer of this repository.
  It explains the local architecture, boundaries, and reusable patterns specific
  to the templates/ area of this project.
license: MIT
metadata:
  author: rag
  version: "2.2"
---

## When to Use

Use this skill when:

- Creating or modifying templates in `templates/`
- Adding or refactoring reusable components in `templates/components/`
- Applying folder-specific rendering and styling conventions
- Updating template architecture for this repository

If the task changes the rendering model, shared component structure, or frontend workflow, follow `docs/workflow-governance.md` first.

## Local Scope

- Primary folder: `templates/`
- Shared components: `templates/components/`
- Related workflow rules: `docs/workflow-governance.md`

## Current Stack Context

- Django templates
- HTMX
- Alpine.js
- Tailwind CSS
- DaisyUI

Use `SKILLS/django-htmx/SKILL.md` for cross-project HTMX and Alpine patterns.

## Local Conventions

1. Prefer reusable components from `templates/components/`.
2. Keep template conventions local to the `templates/` architecture skill.
3. Prefer DaisyUI and Tailwind utilities over custom CSS where possible.
4. Escalate workflow or rendering-model changes through ADR + governance first.

## Default Procedure

1. Identify the template or component scope.
2. Reuse existing components before adding new ones.
3. Apply project-local naming and structure conventions.
4. Update related documentation if the convention changes.
5. Run validation commands required by `AGENTS.md` when the change affects behavior.

## Reference

- `AGENTS.md`
- `docs/workflow-governance.md`
- `SKILLS/django-htmx/SKILL.md`
- `CHANGELOG.md`
