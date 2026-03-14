# DepredadorCloud Website

A Flutter Web application for DepredadorCloud, a Centro de Informática y Mecánica Pesada (IT & Heavy Mechanics Center) located in El Salvador.

## Architecture

- **Framework**: Flutter Web (compiled to static HTML/JS/CSS)
- **Language**: Dart 3.8.0
- **Flutter Version**: 3.32.0 (installed via Nix system dependency)
- **Build output**: `build/web/`

## Key Dependencies

- `go_router` - Client-side routing
- `responsive_framework` - Responsive layouts
- `google_fonts` - Outfit & Space Grotesk fonts
- `lucide_icons` - Icon set
- `particles_flutter` 0.1.4 - Particle animation backgrounds
- `flutter_tilt` - 3D card tilt effects
- `animated_text_kit` - Typewriter text animation
- `animate_do` - Entrance animations
- `seo_renderer` - SEO meta rendering (local package in `packages/seo_renderer`)
- `url_launcher` - Email/link launching

## Features

- Bilingual (Spanish/English) with toggle
- IT Mode / Mechanic Mode toggle with different particle effects and color themes
- Pages: Home, IT Services, Mechanics, Agents
- Particle background animations
- Responsive design for mobile, tablet, desktop
- Interactive diagnostics section
- Glassmorphism design

## Development Workflow

The workflow builds the Flutter web app and serves it via Python's HTTP server:

```
flutter build web --release && python3 -m http.server 5000 --directory build/web --bind 0.0.0.0
```

Port: **5000** (webview)

## Notes

- SDK constraint lowered from `^3.10.3` to `^3.8.0` to work with available Flutter 3.32.0
- `particles_flutter` pinned to `0.1.4` (newer 2.0.2 has breaking API changes - uses `connectDots` instead of `isLineVisible`/`lineColor`)
- The `isLineVisible` and `lineColor` params replaced with `connectDots` in source code to match v0.1.4 API

## Deployment

Configured as a static deployment:
- Build: `flutter build web --release`
- Public directory: `build/web`
