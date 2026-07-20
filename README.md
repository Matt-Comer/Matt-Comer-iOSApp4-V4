# iOSApp4 – ForgeFlow

## Overview

ForgeFlow is a SwiftUI mission and task management application that allows users to create, view, search, edit, complete, and favourite missions. Users can manage project tasks through a custom ForgeFlow interface while navigating between the dashboard, mission list, favourites, settings, login, and registration screens.

---

## Features

* View ForgeFlow missions
* Add new missions
* Edit mission information
* Complete and reactivate missions
* Add and remove favourite missions
* Search missions by title or category
* View mission priority and status
* Navigate between Dashboard, Missions, Favourites, and Settings
* Register a new user account
* Sign in with Firebase Authentication
* Maintain the active user session
* Sign out of the application
* Custom ForgeFlow images and branding
* Custom dark cyber-inspired interface

---

## Twelve Required Features

### 1. NavigationStack and NavigationLink

* Uses NavigationStack to manage screen navigation.
* Uses NavigationLink to open selected mission detail screens.

### 2. Searchable

* Allows users to search missions by title or category from the Missions screen.

### 3. TabView

* Provides navigation between Dashboard, Missions, Favourites, and Settings.

### 4. State Management

* Uses State for local interface values.
* Uses StateObject to create shared ViewModels.
* Uses ObservedObject to pass shared data into screens.
* Uses Published properties to update the interface when data changes.

### 5. Picker and Toggle

* Uses a Picker to choose mission priority.
* Uses Toggle controls for Dark Mode and Notifications settings.

### 6. LazyVStack and ForEach

* Uses LazyVStack to display mission content efficiently.
* Uses ForEach to dynamically display mission and favourite data.

### 7. Firebase Authentication

* Connects the application to Firebase Authentication.
* Supports secure email and password registration and login.

### 8. AuthService

* Contains the Firebase authentication functions.
* Handles user sign-up, sign-in, and sign-out requests.

### 9. AuthViewModel

* Connects the authentication service to the SwiftUI interface.
* Tracks the current Firebase user and login state.

### 10. LoginView

* Allows registered users to enter their email and password.
* Signs users into the application using Firebase Authentication.

### 11. RegisterView

* Allows new users to create an account.
* Sends the registration information to Firebase Authentication.

### 12. Firebase User Session Handling

* Checks whether a Firebase user is currently signed in.
* Displays the authenticated application interface when a user session exists.
* Returns the user to the login interface after signing out.

---

## Technologies Used

* Swift
* SwiftUI
* Xcode
* Firebase Authentication
* NavigationStack
* NavigationLink
* TabView
* Searchable
* LazyVStack
* ForEach
* Picker
* Toggle
* State
* StateObject
* ObservedObject
* Published
* SF Symbols

---

## Project Structure

### Models

* Task.swift

### Views

* ContentView.swift
* MainTabView.swift
* SplashView.swift

### Screens

* AddTaskView.swift
* DashboardView.swift
* FavouriteTasksView.swift
* LoginView.swift
* RegisterView.swift
* SettingsView.swift
* TaskDetailView.swift
* TaskListView.swift

### Components

* SectionHeaderView.swift
* StatusBadgeView.swift
* TaskCardView.swift

### Modals

* EditTaskView.swift

### ViewModels

* AuthViewModel.swift
* TaskViewModel.swift

### Services

* AuthService.swift
* SampleDataService.swift

### Utilities

* AppTheme.swift

### Firebase Configuration

* GoogleService-Info.plist
* FirebaseApp.configure()

---

## Learning Objectives

This project demonstrates:

* Building a multi-screen SwiftUI application
* Creating reusable SwiftUI components
* Managing mission data with a ViewModel
* Using State, StateObject, ObservedObject, and Published properties
* Using NavigationStack and NavigationLink
* Creating tab navigation with TabView
* Searching mission data using searchable
* Dynamically displaying data with LazyVStack and ForEach
* Using Picker and Toggle controls
* Passing mission data between views
* Implementing Firebase Authentication
* Creating registration and login screens
* Managing the active Firebase user session
* Signing users out of the application
* Creating a custom branded user interface
* Writing organized and well-commented Swift code

---

## Application Theme

ForgeFlow is designed around the idea of building, creating, and deploying projects.

The name ForgeFlow represents forging ideas into completed work while maintaining a clear workflow.

---

## AI Usage

OpenAI ChatGPT was used to assist with debugging, interface refinement, SwiftUI guidance, Firebase Authentication setup, and project documentation. All code was reviewed, tested, and integrated by the author.

---

## Author

**Matt Comer**

Mobile Web & App Development

TriOS College

July 2026
