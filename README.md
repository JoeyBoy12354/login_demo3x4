# Flutter Login Demo

A Flutter application demo that uses Stacked CLI for state management and Firebase Authentication.

## Features

- Login with email and password using Firebase Authentication
- Proper dependency injection using `locator.dart`
- Navigation between Login and Home views
- Route guards to prevent unauthenticated access
- Unit and integration tests
- Clean UI with loading indicators

## Project Structure

This project follows the recommended structure for Stacked applications:

- `app/`: Application setup, routing, and dependency injection
- `models/`: Data models
- `services/`: Service classes for authentication and other functionality
- `ui/`: UI components, including views and view models

## Setup Instructions
- Ensure Flutter is installed and set up properly
- Run flutter pub get to install all dependencies
- Run flutter run to start the application
- Test credentials: Email: asddsa@gmail.com, Password: asddsa
- Execute flutter test to run all unit and integration tests