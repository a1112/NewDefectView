# Repository Guidelines

## Project Structure & Module Organization
- `main.cpp`, `cpp/`, and `h/` host the Qt/C++ backend (app bootstrap, native integrations, system helpers). Keep new modules in `cpp/<Feature>` with matching headers in `h/`.
- QML UI lives in `qml/` with logical subfolders (e.g., `MainWindow`, `SettingDialogs`, `Test`). Register new components in `qml.qrc` so Qt’s resource system can resolve them.
- JavaScript helpers sit in `js/`, reusable assets (icons, qml_rc.py output) in `resource/`, and legacy experiments under `src/`. Mirror this layout when introducing new assets or prototypes to keep imports predictable.

## Build, Test, and Development Commands
- `qtenv2.bat` — initialize the Qt toolchain (adds `qmake`, `nmake`, and deployment tools to `PATH`); run it in every fresh shell.
- `qmake NewDefectView.pro -spec win32-msvc && nmake release` — generates Makefiles from the `.pro` file and compiles the release build. Use `debug` for instrumented binaries.
- `qmlscene main.qml` — launches the QML front end quickly without rebuilding C++ when iterating on UI-only changes.
- `windeployqt release\NewDefectView.exe` — bundles Qt runtime DLLs for a shareable artifact; run after release builds.

## Coding Style & Naming Conventions
- C++: 4-space indentation, Qt signal/slot idioms, `PascalCase` classes, `camelCase` methods and members, and `SCREAMING_SNAKE_CASE` constexprs. Prefer RAII wrappers and keep headers self-contained.
- QML: one component per file, `PascalCase` component names, properties ordered as `id`, `anchors`, `layout`, logic. Share palette and spacing via the existing `Style/` helpers instead of hard-coded literals.
- Run `clang-format -style=file` (Qt Creator applies the same preset) on C++ sources and ensure QML passes the Qt Creator formatter before committing.

## Testing Guidelines
- UI smoke tests live under `qml/Test`; execute `qmltestrunner -input qml/Test` to validate bindings, object lifetimes, and property defaults.
- C++ behavior checks go in `cpp/Test` and are compiled when you add the files to `NewDefectView.pro`. Keep test filenames aligned with the production module (`OsSpec.cpp` tests `os.cpp`).
- Target meaningful coverage on new logic, especially data transforms feeding charts and network payload parsers. Attach logs or screenshots for visual regressions that cannot be automated yet.

## Commit & Pull Request Guidelines
- History favors compact, imperative messages (`add FPS`, `cccc`). Keep subject lines ≤50 chars, start with a verb, and add body details only when multiple behaviors change.
- Each PR should: describe the user-visible impact, reference related issue IDs, include build/test commands executed (`qmltestrunner`, `nmake release`), and attach UI diffs or screenshots when QML changes affect layout.
- Run `git status` before pushing to ensure only intentional files (no IDE state) are staged, and squash tiny fixups locally so reviewers see a clean story.
