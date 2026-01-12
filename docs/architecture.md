# System Design – Fawaq (v1)

---

## 1. Design Goals

The system design of Fawaq prioritizes:

- Reliability over features
- Deterministic behavior
- Offline operation
- Android OS-level guarantees

The app must function correctly while:

- The phone screen is locked
- The user is asleep
- Internet is unavailable
- The app is running in the background

---

## 2. High-Level Architecture

Fawaq consists of two main layers:

1. Flutter Layer (UI + App Logic)
2. Native Android Layer (Background & Alarm Reliability)

Flutter is responsible for user interaction and trip logic.
Native Android handles background execution and alarm delivery.

---

## 3. Flutter Layer Responsibilities

### 3.1 UI Layer

- Home screen (Metro / Vehicle selection)
- Metro setup screen
- Vehicle setup screen
- Active trip screen
- Alarm screen (visual layer)

Flutter UI must remain minimal and distraction-free.

---

### 3.2 Trip Engine

Responsible for:

- Starting and stopping trips
- Managing trip state
- Calculating remaining stations or distance
- Deciding when to trigger alarm

The Trip Engine does NOT directly interact with Android system services.

---

### 3.3 Metro Engine

Responsibilities:

- Load metro line data (JSON)
- Track station count
- Compare current station index with destination index
- Handle fallback estimation when GPS is unavailable

Metro Engine logic is deterministic and offline-only.

---

### 3.4 Vehicle Engine

Responsibilities:

- Track distance to destination
- Determine when distance threshold is reached
- Trigger alarm condition

---

### 3.5 Local Storage

- Stores active trip state
- Stores user preferences
- Allows trip recovery after app restart

No cloud storage is used in v1.

---

## 4. Native Android Layer Responsibilities

### 4.1 Foreground Service

- Runs continuously during an active trip
- Maintains background execution
- Displays persistent notification
- Prevents OS from killing the process

This is mandatory for reliability.

---

### 4.2 Background Location Tracking

- Uses Android location services
- Provides speed and movement data
- Continues tracking when screen is locked

Location updates are forwarded to Flutter via platform channels.

---

### 4.3 Alarm System

- Uses AlarmManager with exact alarms
- Acquires WakeLock when alarm triggers
- Shows full-screen alarm activity
- Plays sound and vibration even in silent mode

Alarm delivery must not depend on Flutter lifecycle.

---

### 4.4 Platform Channel Bridge

- Flutter → Android:
  - Start Foreground Service
  - Stop Foreground Service
  - Schedule alarm
- Android → Flutter:
  - Location updates
  - Station stop detection events
  - Alarm fired events

---

## 5. Data Flow (Simplified)

1. User starts trip in Flutter
2. Flutter requests Android to start Foreground Service
3. Android service begins location tracking
4. Location data sent to Flutter Trip Engine
5. Trip Engine evaluates alarm condition
6. Flutter requests Android to trigger alarm
7. Android alarm fires independently of Flutter UI

---

## 6. Failure Handling Strategy

### App Killed

- Foreground Service continues
- Trip state restored from local storage

### GPS Lost

- Metro Engine switches to time-based estimation
- Vehicle mode waits for GPS recovery

### OS Restrictions

- User prompted to disable battery optimizations
- Foreground notification always visible during trip

---

## 7. What This Design Explicitly Avoids

- Backend dependency
- AI-based decision making
- Cloud synchronization
- Continuous UI polling
- Map-heavy rendering in background

---

## 8. Design Principle Summary

- Flutter handles logic and UX
- Android handles survival and alarms
- No single point of failure
- Early alarm is better than late alarm
