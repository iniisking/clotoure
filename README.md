### Cloture — E‑commerce Clothing App (Flutter)

Modern, mobile-first e‑commerce app for clothing built with Flutter and Firebase. It features onboarding, authentication, product browsing by category, shimmering loading states, and a scalable BLoC architecture.

## Demo

![App flow](docs/flow.gif)

### Features

- **Onboarding flow**: Includes profile setup like “About Yourself”.
- **Authentication**: Email/password auth with display name setup (Firebase Auth).
- **Product catalog**: Fetch products by category from Firestore.
- **Responsive UI**: `flutter_screenutil` for adaptive sizing; Material 3 theme.
- **State management**: `flutter_bloc` with typed events/states.
- **Loading skeletons**: `shimmer` for graceful loading.
- **Scalable assets**: Auto-generated asset accessors via `flutter_gen` / `assets_gen`.

### Tech Stack

- **Flutter** (Material 3, `flutter_screenutil`, `flutter_svg`)
- **BLoC**: `flutter_bloc`, `equatable`
- **Firebase**: `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`
- **Tooling**: `build_runner`, `flutter_gen`, `assets_gen`, `flutter_lints`

### Architecture

- `lib/services/bloc`: Feature-based BLoC folders (`sign in`, `sign up`, `splash`, etc.)
- `lib/services/firebase`: Service layer (`auth_service.dart`, `product_service.dart`)
- `lib/screens`: UI and flows (onboarding, auth, home, notifications, profile, orders)
- `lib/utilities`: Shared UI components and utilities (buttons, text fields, colors, shimmers, bottom nav)
- `assets/`: Images, SVGs, and fonts used throughout the app

Auth flow entry-point wires BLoC in `lib/main.dart`:

```dart
home: BlocProvider(
  create: (context) => SplashBloc(authService: AuthService())
    ..add(SplashStart())
    ..add(CheckAuthenticationEvent()),
  child: const AboutYourself(),
)
```

### Getting Started

#### Prerequisites

- Flutter SDK set up (`flutter --version`)
- Firebase project (Android/iOS/Web as needed)
- Dart 3.4+

#### Clone

```bash
git clone https://github.com/your-username/cloture.git
cd cloture
```

#### Install dependencies

```bash
flutter pub get
```

#### Configure Firebase

- Preferred: use env-based options (see Environment variables below). No service files committed.
- Android (file-based alternative): add `google-services.json` under `android/app/` (do not commit).
- iOS/macOS (file-based alternative): add `GoogleService-Info.plist` under Runner targets (do not commit).
- Web: if using web config, inject via env or runtime; avoid committing secrets.

Firebase initialization is handled in `main.dart` with `Firebase.initializeApp(options: ...)` using `flutter_dotenv`.

#### Generate assets (optional but recommended)

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### Environment variables

Create a `.env` from `.env.example` and fill in your Firebase keys:

```env
FIREBASE_API_KEY=your_api_key
FIREBASE_APP_ID=your_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_STORAGE_BUCKET=your_bucket.appspot.com
FIREBASE_IOS_BUNDLE_ID=com.example.cloture
```

#### Run the app

```bash
flutter run
```

### Build

Android App Bundle:

```bash
flutter build appbundle --target-platform android-arm,android-arm64,android-x64
```

iOS (from macOS):

```bash
flutter build ios --release
```

Web:

```bash
flutter build web
```

### Cloud Functions (optional)

This repo includes a sample Firebase Cloud Function to add a product document to Firestore (`functions/index.js`). Deploy with the Firebase CLI if you plan to use it.

```bash
cd functions
npm install
firebase deploy --only functions
```

### Apple Pay (note)

If you add Apple Pay to the iOS app, include merchant capabilities and supported networks in your `Info.plist` as needed. Example keys:

```xml
<key>NSAppleMerchantCapabilities</key>
<array>
  <string>3DS</string>
  <string>debit</string>
  <string>credit</string>
  </array>
<key>NSApplePaySupportedNetworks</key>
<array>
  <string>visa</string>
  <string>masterCard</string>
</array>
```

### Project Structure

```
lib/
  main.dart
  screens/
  services/
    bloc/
    firebase/
  utilities/
assets/
  images/ svg/ fonts/
functions/
  index.js
```

### Roadmap

- Product details and cart
- Checkout and orders
- Favorites and notifications
- Search and filters

### Contributing

Contributions are welcome. Please open an issue or submit a PR.

### License

MIT — see `LICENSE` (or choose the license that fits your needs).

### Acknowledgements

- Flutter and Firebase teams
- Open-source package maintainers listed in `pubspec.yaml`
