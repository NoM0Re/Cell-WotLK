# Changelog

Write release notes under a heading that matches the tag version, for example `## r279-beta`.

## r279-beta

- Fixed the bug in MOP Raiddebuff (#496).

## r278-beta

- Update SOO RaidDebuffs for MOP (#492).
- Update interface version in Cell_Vanilla.toc (#495).

## r277-beta

- feat: 添加决战奥格瑞玛团本减益 (#488, thanks @Follen).
- feat: 添加 Classic ZG 团本减益数据 (#487, thanks @Follen).

## r276-beta

### WoW 12.0.5 Compatibility

Interface bumped to 120005. Without these fixes Cell showed static white health bars, missing health/power text, and taint errors in PvP/M+. Thanks @matthewjenner.

### API Updates

- Added required `isContainer = false` to `C_UnitAuras.AddPrivateAuraAnchor` args (new in 12.0.5).

### Secret-Value Guards

12.0.5 decoupled Secret Value restrictions from the aura-restriction context flag, so `F.IsAuraRestricted()` context guards miss real secrets. Replaced with per-value `F.IsSecretValue` / `issecretvalue` checks at the use site:

- `Indicators/Custom.lua`: `auraInfo.sourceUnit` comparison for the cast-by-me filter.
- `Indicators/TargetedSpells.lua`: `UnitCastingInfo` / `UnitChannelInfo` returns (`spellId`, timestamps, texture).
- `RaidFrames/UnitButton.lua`: `UnitGUID` comparisons in `UnitButton_OnTick`; `powerMax` in `UnitButton_UpdatePowerStates`.
- `Utilities/BuffTracker.lua`: LGI cache lookup by GUID.
- `Utilities/DeathReport.lua`: `reportedDead[guid]` table key.

### Text Indicators on Secret Values

`UnitHealPredictionCalculator` returns secret-flagged numbers even in normal gameplay. Lua arithmetic and comparisons throw, but C-implemented formatters (`string.format`, `AbbreviateNumbers`, `BreakUpLargeNumbers`) pass secrets through to non-secret strings. Percentages come from calculator curve methods.

- **Health Text:** New `midnightFormatter` table backed by calculator methods, plus `GetMidnightCurves` factory (two reusable `C_CurveUtil` curves for positive and negative percentage scales). `HealthText_SetFormat` stashes format names for lookup; `HealthText_SetValue` takes a new `calc` arg and routes each slot when values are secret. The caller in `RaidFrames/UnitButton.lua` passes the unit's `healthCalculator`.
- **Power Text:** `SetPower_Percentage` calls `UnitPowerPercent(unit, nil, true, CurveConstants.ScaleTo100)` (wrapped in `pcall`) to get a plain 0-100 value when Cell's context would otherwise return a secret `UnitPower`. The caller at `UnitButton_UpdatePowerText` passes `self.states.displayedUnit` so the formatter has a unit to query. `SetPower_Number` uses `string.format("%d", current)`, and `SetPower_Number_Short` uses `AbbreviateNumbers`. Non-secret paths moved to `SafeTextWidth` because `GetStringWidth` stays tainted after the FontString held secret text.
- **Power bar:** `UnitButton_UpdatePowerMax` and `UnitButton_UpdatePower` now use native `SetMinMaxValues` and `SetValue` on Midnight unconditionally, bypassing `SmoothStatusBarMixin`. The mixin caches min/max and its per-frame `Clamp()` throws every tick if either value was ever secret, even after the current value is plain. This matches what the health bar already does on Midnight.
- **SafeTextWidth helper:** Font-proportional fallback when `GetStringWidth` returns a secret-flagged width. Used by both text indicators' secret paths and their `SetFont` paths.
- **QuickAssist:** No change; `StatusBar:SetValue` / `SetMinMaxValues` accept secrets natively.

### Supported Formats on Secret Values

- **Health Text:** `health`, `health_short`, `health_percent`, `deficit`, `deficit_short`, `deficit_percent`, `shields`, `shields_short`, `healabsorbs`, `healabsorbs_short`. `effective_*` degrades to matching `health_*` (no `GetEffectiveHealth` method). `*_percent` on shields/healabsorbs degrades to short absolute (no matching curve method).
- **Power Text:** `number`, `number-short`, `percentage`. Percent uses `UnitPowerPercent` with `CurveConstants.ScaleTo100` and renders correctly even when raw `UnitPower` is secret. Falls back to `AbbreviateNumbers` only if `UnitPowerPercent` is unavailable or the `pcall` fails.

### Limitations

- `hideIfEmptyOrFull` is a no-op on secret values (needs comparisons).
- Effective health formats diverge from true effective health only when shields or heal absorbs are active.

### Aura Classification

12.0.5 un-secreted `isHelpful`, `isHarmful`, `isRaid`, `isNameplateOnly`, and `isFromPlayerOrPlayerPet`. Removed the `issecretvalue(auraInfo.isHelpful)` early return in `Indicators/Custom.lua` and the classification-secret fallback in `RaidFrames/UnitButton.lua`'s incremental aura fast path.

### Raid Debuffs

- Added the raid debuffs for Lei Shen. Thanks @EkklesN for the contribution.

## r275-beta

### r275.5: Midnight Raid Debuffs

- Added initial Midnight expansion raid debuffs for all 12 instances (6 raids, 6 dungeons) and 41 bosses.
- Boss ability spell IDs sourced from the Encounter Journal via wago.tools DB2 tables.
- General (trash mob) debuffs still need to be collected in-game and added in a future update.
- Spells may need further in-game curation to filter out non-debuff abilities.

### r275-release: WoW 12.0.0 (Midnight) Compatibility

Comprehensive compatibility update for WoW Patch 12.0.0 (Midnight), addressing the removal of `COMBAT_LOG_EVENT_UNFILTERED`, the introduction of Secret Values, blocked addon communications during restricted contexts, and spell/API removals. Interface bumped to 120001.

#### Secret Values (12.0.0+)

- Added `Cell.isMidnight` detection flag and `F.IsSecretValue()`, `F.IsAuraRestricted()`, `F.IsCooldownRestricted()` utility functions.
- Added per-aura `F.IsAuraNonSecret()`, `F.IsSpellAuraNonSecret()`, `F.IsValueNonSecret()` helpers. Non-secret (whitelisted) auras now get real countdown timers, source detection, and duration display; secret auras gracefully degrade.
- UnitButton: major dual-path refactor. Midnight uses `UnitHealPredictionCalculator`, `C_CurveUtil.CreateCurve()`, and StatusBar overlays for health/prediction/shields; pre-Midnight retains arithmetic-based paths.
- Appearance: IncomingHeal widget uses `SetStatusBarTexture` on Midnight (StatusBar) vs `SetTexture` pre-Midnight (Texture).
- Indicator_Defaults: local `DebuffTypeColor` fallback for when the WoW global is removed.
- Per-field `F.IsValueNonSecret()` guards before every arithmetic operation on temporal aura fields (`expirationTime`, `duration`, `applications`, and cached `old*` variants).

#### CLEU Removal

- AoEHealing: disabled on Midnight (`CLEU` unavailable); frame still exists for potential future non-CLEU API.
- StatusIcon: soulstone/resurrection tracking switches to `UNIT_AURA` + `UNIT_HEALTH` on Midnight.
- NPCFrame: boss6-8 health/aura tracking switches to unit events on Midnight.
- DeathReport: full refactor. Midnight uses `UNIT_HEALTH` + `UnitIsDeadOrGhost()` for death detection.
- UnitButton: removed `CombatLogGetCurrentEventInfo` dependency and `CheckCLEURequired`.
- General: removed `useCleuHealthUpdater` checkbox (CLEU health updater obsolete).
- Revise: r275 migration removes `useCleuHealthUpdater` from saved variables.

#### Comm Restrictions

- Comm: `IsCommRestricted()` detects encounters/M+/PvP; all `SendCommMessage` calls guarded; pending queue with flush on `ENCOUNTER_END`.
- Nicknames: all nickname sync sends guarded with `F.IsCommRestricted()`.

#### Heal Prediction & Health Bar Fixes

- Created a dedicated `healPredictionCalculator` separate from the shared `healthCalculator`. The heal prediction function's `SetIncomingHealClampMode(0)` and `SetIncomingHealOverflowPercent(1.0)` were persisting on the shared calculator and corrupting health/absorb reads.
- Incoming heal bar is now a StatusBar (instead of Texture) anchored to the health fill texture edge.
- Fixed health bar loss color stuck on white/full-health. `self.states.healthPercent` was never set on the Midnight path; it is now populated from `calculator:GetCurrentHealthPercent()` with a secret-safe fallback.
- Dispels now show correctly because `HandleDebuff` completes to the dispel detection code (string/boolean fields, not temporal arithmetic).

#### Spell & Default Updates

- Removed: Engulf, Renew, Power Word: Life, Void Shift, Shadow Covenant, Divine Star, Cloudburst Totem, Minor Cenarion Ward, Premonition of Solace.
- Added: Plea (200829, Disc Priest).
- Added missing healing spells to default indicator list (Evoker, Monk, Paladin, Priest).
- Moved: Prayer of Mending from class-wide to Holy spec only.
- Fixed: Shaman Poison dispel node IDs (103609 → 103599).

#### Defensive Nil Guards & Fixes

- MainFrame: nil guards for `currentLayoutTable` and `tooltipPoint`.
- HideBlizzard: guards for `PartyMemberFramePool`, `CompactPartyFrame`, `PartyMemberBackground`.
- RaidDebuffs: nil guard for encounter journal expansion data.
- TargetedSpells: skip enemy spell tracking during restricted periods.
- BuffTracker: guard `GetAuraDataBySpellName` when auras are restricted; per-aura `sourceUnit` check.
- QuickCast: skip only secret auras in `ForEachAura`.
- Custom indicators: per-aura secret check for duration/start.
- Appearance: ticker nil guard in preview `OnHide`.

#### Infrastructure

- All 22 XML files updated from `FrameXML/UI_shared.xsd` to `Blizzard_SharedXML/UI.xsd`.
- Core: version constants bumped to 275, `GetBattlegroundInfo` guard added.

## r274-release

Changes and Fixes:
Update Molten Core debuffs (thanks Rurutia).
Fixed an issue with getting hostile boss frames via LibGetFrame.

## r273-release

New Features:
Added support for TBC classic.

Changes and Fixes:
Improved range check.
Updated locales.

## r272-release

Changes and Fixes:
Updated debuffs for Throne of Thunder (#436, thanks Ekkles).
Fixed boss list for Throne of Thunder.
(MoP) Added Eternal Flame for "Healers".

## r271-release

Changes and Fixes:
Fixed a OmniCD related issue.
(Classic) The "Debuffs" indicator no longer shows WeakenedSoul for non-priests.

## r270-release

Changes and Fixes:
Updated toc version.
Fixed display of the separate pet frame in arenas.

## r269-release

Changes and Fixes:
(CN MoP) Fixed Monk-related issues.

## r268-release

Changes and Fixes:
Fixed spell rank issue for the English client.
Fixed potential nil error in Actions indicator.
Updated locales.

## r267-release

Changes and Fixes:
Fixed specID check (layout switch) on auto spec change.
Fixed spell ranks for click-castings.
Updated locales, fixed missing phrases.

New Features:
Added esMX (thanks maylisdalan).

## r266-release

Changes and Fixes:
Delayed creation of some indicators to avoid potential issues.

## r265-release

Changes and Fixes:
Fixed Health Text indicator.
(Retail) Added delayed groupType check for more reliable layout switching.

## r264-release

Changes and Fixes:
Fixed dual spec for anniversary servers (#427, thanks muffinhydra).
Fixed indicator loading issues.
Improved layout fallback handling for Retail.
Updated BuffTracker options for Vanilla/Wrath/Cata.

## r263-beta

New Features:
Added baseline support for dual spec for anniversary servers (#416, thanks muffinhydra).

Changes and Fixes:
Refactored layout visibility and indicator updates.
Fixed aura tooltips for retail.
Changed to delayed pixel updates when UI_SCALE_CHANGED.
Fixed layout fallbacks.
Updated locales.

Removed:
Removed alwaysUpdateAuras from retail.

## r262-release

Changes and Fixes:
Updated MoP debuffs (#417, thanks Ekkles).
Added missing paladin click-casting spell (#389, thanks gpejski).
Partial aura updates (#413, thanks cont1nuity).
(Retail) Refactored aura update logic and cache handling, slightly improved performance.
Added option to hide Blizzard Raid Manager.
Added "Cast By" for custom debuff indicators.
Updated TWW debuffs and targeted spells.

## r261-release

Changes and Fixes:
Updated MoP debuffs (thanks Ekkles).
Updated TWW debuffs.

## r260-release

Changes and Fixes:
Updated TWW raid debuffs (thanks swirl).

## r259-release

Changes and Fixes:
Updated TWW debuffs (thanks 钛锬 and 枫岚).
Updated MoP debuffs.

## r258-release

Changes and Fixes:
Attempt to fix aura update.

## r257-release

Changes and Fixes:
Bump up toc for Wrath (CN).

## r256-release

Changes and Fixes:
(MoP) Fixed PW:S indicator.

## r255-release

New Features:
Added Healer frame to spotlight (#393 by hreich).
(MoP) Added back PW:S indicator.

Changes and Fixes:
(MoP) Fixed click-cast for Soulstone.
Reworked BuffTracker & MissingBuffs for all flavors.

Removed:
(Vanilla) Removed debuff duration limit from display logic.

## r254-release

Changes and Fixes:
Updated for MoP. Updated for MoP. Layout Auto Switch and Power Filters have been reset due to the game version update.
Disabled dragging while in combat.
BuffTracker updated: now only available for Retail and MoP..

Removed:
Removed MissingBuffs indicator.

New Features:
(Retail) Cell will attempt to restore the correct layout after reconnecting during combat.

## r253-release

Changes and Fixes:
Updated libs.
Updated targeted spells.

## r252-release

Changes and Fixes:
Fixed powerfilter values (#367).
Updated locales.

Removed:
Removed global names for custom indicators.

## r251-release

Changes and Fixes:
Updated Bleed list for TWW S2 (#359).
Updated mistweaver default spells (#364).
Fixed missing powerFilters on importing.
Fixed border indicator.
Fixed height of aura list.
Fixed issues for CN Wrath 3.4.4.
Spotlight Tank is now available for Classic.

Removed:
Removed IsDelveInProgress check.

New Features:
Added Cell_ExpansionDataOverrides.

## r250-release

Changes and Fixes:
(Classic) Fixed "Healers" indicator.
Fixed healthText issue.
Fixed raid debuff glow.
Fixed size of Dispels.
Fixed nil error #354 #355.
Fixed spotlight placeholders.
Changed TankActiveMitigation to spellID.
Attempted to fix the aura list height.
Updated Liberation of Undermine debuffs.
Updated some targeted spells.
Updated button backdrops.
Updated locales.

## r249-release

Changes and Fixes:
Fixed horizontal layout.

## r248-release

Changes and Fixes:
Improved the accuracy of unit button spacing.
Fixed "Healers" indicator.
Fixed layout hiding on classic.
Fixed pixel accuracy of Block(s).
Fixed raid layout preview.
Added "Apply Recommended Scale" button and "/cell rescale".
Updated power filter for vanilla.
Updated max unitsPerColumn on classic.
Update locales.

## r247-release

Important:
Due to changes in scaling behavior, you might need to readjust the size and position of Cell.

Changes and Fixes:
Updated TWW season 2 debuffs (Thanks 钛锬).
Fixed scaling issue.
Fixed positioning issue.
Fixed Glow indicator.

## r246-release

Important:
Cell now scales with UIParent.

New Features:
Added maxValue settings to custom Bar indicator (#337).
Added glow to some indicators.
Implemented layout hiding (under Layout Auto Switch), removed old options under General tab.
Implemented solo pet hiding.

Changes and Fixes:
Fixed hidden menu clickthrough issue.
Fixed dispel check.
Made BattleResTimer and PartyPets detachable.
Made spacing options effective for solo/party pets.
Updated locales.

## r245-release

Changes and Fixes:
Fixed a layout auto switch issue.
Fixed issues caused by spotlight on Classic.
Fixed import.
HealthText no longer hides when dead/ghost.
SpellRequest now supports nickname.
Updated deDE, zhTW.

New Features:
Added "Health 2" for HealthText.

## r244-release

New Features:
(Classic) Added downranking spells support for Click-Castings.
(Classic) Updated RaidDebuffs to include the Naxxramas raid (#294).
(TWW) Updated debuffs for season 2 (Thanks 钛锬).
(TWW) Updated Liberation of Undermine debuffs (Thanks Reat).
(Classic) Updated RoleIcon indicator and PowerBarFilters.
Implemented CombatIcon indicator.
Updated AoEHealings indicator.
Added "Relative" for indicator position settings.
Added class/role filter for PowerText indicator.
Added functions for "installer" addons.

Changes and Fixes:
Updated "Drinking" list (#279, #306).
Updated range check.
Updated Dispel Request text flipbook animation.
Refactored HealthText indicator.
Fixed texture selector.
Converted colon methods to dot notation, so some code snippets need to be updated.
Updated locales.

## r243-release

Changes and Fixes:
Fixed power filters for Wrath(CN).
Fixed indicator revision process.
Updated health text format option.
Updated bleed list.
Reverted some changes.

New Features:
Added stack options for custom text indicators.

## r242-release

Changes and Fixes:
Fixed for Classic.
Updated deDE, esES, zhTW.

## r241-release

New Features:
Implemented Nickname Blacklist and a hardcoded bad words list.

Changes and Fixes:
Fixed Cell.GetUnitFramesForLGF.
Fixed Power Text.
Changed Gradient Color related options.
Updated raid debuffs.
Updated locales. Added esES (thanks Zurent!).

## r240-release

Changes and Fixes:
Updated bleedList for TWW (PR #215).
Updated profile import.
Fixed aura import/export.
Fixed layout auto switch.
Updated locales.

New Features:
Implemented Backups.

## r239-release

New Features:
Snippet for enabled click cast on non-cell frames (PR #199).
Added a new dispel icon style.
Updated locales: deDE, frFR, ptBR, ruRU, zhTW.

Changes and Fixes:
Updated default indicator spells (PR #208).
Fixed an issue if CELL_BORDER_SIZE = 0.
(TWW) Fixed range check for Evokers.
Fixed blacklist shortcut for Debuffs indicator.
Fixed "Bars" indicators.
Fixed "Texture" indicators.
Fixed indicator list (especially the amount and order).
Fixed Cell.GetUnitFramesForLGF for Spotlights.
Macro click-castings are now bound by name.
Refactored Actions using ObjectPool.
Updated appearance of power filter option buttons.
(TWW) Updated debuffs for Nerub-ar Palace (Thanks Reat).
(TWW) Update dungeon debuffs.

## r238-release

Changes and Fixes:
Fixed missing indicators.
Updated deDE and zhTW.

## r237-release

Changes and Fixes:
(TWW) Updated default indicator spells (PR #165).
Updated gradient colors (PR #181).
Updated layer of Health Thresholds indicator.
Slightly optimized Cell.GetUnitFramesForLGF.
Fixed an indicator loading issue.
Fixed some click-casting issues.
(TWW) Fixed dispel check.
(Classic) Fixed Spell Request.
Updated deDE and zhTW.

New Features:
New snippet var CELL_RANGE_CHECK_*. Custom spells can now be used for range checking.
New custom indicator type: Bars.
Added "Health Bar (Loss)" option to Color indicator.
(TWW) Added Skyfury to Buff Tracker.

## r236-release

Changes and Fixes:
Fixed appearance/layout tab.
Updated locales.
Updated world marks for cata.

## r235-release

New Features:
Added "Show Raid" option (PR #176).
Added an option to adjust StatusText alignment.
Added expansion data for ruRU.
New custom indicator type: Border.

Changes and Fixes:
Fixed full health color (PR #175).
(TWW) Fixed BR timer, QuickAssist, Spell/Dispel Request.
Fixed icon aspect ratio.
Fixed raid debuff creation on classic.
Fixed vehicle icon.
Fixed stack text.
Fixed size of indicator group.
Updated gradient color options for health bar.
Updated LibGetFrame related functions (Cell.GetUnitFrame -> Cell.GetUnitFramesForLGF).

## r234-release

New Features:
Added "position" for Ready Check Icon indicator.

Changes and Fixes:
"Override LibGetFrame" is now enabled by default.
Increased the frame level of AoE Healing indicator.
Update range check.
Updated deDE, zhTW.

## r233-release

New Features:
Added a dispel highlight option "current+".

Changes and Fixes:
Fixed click-casting for evoker spell "Rescue".
Fixed layout preview.
Fixed creation of raid debuffs.
Fixed "Invert Color" option.
Fixed "Track by name" option.
Fixed color options for Block indicators.
Fixed a wrong PWS id.
Updated range check.
Updated frame level of Actions indicator.
Updated buff tracker for CN WotLK.
Updated locales.

## r232-release

Changes and Fixes:
Fixed a critical issue that removes all custom indicators.

## r231-release

Changes and Fixes:
Updated for TWW (#142,#144,#145).
Updated for CN WotLK.
Renamed "Consumables" to "Actions".
Updated locales. Added deDE (by CheersItsJulian), ruRU (by SkywardenSylvanas).
Fixed BigDebuffs.
Fixed Click-Castings.

New Features:
Added "Filters" for Dispels indicator.
Added "Color By Duration/Stack" for "Block" indicators.

## r230-beta

Changes and Fixes:
Updated for TWW (#139,#120), not fully compatible though.
Updated bleedList (#119).
Updated frame level of Dispels and "Color" indicators.
Updated range check.
Updated texture of Role Icon indicator.
Fixed "Text" alignment.
Fixed "Dispels" check for Cata.

New Features:
Introduced new snippet var "CELL_COOLDOWN_STYLE", the old snippet "CooldownIcons_BlizzardStyle" is now OUTDATED.
Custom indicators can be reordered by dragging and dropping now.
New custom indicator type "Blocks" ("CELL_COOLDOWN_STYLE" can affect this type of indicators).
Added "Show Duration" for Crowd Controls indicator.

## r229-release

Changes and Fixes:
Bug fixes.
Updated zhTW.

New Features:
Added ptBR (by cathtail).

## r228-release

Click-Castings:
Fixed Click-Castings issues, some settings may be "Invalid", just re-set them.

Indicators:
Updated indicator preview, added "Show All", removed "Alpha" (#125).
Updated BleedList (#119).
Added "Spacing" for Icons indicators.
New custom indicator: (color) Block.
Added duration text for Rect/Bar.
Updated Targeted Spells, now it supports up to 3 icons and is more stable.
Increased frame level of Dispel Highlight.
Fixed dispel checker on Cata.

Raid Debuffs:
Added "Use Elapsed Time" option for Raid Debuffs.
Updated Cata Raid Debuffs.

Layouts:
Added "Solo" for Layout Auto Switch.
Updated "Sort by Role", now it supports separated group headers.
Fixed frame level of Spotlight menu.

Misc:
Improved usability of Custom Nicknames.

## r227-release

Changes and Fixes:
Fixed Quick Assist.
Fixed a layout switch issue.
Updated zhTW.

## r226-release

Changes and Fixes:
Added a separated "Shadow" option for fonts (#110).
Fixed Shield Bar alpha in preview (#111).
Updated color options for custom Text/Rect/Bar/Color/Overlay indicators (added ALPHAs).

New Features:
Implemented "Reverse Fill" for overshields.
Added "Frame Level" option for Role Icon indicator.
Added "Show Duration" for Raid Debuffs indicator.

## r225-release

Changes and Fixes:
Bug fixes.

## r224-release

New Features:
New indicator: Power Text.
Added "Class Color" for custom Color indicators and Health Text indicator.
Added "Frame Level" for custom Color/Overlay indicators.
Added "Invert Color" for Heal Absorb.
Added a "30%" for some duration related options.

Changes and Fixes:
The custom Icons indicators now have an ordered spell list.
Fixed anchor of NPC frame while using combined groups.
Fixed Power Filters when solo.
Fixed Layout Auto Switch for Cata.
Fixed issues with AI followers.
Moved "Use LibHealComm" to Code Snippets.

## r223-release

Changes and Fixes:
Updated Cata debuffs.

## r222-release

New Features:
Updated for Cata.
Implemented "Combine Groups" (support sorting by role), check it out on Layouts tab.
New custom indicator type: Overlay (bar).
Added Clear/Import/Export for indicator aura list.

Changes and Fixes:
Expanded Spotlight Frame to 15 buttons.
Fixed colors of AI followers.
Fixed colors for custom Text/Rect/Bar indicators.
Updated zhTW.

## r221-release

New Features:
Added multi-line support for custom "Icons" indicators.
Added Right-Click refreshing feature for Main/QuickAssist option button.

Changes and Fixes:
Updated color options for custom "Bar" indicators.
Improved reliability of LibGroupInfo (QuickAssist filters may work better).
Fixed QuickAssist cooldown icons.

## r220-release

Changes and Fixes:
Fixed Spotlight config button.
Updated range checker.
Updated Cell.GetUnitFrame.
Updated zhTW.

## r219-release

Changes and Fixes:
Fixed range check for Quick Assist (now uses OnUpdate).

New Features:
Added custom Gradient Colors (Appearance).

## r218-release

Changes and Fixes:
(Wrath/Vanilla) Fixed a layout issue.

## r217-release

Changes and Fixes:
Fixed duration text visibility.
Updated zhTW.

## r216-release

Changes and Fixes:
Fixed an icon preview issue in Appearance.
Fixed icon animation of Quick Assist.

## r215-release

New Features:
Implemented blacklist shortcut for Debuffs: Alt + Ctrl + LeftClick (disabled by default).
Added "Show animation" option for some indicators.
(Retail) Added "Color" option for Tank Active Mitigation.

Changes and Fixes:
Updated party role order option (PR #102, thanks abazilla).
(Retail) Set the default value of "Always Update Debuffs" to true.
Fixed a Spec Filter issue for Quick Assist.
Fixed layout preview mover.

## r214-release

Changes and Fixes:
Fixed Spell Request, updated CELL_NOTIFY payloads.
Updated the priority of dispel types: Magic > Curse > Disease > Poison > Bleed.
Updated zhTW.

## r213-release

New Features:
(Retail) Updated Quick Assist, new Spec Filter and Filter Auto Switch.

Changes and Fixes:
(Retail) Updated Smart Resurrection, added support for mass resurrections.
Increased maximum size for indicators.
Fixed a power bar issue.
Fixed utilities submenu.
Fixed duration text color.

## r212-release

Changes and Fixes:
Fixed a issue that newly created indicators did not show up when solo or in a party.
Updated overshield texture. Now it uses the color of shield texture.

## r211-release

Changes and Fixes:
Updated dispel checker, removed snippet var: CELL_DISPEL_EVOKER_CAUTERIZING_FLAME.
When enter/leave instance, all visible unit buttons will be refreshed.
Updated zhTW.

## r210-release

New Features:
Implemented Bleed debuff type (using data from https://wago.tools/db2/SpellEffect, EffectMechanic=15).

Changes and Fixes:
Fixed Quick Assist config/preview.
(Wrath) Fixed PW:S indicator.

## r209-release

Changes and Fixes:
Fixed issues with newly created custom Color indicators.
Updated zhTW.

## r208-release

Changes and Fixes:
The order of click-casting items can now be adjusted by dragging them.
Fixed click-castings for Quick Assist.

## r207-release

Changes and Fixes:
(Retail) Updated Quick Assist, removed stand-alone click-castings, added bars/glows and filter switcher.
Fixed LibHealComm support.
Updated locales.

New Features:
Updated Spotlights, added "Tank" and "Unit's Name".
Updated support for 1.15 Classic.
Added "Change Over Time" option for custom Color indicators.
Added role icon for vehicles.

## r206-release

New Features:
(Retail) New utility: Quick Assist. Thanks 钛锬(NGA) for offensive spells and testing.
Added "Show Background" and "Show Timer" for Status Text indicator.

Changes and Fixes:
Updated raid debuffs.
Updated Cell.GetUnitFrame.
(Retail) Updated dispel checker for Shaman.
Updated locales.
Bug fixes.

## r205-release

Changes and Fixes:
Updated raid debuffs, thanks to 钛锬(NGA) and Ulu2005(GitHub) for collecting and providing debuffs.
Spotlight shortcuts now supports Blizzard and ElvUI.
Updated frame level: Aggro (border), Dispels and custom Color indicator.

New Features:
New custom indicator type: Glow.
(Retail) Added "Track by name" option for custom buff indicator.
Added "Hide Placeholder Frames" for Spotlights.
Added option to override LibGetFrame.

## r204-release

Changes and Fixes:
Updated range checker (Retail).

New Features:
Added "Always Update Buffs/Debuffs" options (Retail).

## r203-release

Changes and Fixes:
Fixed Target Counter.
Fixed a health bar issue occured when value is 0.

## r202-release

New Features:
Added support for Ping System (Retail).
Added "Show stack text" option for custom icon(s) indicators.

Changes and Fixes:
Expanded Spotlight Frame to 10 buttons.
Updated OmniCD support (requires the upcoming OmniCD update): Spotlights and QuickCasts.
Bug fixes.

## r201-release

Changes and Fixes:
Updated Amirdrassil debuffs.
Updated Health Text indicator.

## r200-release

Changes and Fixes:
Updated Raid Tools.
Updated Defensive CDs indicator.
Updated zhTW.

## r199-release

Changes and Fixes:
Updated spells of Defensives and Externals.
Fixed raid tools.

New Features:
Added "Cast By" option to custom buff indicators.
Code Snippets var: CELL_SHOW_RAID_PET_OWNER_NAME.

## r198-release

Changes and Fixes:
Updated indicators: Target Counter, Shield Bar.

## r197-release

Changes and Fixes:
Added a "Show Solo" option for Marks Bar.
Added Ice Cold to Defensive CDs indicator.
Updated ICC debuffs, thanks to 大胖宝.
Updated zhTW.

## r196-release

Changes and Fixes:
Updated Quick Cast and Spell Request.
Fix Status Text indicator.

New Features:
Code Snippets vars: CELL_BORDER_SIZE, CELL_BORDER_COLOR.

## r195-release

Changes and Fixes:
Updated Missing Buffs indicator.

## r194-release

Changes and Fixes:
Updated expansion data, which is used to match Raid Debuffs based on the instance you are in on Wrath. Currently, deDE, frFR, koKR, zhCN and zhTW are supported.
Updated zhTW.

## r193-release

Changes and Fixes:
Fixed layout switch.
Fixed Defensive Cooldowns indicator (Mirror Image).
Fixed issues with CVar "ActionButtonUseKeyDown" on Wrath.
Updated locales.

## r192-release

Changes and Fixes:
Added indicator validator to ensure all indicators are in the right order.
Fixed expansion data for frFR.
Updated zhTW.

## r191-release

Changes and Fixes:
Updated expansion data for frFR (Thanks to Zuvila).
Updated Targeted Spells, Quick Cast.

## r190-beta

New Features:
New indicator: Crowd Controls (Retail).

Changes and Fixes:
Updated Layout Auto Switch, now support spec profile (Retail).
Optimized UNIT_AURA related functions.
Fixed indicators issues with Spotlight frames.
Updated Quick Cast, Spell Request.
Updated raid setup tooltip.
Updated zhTW.

## r189-release

Changes and Fixes:
Fixed custom indicators: Color and Texture.

## r188-release

Changes and Fixes:
Fixed raid setup tooltip on Wrath.
Updated zhTW.

## r187-release

New Features:
New utility: Quick Cast (Retail only).
Added Proc Glow.
Added "Premade Mode" to raid roster utility.

Changes and Fixes:
Fixed Dispel Request on Wrath.

## r186-release

Changes and Fixes:
Fixed import & export.
Updated Dispel/Spell Request.
Updated Health Text indicator.
Updated zhTW.

## r185-release

Changes and Fixes:
Updated Options UI (wip).
Fixed Raid Debuffs tab on Wrath.

New Features:
Added "Only show overshields" to Shield Bar indicator.
Added "Focus Target" to spotlight frame.

## r184-release

Changes and Fixes:
Fixed range checker for Evokers.
Fixed several layout issues.

New Features:
Added "Boss1 Target" to spotlight frame.

## r183-release

Changes and Fixes:
Fixed layout: sort by role, hide self.
Updated zhTW.

## r182-release

Changes and Fixes:
Refactored Layouts.
Updated debuffs for Dawn of the Infinite, thanks to 钛锬(NGA).

New Features:
Implemented import & export for Click-Castings.

## r181-release

New Features:
Added a "Shape" option for PW:S indicator.

Changes and Fixes:
Updated zhTW.

## r180-release

New Features:
Added "Highlight Filter (blacklist)" for Dispel indicator.

Changes and Fixes:
Fixed dispel checker for Evokers.
Fixed Ready Check Icon indicator.
Updated zhTW.

## r179-release

Changes and Fixes:
Updated PW:S indicator.

New Features:
Added a "Translit Cyrillic to Latin" option in General tab.

## r178-release

New Features:
New indicator: "PW:S" (Wrath).

Changes and Fixes:
Bumped up toc.

## r177-release

New Features:
Updated for Augmentation Evokers.
Added a "Fade out over time" option for custom texture indicators.
Added "Unit's Target" to spotlight frame.

Removed:
Removed "CLEU auras" from Raid Debuffs indicator.

Changes and Fixes:
Updated zhTW.

## r176-release

New Features:
Added full health color options in Appearance.

Changes and Fixes:
Updated zhTW.
Updated Cell discord link.

## r175-release

Changes and Fixes:
Fixed Power Bar Filters.
Fixed animation Type A of Consumables indicator (Wrath).

## r174-release

Changes and Fixes:
Updated font options for some indicators. The stack font and duration font can be set separately. And if you use CooldownIcons_BlizzardStyle snippet, an update is required.
Health Text indicator: added options to show shield value.
Dispels indicator: updated Highlight Type option.
Fixed Private Auras indicator.
Updated raid debuffs.

## r173-release

Changes and Fixes:
Added a "Hide in combat" option for Leader Icon indicator.
Updated zhTW.

## r172-release

Changes and Fixes:
Fixed Click-Castings. If your bindings (especially the General type) don't work, remove them and then re-add them.

## r171-release

Changes and Fixes:
Removed Cauterizing Flame (Evoker) from dispel checker. You can add it back by setting CELL_DISPEL_EVOKER_CAUTERIZING_FLAME to true in Code Snippets.
Updated zhTW.

## r170-release

Changes and Fixes:
Updated raid debuffs: Aberrus and M+. (Thanks to 钛锬)
Updated raid debuffs: ToC. (Thanks to 橘子味橙汁)
Added support for NickTag. To display nicknames from Details!, set CELL_NICKTAG_ENABLED to true in Code Snippets.
Updated Missing Buffs indicator and brought it to Wrath.
Updated zhTW.

## r169-release

Retail:
New indicator: Private Auras.
Updated dispel checker.

## r168-release

Important:
Click-castings are now saved as spell id instead of name. This can make click-casting profiles work on clients in various languages (reconfiguration of click-casting spells is required).

Changes and Fixes:
Update Aberrus debuffs.
Fixed "Hide Damager" for Role Icon indicator on wrath.

## r167-release

Changes and Fixes:
Fixed strata of Spotlight Frame.

## r166-release

Changes and Fixes:
Fixed import on wrath.
Bumped retail toc to 100100.
Updated zhTW.

## r165-release

New Features:
Added an option to make raid tools show on mouseover.

Changes and Fixes:
Tried to fix raid pet frame issue during some encounters.
Updated zhTW.

## r164-release

New Features:
Added a "Smart Resurrection" option in Click-Castings.

Changes and Fixes:
Fixed menu strata.
Updated zhTW.

## r163-release

New Features:
Updated Cell frame strata, added a "Strata" option in Appearance.

Changes and Fixes:
Fixed a null indicatorName issue.
Updated zhTW.

## r162-release

Changes and Fixes:
Moved "Sort By Role" to Layouts.
Added "Hide Self" in Layouts.
Fixed "Track by name" for custom indicators (wrath).

## r161-release

Changes and Fixes:
Fixed dispellable debuff type checker (retail).
Updated zhTW.

## r160-release

Changes and Fixes:
Moved "Debuff Type Color" options to Appearance.
Fixed a "font is nil" issue.
Bumped retail toc to 100007.

## r159-release

New Features:
Added Self Cast Key checker for Wrath.

Changes and Fixes:
Updated zhTW.

## r158-release

New Features:
New indicator: Missing Buffs (Retail only).
Added custom dispel type color options for Dispels indicator.

Changes and Fixes:
Update raid debuffs checker.
Update initialConfigFunction of each group header.

## r157-release

Changes and Fixes:
Bug fixes.
Updated zhTW.

## r156-release

New Features:
Add toggles for built-in spells (Defensives and Externals).

Changes and Fixes:
Fix raid type checker on Wrath.

## r155-release

Changes and Fixes:
Fixed click-castings on Wrath.
Fixed aura refreshing animation on Wrath.

## r154-release

Changes and Fixes:
Bug fixes.
Update for 3.4.1.

## r153-release

Changes and Fixes:
Tried to fix: fonts and Aggro (Border) indicator.
Updated Targeted Spells list.
Updated raid debuffs: Ulduar.

## r152-release

Changes and Fixes:
Updated raid debuffs.
Updated duration text options (related code snippets needs to be updated).
Fixed buff tracker.

## r151-release

Changes and Fixes:
Updated VotI debuffs.
Fixed range checker for evoker.
Fixed dispellable checker.
Updated locales.

## r150-release

Changes and Fixes:
Updated Dragonflight debuffs.
Updated BAR indicators.
Updated Dispel indicator.
Updated range checker, removed LibRangeCheck.
Removed LibHealComm (if you would like to use it, install the standalone library instead).
Bug fixes.

## r149-release

Changes and Fixes:
Added NPC button size options.
Added a bar orientation option "Vertical B".

## r148-release

Changes and Fixes:
Fixed layout auto switch on Wrath.
Updated zhTW.

## r147-release

Changes and Fixes:
Updated layout auto switch, added a "Raid Outdoor" type.
Added color options: Heal Prediction, Heal Absorb and Shield Texture.
Updated Status Icon indicator (resurrections related).
Updated Targeted Spells indicator.
Updated custom indicators (Bar/Rect), added stack text.
Fixed range checker.
Other bug fixes.

## r146-release

Changes and Fixes:
Updated click-castings.
Bug fixes.

## r145-release

Changes and Fixes:
Bug fixes.
Updated zhTW.

## r144-release

New Features:
Added several shortcuts to spotlight frame.

Changes and Fixes:
Bug fixes.

## r143-release

Changes and Fixes:
Updated range check for evoker (30y).
Fixed appearance reset.

## r142-release

Changes and Fixes:
Options frame is now accessible while in combat.
Updated koKR.

## r141-release

Changes and Fixes:
Fixed tooltips (Wrath Classic).

## r140-release

Changes and Fixes:
Updated tooltips related functions.
Updated zhTW and koKR.

## r139-release

Changes and Fixes:
Updated evoker spells.
Updated slash commands.
Updated spotlight.
Updated zhTW and koKR.
Fixed aura tooltips.

## r138-release

Changes and Fixes:
Updated import & export.
Split "Unit Spacing" into "Unit Spacing X" and "Unit Spacing Y".
Bug fixes.

## r137-release

Changes and Fixes:
Added movers for NPCs and raid pets.
Updated zhTW.
Bug fixes.

## r136-release

New Features:
Added an option to increase health update rate (but not recommended).

Changes and Fixes:
Bug fixes.

## r135-release

Changes and Fixes:
Fixed arena pets.
Updated shields on Wrath Classic.
Updated zhTW.

## r134-release

New Features:
Implemented raid pets (limited to 20 buttons).

Changes and Fixes:
Added a "Hide Damager" option to Role Icon indicator.
Bug fixes.

## r133-release

Changes and Fixes:
Bug fixes.

## r132-release

New Features:
New indicator: Health Thresholds.

Changes and Fixes:
Updated spells for DF.
Bug fixes.

## r131-beta

Changes and Fixes:
Temporary fix for Dragonflight.

## r130-release

Changes and Fixes:
Bug fixes.
Updated zhTW.

## r129-release

Changes and Fixes:
Added an option to disable LibHealComm.
Split "Hide Blizzard Raid / Party" into two options.
Updated zhTW.

## r128-release

Changes and Fixes:
Updated alignment of indicators with multiple icons. Horizontal/Vertical centering is supported.
Added alpha to each status of StatusText.
Updated raid debuffs.
Updated defensives and externals.

New Features:
Added spotlight button size. You can find this in Layouts -> Unit Button Size (3rd page).

## r127-release

Changes and Fixes:
Fixed heal prediction in WotLK.
Updated zhTW.

## r126-release

Changes and Fixes:
Fixed icon duration text.
Added "Show group number" to Name Text indicator.
Made spotlight menu always on-screen.
Updated default spell list of Defensives and Externals.
Updated raid roster frame, right-click on a member to set assistant.
Updated Ready button, right-click on it to start a role check.

## r125-release

Changes and Fixes:
Updated locales.

## r124-release

Changes and Fixes:
Fixed menu (Options button) visibility.
Updated menu fade in/out.

## r123-release

Changes and Fixes:
Update default click-castings spells list.
Update zhTW.

## r122-release

Changes and Fixes:
Fixed Click-Castings.

## r121-release

Changes and Fixes:
Bug fixes.

## r120-release

Changes and Fixes:
Fixed Click-Castings.
Updated locales.

## r119-release

New Features:
Spotlight Frame (new): Shows up to 5 units you care about more. Each button can be set to target, target of target, focus, a group member or pet.

Changes and Fixes:
Update Click-Castings.
Update menu fade-in and fade-out.
Update zhTW.

## r118-release

Changes and Fixes:
Updated Buff Tracker.
Fixed vehicle targeting in WotLK.

## r117-release

Wrath Classic:
Updated shields: Shield Bar indicator, Shield / Overshield textures. (PWS with Glyph of PWS and Divine Aegis (from yourself) are supported.)

## r116-release

Changes and Fixes:
Updated heal prediction in Wrath Classic (using LibHealComm-4.0).
Updated locales.

## r115-release

Changes and Fixes:
Updated indicators: Dispels and Consumables.
Updated zhTW.
Fixed Consumables indicator in WotLK.

## r114-release

New Features:
New indicator: Consumables.

Changes and Fixes:
Updated indicators: AoEHealing, TargetedSpells and Debuffs.
Updated zhTW.

Retail:
Fixed CLEU auras and Mirror Image.

Wrath Classic:
Updated raid debuffs.

## r113-release

Changes and Fixes:
Fixed custom defensives and externals.

Retail:
Implemented CLEU auras (check Raid Debuffs indicator).

Wrath Classic:
Updated debuffs.
Fixed health bar color.

## r112-release

Changes and Fixes:
Add custom auras support to Defensives and Externals.
Add Mirror Image to Defensives.
Add Cell default texture to LibSharedMedia.

Wrath Classic:
Updated raid debuffs.
Fixed power filter.

## r111-release

Changes and Fixes:
Fixed game version check.
Updated zhTW.

## r110-release

Changes and Fixes:
Fixed pull button.
Fixed tooltips for checkbuttons.
Updated locales.

## r109-release

Retail:
The "Weakened Soul" debuff from other players will not be visible anymore.
Updated M+ debuffs.

Wrath Classic:
Cell should work on Wrath Classic now (not all Retail features are available).

## r108-release

Changes and Fixes:
Updated M+ debuffs.
Fixed several bugs.

## r107-release

Changes and Fixes:
Updated M+ season 4 related debuffs.
Added a "Current Season" item to expansion dropdown in Raid Debuffs.

## r106-beta

Changes and Fixes:
Bug fixes.

## r105-beta

Changes and Fixes:
Removed LibGroupInSpecT.

## r104-release

Changes and Fixes:
Bump up toc.

## r103-release

New Features:
Implemented accent color for options UI.

## r102-beta

Changes and Fixes:
Updated raid debuffs.
Updated zhTW.

## r101-beta

Changes and Fixes:
Updated settings export.
Updated raid debuffs.
Fixed name text length.

## r100-release

Changes and Fixes:
Fixed several bugs.
Updated zhTW.

## r99-release

Changes and Fixes:
Rewrote nicknames.
Added frame level to Name Text indicator.
Updated Status Icon indicator.
Updated zhTW.

## r98-release

New Features:
Implemented indicator sync.
Implemented custom death color.

Changes and Fixes:
Updated Role Icon indicator.
Lowered the frame level of Aggro (border) indicator.
Updated indicator preview.
Updated zhTW.
Bug fixes.

## r97-release

New Features:
Added nicknames (beta).

Changes and Fixes:
Updated locales.
Bug fixes.

## r96-release

Changes and Fixes:
Bug fixes.
Updated locales.

## r95-release

New Features:
Added a "Round Up Duration" option into Aura Icon Options.

Changes and Fixes:
Updated duration text options for custom TEXT indicators.
Updated zhTW.
Bug fixes.

## r94-release

New Features:
Added Aura Icon Options in Appearance tab.
Added Show aura tooltip options: Debuffs and RaidDebuffs.

Changes and Fixes:
Added yOffset for indicator font options: icon and icons.
Updated zhTW.
Fixed some bugs.

## r93-release

New Features:
Added an indicator: Externals + Defensives.
Added a new custom indicator type: texture.
Implemented import & export for all settings (check About tab).
Implemented layout auto switch for Mythic (raid).

Changes and Fixes:
Updated zhTW.
Fixed some bugs.

## r92-release

Changes and Fixes:
Fixed health color (gradient).

## r91-release

Changes and Fixes:
Fixed Targeted Spells indicator.
Updated Spell Request.
Updated zhTW.

## r90-release

New Features:
Added a Menu Position option.

Changes and Fixes:
Updated Spell Request, deleted old settings.
Fixed unit buttons initialization issue.
Updated Layout Preview.
Updated zhTW.

## r89-release

Changes and Fixes:
Implemented Spell Request (replace PI Request), it's way better.
Fixed bugs.
Updated locales.

## r88-release

Changes and Fixes:
Fixed heal prediction and request glow.

## r87-release

Tools:
Implemented Power Infusion Request.
Implemented Dispel Request.

Layouts:
Added Show NPC Frame option.
Implemented vertical unit button.

Indicators:
Added Show Duration option to debuffs, externals and defensives.

Misc:
Rewrote Options UI.
Fixed range check for NPCs.
Update zhTW.

## r86-release

Changes and Fixes:
Added a "Default" anchor option for tooltips.

## r85-release

Changes and Fixes:
Fixed bugs (occured when scale ~= 1).

## r84-release

New Features:
Implemented layout sharing.
Added new custom indicator type: Color.

Changes and Fixes:
Updated SotFO debuffs.

## r83-release

New Features:
Implemented indicators import/export.

Changes and Fixes:
Fixed Health Text indicator.

## r82-release

New Features:
Implemented unitbutton fadeIn & fadeOut.

Changes and Fixes:
Updated BigDebuffs.
Try to fix boss6/7/8 health updating issues with CLEU.

## r81-release

Changes and Fixes:
Marks Bar: added vertical layout.
Updated SotFO debuffs.

## r80-release

Changes and Fixes:
Fixed NPC frame (horizontal layout).

New Features:
Implemented separate NPC frame.

## r79-release

Changes and Fixes:
Updated NPC frame (5 -> 8).
Updated name text width options.

## r78-release

New Features:
Implemented Raid Debuffs import/export/reset, check out the tips in Raid Debuffs.

Changes and Fixes:
Updated SotFO debuffs.
Updated zhCN.

## r77-release

Changes and Fixes:
Bug fixes: click-castings (priest).
Updated zhTW.

New Features:
Added "Use Game Font" option in Appearance.

## r76-release

New Features:
Updated raid debuffs: Sepulcher of the First Ones.

Changes and Fixes:
Bug fixes: appearance preview.

## r75-release

Appearance:
Updated button highlight size option: negative size.
New power color: Power Color (dark).

General:
Updated pixel perfect: raid tools.
Disabled Death Report in battlegrounds and arenas.

Layouts:
Updated layout creation.

Raid Debuffs:
New raid debuffs sharing feature (beta): shift + left click on instance/boss to share debuffs via chat link.

## r74-release

Changes and Fixes:
Bugs fix: layout auto switch, health text indicator.

New Features:
New "Condition" option in Raid Debuffs.

## r73-release

Changes and Fixes:
Defect fixes.

## r72-release

Changes and Fixes:
Fixed Debuffs indicator delayed refreshing issue.
Updated zhTW.

## r71-release

New Features:
Added "Circled Stack Numbers" option to custom text indicator.
Added status color options to Status Text indicator.
Implemented power bar filters (Layouts).
Cell can provide a "Healers" indicator on first run.

Changes and Fixes:
Bug fixes (indicator preview).
Updated the default spell list of Defensive Cooldowns indicator.
Updated zhTW.

## r70-release

New Features:
Added several new options in Appearance.
Added "Show Duration" option to custom TEXT indicator.

## r69-release

New Features:
Added "Background Alpha" in Appearance.

Changes and Fixes:
Updated Raid Debuffs indicator, it can show up to 3 debuffs now.

## r68-release

New Features:
Added an Icon Animation option in Appearance.

Changes and Fixes:
Updated zhTW.

## r67-release

Changes and Fixes:
Bug fixes.

## r66-release

New Features:
Added support for Class Colors addon.
Implemented Always Targeting (Click-Castings).

## r65-release

Changes and Fixes:
Bug fixes.
Updated Targeted Spells.

New Features:
Added spell icons for indicator aura list.

## r64-release

Changes and Fixes:
Updated Big Debuffs, Targeted Spells and Raid Debuffs.

## r63-release

Changes and Fixes:
Debuff blacklist will not affect other indicators any more.
Updated Big Debuffs and Raid Debuffs.

## r62-release

New Features:
Added a Rename button for indicators.

Changes and Fixes:
Fixed Layout Auto Switch (battleground & arena).
Updated zhTW.

## r61-release

New Features:
New Indicator: Aggro (border).

Changes and Fixes:
Renamed Indicators: Aggro Indicator -> Aggro (blink), Aggro Bar -> Aggro (bar).
Updated zhCN, zhTW.

## r60-release

New Features:
Added spellId 0 for ICONS indicator to match all auras.
Added pet button size options.

Changes and Fixes:
Updated party frame UnitIds, made them more reliable.
Updated anchors of indicators.
Updated Death Report, Buff Tracker and Targeted Spells.

## r59-release

Changes and Fixes:
Implemented Copy Indicators.
Updated Layout Auto Switch.
Updated Raid Debuffs, Targeted Spells, Death Report.

## r58-release

Changes and Fixes:
Updated support for OmniCD (raid frame).
Updated zhTW, koKR.

## r57-release

New Features:
New features: Death Report & Buff Tracker.

Changes and Fixes:
Updated RaidDebuffs.

## r56-release

Changes and Fixes:
Updated TargetedSpells and BigDebuffs.
Fixed unit button border.
Fixed status text "DEAD".

## r55-release

Changes and Fixes:
Updated RaidDebuffs (Tazavesh).
Updated BigDebuffs (tormented affix related).
Fixed button backdrop in options frame.

## r54-release

Changes and Fixes:
Fixed BattleRes timer.

## r53-release

Changes and Fixes:
Updated RaidDebuffs (SoD).

## r52-release

Removed:
Removed an invalid spell from Click-Castings: 204293 "Spirit Link" (restoration shaman pvp talent).

Changes and Fixes:
Updated zhTW.

## r51-release

Changes and Fixes:
Updated Cell scaling. Cell main frame is now pixel perfect.
Updated RaidDebuffs.

## r50-release

Indicators:
Increased indicator max icons: Debuffs, custom indicators.
Changed dispel highlight to a smaller size.

Misc:
Fixed a Cell scaling issue.
Fixed the position of BattleRes again.
Added a "None" option for font outline.

## r49-release

New Features:
Added "Bar Animation" option in Appearance.

Changes and Fixes:
Updated "Health Text" (zhCN, zhTW and koKR numeral system).

## r48-release

Changes and Fixes:
Updated "Targeted Spells" and "Battle Res Timer".
Fixed some bugs (unit button backdrop and size).

## r47-release

New Features:
Added "Highlight Size" and "Out of Range Alpha" options.

Removed:
Removed ready check highlight.

Changes and Fixes:
Cooldown animation will be disabled when "Show duration text" is checked.

## r46-release

Changes and Fixes:
Fixed Click-Castings (mouse wheel) AGAIN.
Updated Tooltips options.

New Features:
Added Orientation options for Defensive/External Cooldowns and Debuffs indicators.

## r45-release

Changes and Fixes:
Fixed Click-Castings (mouse wheel).

## r44-release

Changes and Fixes:
Fixed BattleRes text not showing up.
Updated default spell list of Targeted Spells.
Updated Import&Export.
Updated zhTW.

## r43-release

New Features:
New feature: Layout Import/Export.

## r42-release

Changes and Fixes:
Fixed unitbuttons' updating issues.

## r41-release

Changes and Fixes:
Updated Targeted Spells indicator.

## r40-release

Party Frame:
Rewrote PartyFrame, now it supports two sorting methods: index and role.

Indicators:
Debuffs indicator will not show the SAME debuff shown by RaidDebuffs indicator.
Fixed indicator preview.
Fixed Targeted Spells indicator.
Updated External/Defensive Cooldowns.
Added Glow Condition for RaidDebuffs.

Misc:
Fixed a typo in Click-Castings.
Added koKR.

## r39-release

Indicators:
New indicator: Targeted Spells.

Layouts:
Added pets for arena layout.

Misc:
OmniCD should work well, even though the author of OmniCD doesn't add support for Cell.
Use /cell to reset Cell. It can be useful when Cell goes wrong.

## r37-release

Indicators:
Some built-in indicators are now configurable: Name Text, Status Text.
New indicator: Shield Bar
Added "Only show debuffs dispellable by me" option for Debuffs indicator.
Added "Use Custom Textures" options for Role Icon indicator.

Misc:
Due to indicator changes, some font related options have been removed.
Fixed frame width of BattleResTimer.
Added support for OmniCD (party frame).

## r35-release

Indicators:
Some built-in indicators are now configurable: Role Icon, Leader Icon, Ready Check Icon, Aggro Indicator.
Added "Border" and "Only show glow for top debuffs" options for Central Debuff indicator.

Raid Debuffs (Beta):
All debuffs are enabled by default, you might want to disable some less important debuffs.
Added "Track by ID" option.
Updated glow options for Raid Debuffs.

General:
Updated tooltips options.

Layouts:
Added "Hide" option for "Text Width".

## r32-release

Indicators:
New indicator: Health Text.
New option: Frame Level.

Raid Debuffs (Beta):
Added instance debuffs for Shadowlands. For now, these debuffs are tracked by NAME. "Track By ID" option will be added later.
All debuffs are enabled by default, you might want to disable some less important debuffs.

Misc:
Fixed: Marks Bar, Click-Castings.
Moved "Raid Setup" text to the tooltips of "Raid" button.
Added Fade Out Menu option.

## r26-release

Click-Castings:
Keyboard/multi-button mouse support for Click-Castings comes.
Due to code changes, you might have to reconfigure Key Bindings.

Indicators:
Aura List has been updated. Now all custom indicators will check spell IDs instead of NAMEs.
Custom Indicators won't work until the Buff/Debuff List has been reconfigured.

Indicator Preview Alpha:
Now you can set alpha of non-selected indicators. This might make it easier to arrange your indicators.
To adjust alpha, use the alpha slider in "Indicators", it can be found at the top right corner.

Frame Position:
Every layout has its own position setting now.
The positions of Cell Main Frame, Marks, Ready & Pull have been reset.

Misc:
Party/Raid Preview Mode will help you adjust layouts.
Group Anchor Point comes, go check it out in Layouts -> Group Arrangement.
