# Vyro Studio 2026 — Product Brief (v10)

**Product:** Vyro, an original mobile-first video editing app  
**Creator/brand attribution:** EMZYLIGHT  
**Platform target:** Flutter for Android and iOS  
**Design direction:** near-black `#050505`, charcoal `#121212`, royal gold `#FFD700`, white and grey; rounded cards and gold-accented controls.  
**Motto:** “Everyone gets every feature. Create without limits; plans change quality.”

> This is a product vision and planning document, not a claim that the listed features, AI models, integrations, pricing, privacy practices, or subscriptions are currently implemented. All commercial terms, safety statements, store policies, legal text, and data-handling promises must be validated before launch. The current repository contains an early Flutter UI prototype only.

## Product principles

- Make a useful free editing experience available; explain quality/export differences clearly and never imply that unbuilt features are available.
- Use original Vyro branding, designs, templates, and assets. Do not copy CapCut’s proprietary UI, assets, or source code.
- Ask permission before accessing media, camera, microphone, face-related tools, or cloud features. Keep editing functional offline where practical.
- Protect children and creators; use age-appropriate experiences, reporting and moderation, and obtain legal review for age gates and parental controls.
- Treat plans, prices, badges, and creator grants as configurable product concepts until validated. Do not embed secret admin credentials or payment secrets in the mobile client.

## Visual direction and first-run experience

- Black-and-gold splash screen with Vyro name, loading indicator, version label, and “Edit like a pro” tagline.
- Authentication concepts: email, phone verification, Google/Apple sign-in, guest mode, password visibility and recovery, and consent/age flows. Implement authentication with a trusted provider; never store raw passwords.
- Onboarding concepts: intended creation type, experience level, visual style, optional permission requests, and a short Home/Editor/Templates/Aura tour.
- Home: search, notifications, profile, project drafts, templates, creative tools, and a prominent New Project action.
- Profile: account details, project/library views, settings, and clearly explained plan/status badges.
- Settings: account, privacy, notifications, storage, language, appearance, export defaults, help, and legal documents.

## Editor capabilities (long-term roadmap)

### Core editing

Import video, photo, and audio; record media; create multi-clip projects; trim, split, reorder, merge, duplicate, replace, loop, delete, crop, rotate, mirror, freeze, reverse, and adjust canvas/aspect ratio. Support multi-track audio/video, overlays, undo/redo, and non-destructive project saves.

### Timeline, motion, and compositing

Scrubbing, snapping, clip handles, multiple layers, keyframes for position/scale/rotation/opacity/speed, masks, blend modes, picture-in-picture, split-screen, Ken Burns motion, transitions, and configurable in/out/combo animations.

### Image and video treatment

Exposure, brightness, contrast, saturation, sharpness, highlights, shadows, temperature, tint, hue, vibrance, fade, vignette, HSL, curves, LUT import, filters, retouching, chroma key, background removal, motion tracking, stabilization, and enhancement. AI-based effects require a suitable model/service, consent, safety controls, and truthful capability descriptions.

### Text, captions, and stickers

Titles, subtitles, captions, typography controls, outlines, shadows, spacing, text animations, templates, stickers, emoji, GIFs, and tracking. Caption languages proposed: English, Yoruba, Nigerian Pidgin, French, and Spanish. Support manual captions and consider batch workflows after the basic editor is stable.

### Audio

Music and sound effects, media audio extraction, voiceover, volume/fades/speed, beat markers and synchronization, noise reduction, voice effects, and audio ducking. AI speech, dubbing, or voice cloning must require informed consent and prevent impersonation or unauthorized voice use.

### AI-assisted creation (future, provider/model dependent)

Auto captions, speech-to-text, text-to-speech, script assistance, photo/video generation, background/object removal, color correction, relighting, denoising, upscaling, thumbnail creation, and long-video-to-short workflows. Clearly identify generated or materially altered content where appropriate. Avoid promises of a particular quality, speed, or accuracy until verified.

### Templates, Aura, and photo workflows

Template discovery, search, preview, favorites, replace-media flow, and user-created templates. “Aura” is a proposed original effect family with gold, pink, purple, blue, green, red, rainbow, angel, demon, and Nigerian-inspired palettes. Photo workflows may include slideshow, collage, retouch, background removal, and pan/zoom effects. Use only owned, licensed, or user-authorized assets.

