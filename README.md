# CaffChat

A real-time chat application built with Flutter, Firebase, and Clean Architecture principles.

## Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter (Dart 3.10+) |
| State Management | Riverpod + Riverpod Generator |
| Routing | GoRouter |
| Authentication | Firebase Auth |
| Database | Cloud Firestore |
| Code Generation | Freezed, JSON Serializable, Build Runner |
| Font | Poppins (custom asset) |
| Hooks | Flutter Hooks + Hooks Riverpod |

## Architecture

The project follows **Clean Architecture** with a clear separation into four layers. Dependencies flow inward — outer layers depend on inner layers, never the reverse.

```
┌─────────────────────────────────────────────────────┐
│                   Presentation                       │
│          (Pages, Widgets, Providers)                 │
├─────────────────────────────────────────────────────┤
│                     Domain                           │
│        (Entities, Repository Interfaces,             │
│                  Use Cases)                           │
├─────────────────────────────────────────────────────┤
│                      Data                            │
│       (Repository Implementations, Models)           │
├─────────────────────────────────────────────────────┤
│                      Core                            │
│    (Config, Design System, Router, Utils)            │
└─────────────────────────────────────────────────────┘
```

### Domain Layer (`lib/domain/`)

The innermost layer containing business logic with zero framework dependencies.

- **`entities/`** — Immutable data classes generated with Freezed.
  - `auth/auth_user.dart` — Lightweight auth identity (uid, email, displayName).
  - `user/user_profile.dart` — Full user profile stored in Firestore.
  - `result/result.dart` — Sealed `Result<T>` class (`Success`, `Failed`, `Cancel`) for explicit error handling without exceptions.
- **`repositories/`** — Abstract interfaces (contracts) that the data layer implements.
  - `auth/auth_repository.dart` — Auth operations (sign in, register, sign out, password reset).
  - `user/user_profile_repository.dart` — Firestore user profile CRUD + real-time stream.
- **`usecase/`** — Single-responsibility interactors that encapsulate one business action.
  - `auth/` — `SignIn`, `Register`, `SignOut`, `ForgotPassword`.

### Data Layer (`lib/data/`)

Implements domain contracts with concrete Firebase services.

- **`repositories/`** — Concrete implementations.
  - `auth/firebase_auth_repository.dart` — Wraps `FirebaseAuth` and maps to `AuthUser`.
  - `user/firestore_user_profile_repository.dart` — Wraps `Cloud Firestore` for profile CRUD and streams.
- **`models/`** — Data transfer objects that handle serialization.
  - `user/user_profile_model.dart` — Converts between Firestore documents (`Timestamp` ↔ `DateTime`) and domain `UserProfile` entities.

### Presentation Layer (`lib/presentation/`)

UI components and state management via Riverpod.

- **`pages/`** — Full-screen views.
  - `splash/` — Initial splash screen with session validation.
  - `auth/` — `LoginPage`, `RegisterPage`.
  - `home/` — `Homepage` (post-authentication landing).
- **`providers/`** — Riverpod providers generated with `riverpod_annotation`.
  - `auth/` — `AuthAction` (notifier for auth operations), `AuthState` (stream-based auth listener), repository and use case providers.
  - `user/` — `currentUserProfileProvider` (real-time Firestore profile stream), `userProfileRepositoryProvider`.
  - `theme_provider.dart` — Theme mode state.
- **`widgets/`** — Reusable UI components.
  - `misc/` — `CaffPrimaryButton`, `CaffTextField`.
- **`extensions/`** — Dart extension methods (reserved).

### Core Layer (`lib/core/`)

Shared utilities and infrastructure used across all layers.

- **`config/`** — `AppConfig` with environment enum (`dev`, `stag`, `prod`).
- **`design/`** — Design system tokens.
  - `caff_color.dart` — Color palette with `BuildContext` extensions.
  - `caff_text.dart` — Reusable text widget with consistent styling.
  - `caff_spacing.dart` — Spacing constants.
  - `caff_radius.dart` — Border radius constants.
  - `font_config/` — Font size and weight definitions.
  - `theme/` — Material `ThemeData` configuration (light & dark).
- **`router/`** — `GoRouter` configuration with auth-guarded redirects.
- **`lifecycle/`** — `AppLifecycle` widget for app state observation.
- **`utils/`** — `AppLogger` for structured logging.
- **`exceptions/`** — Custom app exceptions.

## Project Structure

```
lib/
├── main.dart                  # Production entry point
├── main_dev.dart              # Development entry point
├── main_stag.dart             # Staging entry point
├── app_bootstrap.dart         # Firebase init + ProviderScope
├── caff_app.dart              # Root MaterialApp.router widget
├── firebase_options.dart      # Generated Firebase config
│
├── core/
│   ├── config/                # Environment configuration
│   ├── design/                # Design system (colors, text, spacing, theme)
│   ├── exceptions/            # Custom exceptions
│   ├── lifecycle/             # App lifecycle observer
│   ├── router/                # GoRouter setup + route names
│   └── utils/                 # Logger
│
├── domain/
│   ├── entities/              # Freezed data classes (AuthUser, UserProfile, Result)
│   ├── repositories/          # Abstract repository contracts
│   └── usecase/               # Business use cases
│
├── data/
│   ├── models/                # Firestore serialization models
│   └── repositories/          # Firebase implementations
│
└── presentation/
    ├── extensions/             # Context extensions
    ├── pages/                  # Full-screen views (splash, auth, home)
    ├── providers/              # Riverpod state management
    └── widgets/                # Reusable UI components
```

## Firebase Services

| Service | Purpose |
|---------|---------|
| Firebase Auth | Email/password authentication |
| Cloud Firestore | User profile storage (`/users/{uid}`) |

### Firestore Security Rules

- Authenticated users can **read** any profile.
- Only the profile **owner** can **create** or **update** their document.
- Schema validation enforces required fields and field size limits.
- Immutable fields (e.g., `email`) are protected on update.
- Client-side **deletion is blocked** (reserved for Cloud Functions).

## Getting Started

### Prerequisites

- Flutter SDK `^3.10.1`
- Firebase CLI
- A Firebase project with Auth and Firestore enabled

### Setup

```bash
# Install dependencies
flutter pub get

# Run code generation (Freezed, JSON Serializable, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Deploy Firestore rules
firebase deploy --only firestore:rules
```

### Running

```bash
# Development
flutter run -t lib/main_dev.dart

# Staging
flutter run -t lib/main_stag.dart

# Production
flutter run -t lib/main.dart
```

## Design Principles

- **SOLID** — Single responsibility in use cases; dependency inversion via repository interfaces.
- **DRY** — Centralized design tokens, shared `Result` type, reusable widgets.
- **KISS** — Thin use cases delegate to repositories; no unnecessary abstractions.
- **YAGNI** — Features are built as needed, not speculatively.
- **Explicit error handling** — Sealed `Result<T>` over try-catch. Specific exception types only (`FirebaseException`, never generic `Exception`).
