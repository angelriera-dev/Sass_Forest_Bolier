# Frontend Refactor Notes

## Goal
Keep the frontend rebrand and ongoing refactor documented in a single file that is easy to maintain.

## Current State
- Global theme bootstrap already runs on `<html>` before first paint.
- Navbar, dashboard shell, alerts, badges, and shared `components/ui/*` primitives are in place.
- Account screens now use shared base shells for forms and status pages.
- Remaining heavy templates are mainly in dashboard settings/profile/plans and some landing sections.

## What Was Completed

### Rebrand foundation
- Unified theme handling and navbar behavior.
- Modernized dashboard shell and sidebar.
- Softened semantic colors for alerts/badges/destructive actions.
- Removed legacy template/component duplicates.

### Shared component system
- Standardized on:
  - `templates/components/ui/button.html`
  - `templates/components/ui/input.html`
  - `templates/components/ui/link.html`
  - `templates/components/ui/avatar.html`
  - `templates/components/alert.html`
  - `templates/components/badge.html`
  - `templates/components/error_block.html`

### Account shell reduction
- Added `templates/components/ui/auth_shell.html`
- Added `templates/components/ui/status_page.html`
- Migrated repeated account pages to those shells to reduce duplicated wrapper/card markup.

## Remaining Backlog

### High priority
1. Extract dashboard page header into a reusable component.
2. Split `templates/dashboard/settings.html` into reusable rows/sections.
3. Split `templates/dashboard/profile.html` into summary/security/danger blocks.
4. Extract plan cards and billing rows from `templates/dashboard/subscription_plans.html`.

### Medium priority
1. Normalize landing section wrappers into smaller components.
2. Tighten semantic color usage in profile/settings/destructive actions.
3. Add more route smoke coverage if new shared shells are introduced.

### Future priority
1. Add visual regression testing with screenshot baselines.
2. Add responsive screenshot coverage for light/dark modes.

## Testing Status
- `python manage.py check`
- `python manage.py test apps.dashboard`
- `DJANGO_SETTINGS_MODULE=config.settings.dev python -m pytest apps/users/tests/test_templates.py -q`

## Audit Summary
- No obviously dead runtime templates remain.
- Further code reduction should come from structural extraction, not file deletion.
- The best remaining wins are in dashboard pages and page-header abstraction.

## Working Rules
- Prefer shared shells over repeated page wrappers.
- Prefer DaisyUI/Tailwind primitives over page-local styling.
- Keep docs updates here instead of splitting status/backlog/audit into multiple small files.