### Export and sharing

Plan for configurable resolution/frame rate/format, local save, draft persistence, optional cloud sync, audio-only/GIF export, and user-initiated sharing. Initial export quality, watermark behavior, supported codecs, device requirements, and social-network integration must be tested and documented. Do not promise 8K/4K/60 fps on devices or pipelines that cannot support it.

## Proposed plan concepts — not yet implemented or validated

The supplied concept describes Free, Pro, Elite, King, Creator-granted/Blessed, and a limited-duration Body Swap pass, plus a fictional-style add-on. Suggested Naira prices in the concept are Free ₦0, Pro ₦5,000, Elite ₦10,000, King ₦15,000, fictional-style add-on ₦1,000, and a seven-day Body Swap pass ₦1,000. These are draft business assumptions, not active offers or verified market prices.

The concept also describes quality/export differences, optional watermarks, and plan badges. Before implementation, define whether purchases are one-time, consumable, or time-limited, how upgrades and refunds work, and how entitlements are restored across devices. Use official store billing requirements where applicable. Keep payment secrets on a trusted backend, verify transactions server-side, and never ask users to share card PINs or credentials.

Paystack, Google Play Billing, and AdMob are **not integrated**. Account eligibility, fees, payout thresholds, store rules, ad consent, and current pricing should be checked against their official documentation before any launch. Ads, if added, must be disclosed, consent-aware where required, and kept out of paid/ad-free experiences as promised.

## Creator/admin controls and grants

A creator-admin console and an email-based grant list are proposed for internal product operations. Do not implement hidden logo-tap access, hard-coded GOD credentials/PINs, client-side admin authorization, or claims that an admin account is impossible to access. Use server-side roles, strong authentication, least privilege, rate limits, audit logs, recovery controls, and security review. A user receiving a plan grant must not receive admin privileges. Avoid exposing other users’ private content or account data to administrators unless necessary, disclosed, access-controlled, and audited.

## Safety, privacy, and legal work required before release

- Publish accurate privacy disclosures based on actual SDKs, processing, retention, and sharing—not aspirational statements. Do not claim that face/voice data is not retained unless the implementation and vendors enforce that.
- Obtain explicit, informed consent before processing a person’s face or voice. Restrict generation to the user’s own likeness/voice or documented authorization; provide reporting, takedown, and abuse-response paths.
- Use fictional characters and original styles rather than impersonating real celebrities or public figures. Clearly label synthetic media where appropriate.
- Assess child safety, age-appropriate design, parental-consent requirements, and store policies with qualified legal guidance. Avoid promising that a simple age toggle or “parent mode” alone makes the product compliant.
- Define content rules, moderation/reporting, account deletion, data export, retention, backups, security incident handling, and third-party processors before production.
- Do not claim “Google Play safe,” legal compliance, guaranteed refunds, or specific data-safety answers until verified for the shipped app and jurisdiction.

## Suggested implementation milestones

1. **Foundation:** Flutter app structure, navigation, visual system, accessible components, tests, and documented supported platforms.
2. **Usable editor MVP:** media picking with permission rationale, project/timeline models, clip operations, preview playback, autosave, and basic local export.
3. **Creative tools:** text, audio, filters, transitions, captions, and template browsing; add features incrementally with tests.
4. **Reliability:** offline behavior, storage management, crash reporting with disclosure, device/performance testing, and export recovery.
5. **Accounts/cloud:** authentication, project sync, account deletion/export, secure backend, and privacy/security review.
6. **Business features:** validated plans and entitlements, store-compliant billing, optional ads, refunds/support, analytics minimization, and launch review.
7. **Advanced/AI features:** evaluate vendors/models, consent and moderation design, costs/latency, on-device feasibility, and quality claims before each feature ships.

## Current implementation status

The repository currently has a prototype home screen and an editor-shaped UI with a decorative preview, sample timeline, transport controls, and tool selection. The sample project and timeline are placeholders. Real media import, playback, editing, rendering, persistence, accounts, AI, payments, ads, cloud sync, and admin controls have not been implemented.
