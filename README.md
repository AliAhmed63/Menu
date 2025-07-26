# 🍽️ Menu App - Flutter + Firebase

This is a basic restaurant mobile app built with Flutter and Firebase. The app includes user authentication, a menu screen, and a cart system with clean navigation and CI/CD integration.

## 🔐 Authentication

- Firebase Email & Password authentication
- Form validation for empty fields and invalid email formats

## 🧾 Menu Page

- Displays a list of food items
- Each item includes name, price, and optional image
- Data loaded from Firebase Firestore

## 🛒 Cart Page (Bonus)

- Users can add/remove items to/from cart
- Displays selected items with total price
- Local state management using `Provider`

## 🔧 Tech Stack

- **Flutter**
- **Firebase Authentication**
- **Firebase Firestore**
- **Provider** (for state management)
- **GitHub Actions** (CI/CD pipeline)

## 📁 Project Structure

lib/
├── core/ # Constants, styles, and helper classes
├── features/
│ ├── auth/ # Login screen and auth logic
│ ├── menu/ # Menu screen and Firestore service
│ ├── cart/ # Cart page and logic
├── models/ # Data models
├── widgets/ # Reusable widgets
main.dart
yaml


## 🚀 CI/CD (Bonus)

This repo includes a basic GitHub Actions workflow for:
- Flutter pub get
- Build check
- Analyze and test

Path: `.github/workflows/flutter.yml`

## 📽️ Demo Video

A full demo with explanation:  
👉 [Google Drive Video](https://drive.google.com/drive/folders/1HccXraCT1WYnWGhvXH9OuyaPsExi5YFc?usp=sharing)

## 👨‍💻 Author

**Ali Ahmed**  
[GitHub Profile](https://github.com/AliAhmed63)

---

> Thank you for reviewing this task. Looking forward to your feedback.


