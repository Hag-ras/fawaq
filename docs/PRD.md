# Product Requirements Document (PRD)

## Fawaq – v1

---

## 1. Overview

Fawaq is a reliability-critical Android application designed to wake users before they miss their destination while riding metro trains or vehicles.
The app is designed for situations where the user may be asleep, the phone screen is locked, and internet connectivity is unavailable.

Reliability, offline operation, and background execution are core requirements.

---

## 2. Problem Statement

Many commuters fall asleep during metro or vehicle rides and miss their destination.
Existing navigation apps are unreliable in underground environments, require constant interaction, or fail when running in the background.

Fawaq solves this by providing a deterministic, offline-capable alarm system that works reliably while the user is asleep.

---

## 3. Target Users

- Daily metro commuters
- Long-distance vehicle passengers
- Users who frequently sleep during rides
- Android users

---

## 4. Supported Platforms

- Android only (v1)

---

## 5. In-Scope Features (v1)

### 5.1 Metro Mode

- Supports one metro line only (Cairo Metro)
- User selects:
  - Destination station
  - Alert timing (number of stations before destination)
- Station tracking based on stop detection
- Works offline and underground

### 5.2 Vehicle Mode

- User selects destination location
- Alarm triggers when distance threshold is reached
- GPS-based tracking
- Works in background

### 5.3 Alarm System

- Exact alarm triggering
- Sound + vibration
- Works in silent mode
- Full-screen alarm UI

---

## 6. Out of Scope (v1)

- Multiple metro lines
- Metro transfers
- Walking mode
- iOS support
- User accounts
- Backend services
- AI-based prediction or optimization

---

## 7. Non-Functional Requirements

- Alarm must trigger within ±1 second of target condition
- App must survive background execution
- App must function without internet
- Battery usage must be reasonable and predictable

---

## 8. Reliability Requirements

- Foreground Service must remain active during trips
- App must handle OS background restrictions
- App must recover from app kill during active trip
- Alarm must be louder and more intrusive than standard notifications

---

## 9. Risks & Mitigations

### Risk: GPS loss underground

Mitigation: Station counting and time-based estimation

### Risk: OS killing background process

Mitigation: Foreground Service + battery optimization exclusion

### Risk: Alarm missed

Mitigation: Redundant alarm triggering mechanisms

---

## 10. Success Metrics

- Users report successful wake-up before destination
- No critical alarm failures
- Positive Play Store reviews citing reliability

---

## 11. Guiding Principle

Fawaq prioritizes reliability and user trust over feature completeness.
