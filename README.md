# Student App

A modern Flutter student dashboard application for managing classroom, assignments, chat, routine, results, MAR certificates, attendance, fees, and more. Built with GetX for efficient routing and state management.

## Team Members
- Rajdeep Dey
- Srijani Ghosh
- Raj Dutta
- Abantika Mondal

## Features
- Modular screens for classroom, assignments, chat, routine, results, MAR certificates, attendance, fees, and account management
- Modern UI with custom themes and navigation
- Bottom navigation bar for seamless screen switching
- Attendance tracking and history
- Notification system
- Profile management and editing

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/rajdeep-py/student_app.git
cd student_app
```

### Install Dependencies
```bash
flutter pub get
```

### Run the App
```bash
flutter run
```

## File Structure & Explanation
```
student_app/
├── android/                  # Android native project files
├── ios/                      # iOS native project files
├── linux/                    # Linux desktop project files
├── macos/                    # macOS desktop project files
├── windows/                  # Windows desktop project files
├── web/                      # Web project files
├── assets/                   # Images, videos, and other assets
│   ├── images/
│   └── videos/
├── lib/
│   ├── controller/           # GetX controllers for each feature/module
│   │   ├── account/          # Account management logic
│   │   ├── assignment/       # Assignment logic
│   │   ├── auth/             # Authentication logic
│   │   ├── chat/             # Chat logic
│   │   ├── classroom/        # Classroom logic
│   │   ├── fee/              # Fees logic
│   │   ├── home/             # Home/dashboard logic
│   │   ├── permission/       # Permission handling
│   │   ├── result/           # Results logic
│   │   ├── routine/          # Routine logic
│   ├── models/               # Data models for each feature
│   ├── routes/               # App routes (GetX GetPage definitions)
│   ├── screens/              # UI screens for each feature
│   │   ├── account/
│   │   ├── assignment/
│   │   ├── auth/
│   │   ├── chat/
│   │   ├── classroom/
│   │   ├── fees/
│   │   ├── home/
│   │   ├── mar/
│   │   ├── permission/
│   │   ├── result/
│   │   ├── routine/
│   │   ├── theme/
│   │   └── widgets/
│   ├── theme/                # App theme and styles
│   ├── widgets/              # Reusable widgets (app bar, bottom nav, carousel, etc.)
│   └── main.dart             # App entry point
├── pubspec.yaml              # Flutter dependencies and assets
├── README.md                 # Project documentation
└── ...                       # Other config and build files
```

### Explanation
- **controller/**: Contains GetX controllers for business logic and state management for each feature.
- **models/**: Data models representing entities like User, Assignment, Attendance, etc.
- **routes/**: Centralized route definitions using GetX's GetPage for navigation.
- **screens/**: UI screens for each feature, organized by module.
- **theme/**: App-wide color schemes, text styles, and theming.
- **widgets/**: Reusable UI components (e.g., custom app bar, bottom navigation bar, carousel).
- **assets/**: Images and videos used throughout the app.

## GetX Usage
- **Routing**: All navigation is handled via GetX's GetPage and named routes, providing fast and flexible screen transitions.
- **State Management**: Controllers use GetX's reactive variables (`.obs`) for efficient state updates and UI reactivity.
- **Dependency Injection**: Controllers are injected using `Get.put()` and `Get.find()` for easy access across screens.

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [GetX Documentation](https://pub.dev/packages/get)
