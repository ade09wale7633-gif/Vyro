# Vyro

Vyro is an original Flutter mobile video-editor prototype for iOS and Android. The first commit establishes the branded project shell and a navigable editing workspace.

## Current prototype

- Dark creator-focused home screen with recent project cards
- Editor workspace with preview placeholder, playback toggle, timeline tracks, scrubber, and editing tool selection
- Original Vyro branding and responsive Flutter Material UI

The current editor is a UI prototype: media import, real-time playback, editing operations, AI tools, project persistence, and rendered export are not implemented yet.

## Run locally

Requires Flutter 3.22+ and Dart 3.3+.

```sh
flutter pub get
flutter run
```

## Roadmap

1. Add platform scaffolding and media picking/import.
2. Implement project/timeline models and non-destructive clip operations.
3. Connect preview playback and native rendering/export.
4. Add audio, text, transitions, filters, captions, and effects.
5. Add persistence, accessibility, tests, and device-specific polish.

Vyro is an independent product concept and is not affiliated with or a copy of CapCut.
