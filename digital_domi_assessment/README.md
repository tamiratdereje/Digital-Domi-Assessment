# Digital Domi Assessment

## Project Overview

Digital Domi converts physical mailboxes into secure digital mail management and communication platforms, allowing homeowners to control their mail from an intuitive app. This project is a Flutter-based mobile application using GetX for state management, making navigation simpler and reducing boilerplate code.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [State Management with GetX](#state-management-with-getx)
4. [Architecture Overview](#architecture-overview)
5. [Running the Project](#running-the-project)
6. [Contributing](#contributing)

## Getting Started

### Prerequisites

Ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/tamiratdereje/Digital-Domi-Assessment.git
    cd Digital-Domi-Assessment
    ```
2. Install dependencies:
    ```sh
    flutter pub get
    ```

## Project Structure

The project follows a modular structure for better scalability and maintainability:

1. **lib/main.dart**: Entry point of the app.
2. **lib/screens/**: Contains the implementation of the app's screens.
3. **lib/models/**: Contains the model classes for the items.
4. **lib/controller/**: Contains the state management logic using GetX.
5. **lib/binding/**: Initializes the controllers and binds them to the pages.
6. **lib/routes/**: Manages the routing system, including `app_page` and `app_routes`.
7. **lib/widgets/**: Contains common widgets used across the app.
8. **lib/widgets/data/**: Repository to deliver data to the controller.
9. **lib/constants/**: Contains constants like `app_string`, `app_color`, and `map_view_config`.

## State Management with GetX

GetX is used for state management to simplify the navigation and reduce boilerplate code. It allows for reactive programming, dependency injection, and route management, all in a single package.

### Key Features of GetX:
- **Reactive State Management**: Automatically updates the UI when data changes.
- **Dependency Injection**: Easily manage dependencies with minimal boilerplate.
- **Route Management**: Simplified navigation and route handling.

## Architecture Overview

The architecture follows the MVVM (Model-View-ViewModel) pattern to separate business logic from UI. This ensures that the codebase is more maintainable and scalable.

1. **Model**: Represents the data structure and business logic.
2. **View**: The UI of the app, implemented as widgets.
3. **ViewModel**: Manages the state and handles user interactions.

## Running the Project

1. Open the project in your preferred IDE.
2. Ensure a device is connected or an emulator is running.
3. Run the app:
    ```sh
    flutter run
    ```

## Contributing

Feel free to contribute to the project by creating pull requests or reporting issues. 

For more details, refer to the official [GetX documentation](https://pub.dev/packages/get).

---

Happy coding!
