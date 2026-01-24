# monthly-costs-mobile

A cross-platform mobile app to track and visualize monthly costs and expenses. Built with Flutter (Dart) and includes native components in C++ (CMake) for performance-sensitive logic.

Badge placeholders
- Build: [![Build Status](https://img.shields.io/badge/build-pending-lightgrey)]()
- License: [![License](https://img.shields.io/badge/license-MIT-blue)]()

Table of contents
- About
- Features
- Tech stack
- Screenshots
- Getting started
  - Prerequisites
  - Clone & install
  - Run (Android & iOS)
  - Building release artifacts
- Native/C++ notes
- Testing
- Contributing
- License
- Contact

About
A simple and lightweight mobile application to help users track monthly expenses, categorize spending, and view summaries over time. The project uses Flutter for the UI and includes native C++ modules (built with CMake) for parts of the business logic or performance-heavy code.

Features
- Add, edit and delete expense entries
- Categories and recurring expenses
- Monthly summaries and basic charts
- Local persistence (SQLite/Flutter preferred plugin)
- Cross-platform support: Android and iOS
- Native C++ modules for performance-critical code paths

Tech stack
- Flutter / Dart (mobile UI & app logic)
- C++ & CMake (native modules)
- iOS (Swift / Xcode project files)
- Android (Gradle)
- HTML (app assets / web previews)
Note: Repository language composition includes significant C++ and CMake portions along with Dart — ensure native toolchain is available when building on a platform that requires compiling native code.

Getting started

Prerequisites
- Flutter SDK (version >= stable channel as used by the project)
- Android SDK + Android Studio (for Android builds)
- Xcode (for iOS builds, macOS only)
- CocoaPods (for iOS native dependencies): gem install cocoapods
- CMake and a native build tool (Ninja or make) if building the C++ components locally
- Git

Clone & install
1. Clone the repo:
   git clone https://github.com/otaviano/monthly-costs-mobile.git
   cd monthly-costs-mobile

2. Get Flutter packages:
   flutter pub get

Platform-specific setup

Android
- Ensure Android SDK and an emulator or device are available.
- To run in debug:
  flutter run
- To build a release APK:
  flutter build apk

iOS (macOS only)
- Install CocoaPods dependencies:
  cd ios
  pod install
  cd ..
- To run on a device or simulator:
  flutter run
- To build an archive or IPA:
  flutter build ipa

Building release artifacts
- Android (APK/AAB):
  flutter build apk --release
  flutter build appbundle --release

- iOS (IPA):
  flutter build ipa --release

Native / C++ notes
- The repository includes native C++ code built with CMake. Flutter will invoke the platform toolchain to compile native code as part of the normal flutter build process.
- If you need to build or test the native components separately:
  - Install CMake and Ninja/make
  - Inspect the native directory (e.g., native/, cpp/, or android/ or ios/ subfolders) for the CMakeLists.txt and instructions.
  - Example standalone build:
    mkdir -p build && cd build
    cmake -G Ninja ../path/to/native -DCMAKE_BUILD_TYPE=Release
    ninja
- If you want specific guidance locating or building a native target, tell me the path to the native source (e.g., android/src/main/cpp or ios/Classes) and I can give exact commands.

Testing
- Unit tests (Dart):
  flutter test

- Integration / widget tests:
  Follow the integration_test package workflow (see Flutter docs).
  flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart

- Native tests:
  Run native test targets using your platform toolchain (see native/ README if present).

Contributing
- Fork the repository and create a feature branch.
- Submit pull requests with a clear title and description.
- Open issues for bugs or feature requests.
- Add tests for new functionality where possible.

Suggested branching workflow
- main — stable production-ready code
- develop — integration branch for active development
- feature/<name> — feature branches

Code style & linting
- Follow standard Dart/Flutter style guides (use dartfmt / dart format and flutter analyze).
- If C++ code exists, run clang-format or the project's chosen formatter.

License
- Add your preferred license file (LICENSE). If you want MIT, Apache-2.0, or GPL, I can add a template for you.

Contact
- Maintainer: otaviano
- For questions, open an issue on GitHub or contact the maintainer via their GitHub profile.
