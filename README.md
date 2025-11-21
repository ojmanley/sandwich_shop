(The file `c:\uni\programming\sandwich_shop\README.md` exists, but contains only whitespace)
# Sandwich Shop

A compact Flutter demo app that showcases a simple sandwich ordering UI. The app lets users choose a sandwich size (six-inch or footlong), pick a bread type, add a short order note, and increment/decrement quantity. The UI shows a live total price calculated from the chosen size and quantity.

This repository is intended as a small learning project for Flutter widgets, state management, and widget testing.

---

## Key features

- Add / Remove sandwich quantity (with min/max safeguards).
- Toggle between six-inch and footlong sandwich sizes.
- Choose bread type from a dropdown (white, wheat, wholemeal).
- Mark the sandwich toasted or untoasted.
- Add a short order note (TextField).
- Live total price display (six-inch = £7, footlong = £11) powered by a `PricingRepository`.
- Small widget & unit test suite demonstrating UI and logic tests.

---

## Project structure (important files)

- `lib/main.dart` — Main app UI and widgets (OrderScreen, OrderItemDisplay, StyledButton).
- `lib/views/app_styles.dart` — Small text style constants used in the app.
- `lib/repositories/order_repository.dart` — `OrderRepository` manages quantity and we've added `PricingRepository` to calculate totals.
- `test/` — Unit and widget tests. Notable files:
	- `test/pricing_repository_test.dart` — unit tests for pricing logic.
	- `test/views/widget_test.dart` — widget tests exercising the `OrderScreen` UI.
- Platform folders: `android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/` (standard Flutter platform support files).

---

## Prerequisites

Before running the app locally, ensure you have:

- Flutter SDK installed (stable channel recommended). See: https://docs.flutter.dev/get-started/install
- A supported OS for Flutter development (Windows, macOS, Linux). This project has platform folders for desktop and mobile.
- Optional but recommended: an IDE with Flutter support (VS Code, Android Studio) and Git for cloning.

Verify Flutter is available:

```powershell
flutter --version
flutter doctor
```

---

## Clone and install

Open PowerShell and run:

```powershell
# clone repo
git clone <repository-url>
cd sandwich_shop

# fetch packages
flutter pub get
```

Replace `<repository-url>` with your repo URL (for example, `https://github.com/<you>/sandwich_shop.git`).

---

## Running the app

Start a device/emulator or use one of the desktop targets. Then run:

```powershell
flutter run
```

To target a specific device (example: Edge web), you'll be prompted to select devices or run `flutter devices` and then `flutter run -d <deviceId>`.

Use hot reload while developing:

- Press `r` in the terminal running `flutter run`, or use your IDE's hot reload button.

---

## Usage (what you can do in the app)

When the app runs you'll see the `OrderScreen` with the following controls:

- Quantity display and Add / Remove buttons. Add increments until `maxQuantity` is reached (default: 5 in the app entrypoint).
- Size switch: toggles between six-inch (left label) and footlong (right label). The size affects unit pricing.
- Toasted switch: toggle whether sandwich is toasted.
- Bread selector: a dropdown menu (white, wheat, wholemeal).
- Notes text input: enter small text like "No onions"; the note is shown below the sandwich display.
- Live Total: shows the running total price (e.g., `Total: £33`) computed from quantity and size.

Important flows:

- Select size (six-inch or footlong) — the displayed item type and pricing update immediately.
- Press Add/Remove to adjust quantity — the emoji count and total update.
- Enter a note to annotate the order; the note is displayed under the sandwich summary.

---

## Configuration options

- `OrderScreen(maxQuantity: <int>)` — the `maxQuantity` parameter controls the maximum number of sandwiches allowed (default set in `main.dart`).
- Pricing is defined in `PricingRepository` (currently six-inch = £7, footlong = £11). See `lib/repositories/order_repository.dart`.

---

## Testing

Run the analyzer:

```powershell
flutter analyze
```

Run unit and widget tests:

```powershell
flutter test
```

Select files or folders to run specific tests, e.g.:

```powershell
flutter test test/pricing_repository_test.dart
flutter test test/views/widget_test.dart
```

Notes about tests

- Widget tests use `find.byKey(...)` for widgets that may appear multiple times (example: the size and toasted Switch widgets use unique Keys).
- The pricing repository has unit tests that assert totals for six-inch and footlong sandwiches and edge cases (zero/negative quantities).

---

## Screenshots / GIFs

Screenshots are not included in this repository. To add screenshots/GIFs:

1. Capture images of the running app on your device/emulator.
2. Add them to a folder such as `assets/screenshots/` and commit them.
3. Reference them in this README using Markdown, for example:

```markdown
![Order screen screenshot](assets/screenshots/order_screen.png)
```

For animated demos you can add a small GIF and embed it similarly.

---

## Contribution ideas

- Add integration tests to exercise full user flows.
- Improve the UI styling and accessibility (semantic labels on controls).
- Add persistence (save orders locally) or a mocked backend to submit orders.
- Internationalize currency formatting using `intl` package.

When contributing, please fork the repo and open a pull request with a descriptive title and summary.

---

## Troubleshooting

- If `flutter run` fails, run `flutter doctor` and resolve any missing SDK/component issues.
- If analyzer shows warnings such as deprecated API usage, update the code as recommended (for example, `DropdownButtonFormField` uses `initialValue` instead of `value`).

---

If you'd like, I can:

- Add a formatted total using the `intl` package (e.g., `£33.00`).
- Add a screenshot or GIF to the repo and update the README with it.
- Add an integration test that verifies the total updates as quantity and size change.

Pick one and I'll implement it and run the tests/analyzer.



