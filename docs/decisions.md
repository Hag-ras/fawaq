# Product Decisions – Fawaq

## Product Name

- Name: Fawaq
- Meaning: Wake up / alert before destination
- Focus: Reliability-critical alarm app

## Platform

- Android only (v1)

## Geographic Scope

- v1 targets Egypt (Cairo Metro)
- Architecture is designed to be country-agnostic
- Expansion to other countries planned post v1

## Framework & Tech

- Flutter for UI and app logic
- Native Android (Kotlin) for:
  - Foreground Service
  - Background location tracking
  - Alarm system

## Product Scope (v1)

- Metro Mode
- Vehicle Mode
- Metro Mode limitations:
  - Single metro line
  - No transfers / interchanges
  - Offline operation

## Reliability Principles

- Foreground Service is mandatory
- App must work with screen locked
- App must work while user is asleep
- Alarm must trigger even in silent mode
- Offline-first behavior

## AI Usage

- No AI inside the product runtime
- AI allowed only as a development assistant
- All runtime logic must be deterministic

## Backend

- No backend in v1
- No user accounts
- No cloud dependency during trips

## Non-Goals (Explicitly Out of Scope)

- iOS support in v1
- Walking mode
- Social features
- Analytics-heavy tracking
- Smart/AI predictions

## Guiding Principle

> Release early, but never release unreliable.
