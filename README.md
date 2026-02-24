 
#  Fresh Market App

A Flutter mobile application for browsing and shopping fresh groceries (vegetables, fruits, and meats).

---

##  Requirements

Before running this project, make sure you have the following installed:

| Tool | Download Link | Purpose |
|------|---------------|---------|
| Flutter SDK | https://flutter.dev/docs/get-started/install | Run & build the app |
| Dart SDK | Included with Flutter | Programming language |
| Android Studio | https://developer.android.com/studio | Android emulator & SDK |
| Java JDK 17+ | https://www.oracle.com/java/technologies/downloads/ | Required for Android |
| VS Code *(optional)* | https://code.visualstudio.com/ | Code editor |

### VS Code Extensions (if using VS Code)
- **Flutter** – Run and debug Flutter apps
- **Dart** – Dart language support

---

##  How to Run

```bash
# 1. Open project folder
  Opnen Project folder to VS code or Android studio
# 3. Install dependencies
  Open teminal and run command stand on project folder and run command
  flutter pub get 

# 4. Run the app (emulator or physical device must be connected)
After install dependancies then run project 
  flutter run
---
 

## � How the App Works (App Flow)
App Starts (main.dart)
        │
        ▼
ProductProvider (loads all product data)
        │
        ▼
TreeWidget (root scaffold)
        │
        ├── Bottom Navigation Bar (NavbarWidget)
        │         │
        │    [Home] [Category] [Favorite] [Cart]
        │
        ├──  Home Page
        │       – Shows auto-play banner carousel
        │       – Lists Vegetables, Fruits, Meats horizontally
        │       – "View more" links to full category pages
        │       – "Add to Cart" button on each product
        │
        ├──  Category Page
        │       – Search bar to find products by name
        │       – Filter chips: All / Vegetable / Fruit / Meat
        │       – Grid view of filtered products
        │       – Toggle  Favorite on each product
        │       – "Add to Cart" on each product
        │
        ├──  Favorite Page
        │       – Shows all favorited products in a grid
        │       – "Add to Cart" from favorites
        │       – Remove individual or clear all favorites
        │
        └──  Cart Page
                – Lists all cart items with quantity controls (+ / -)
                – Shows total price
                – Remove individual items or clear entire cart



##  Packages Used

| Package | Version | Purpose |
|---------|---------|---------|
| provider | ^6.1.5+1 | Manage app state (cart, favorites) |
| carousel_slider | ^5.1.2 | Auto-sliding banner on Home page |
| cupertino_icons | ^1.0.8 | iOS-style icons |

---

## Project stucture
  lib/
  ├── main.dart              # Entry point, sets up Provider
  ├── model/
  │   ├── product_list_model.dart     # Product data class
  │   ├── product_provider.dart       # Cart & favorite logic (state)
  │   └── seleted_page_notifier.dart  # Tracks current nav page
  ├── pages/
  │   ├── home_page.dart         # Home screen
  │   ├── category_page.dart     # Browse & search products
  │   ├── favorite_page.dart     # Saved favorites
  │   ├── cart_page.dart         # Shopping cart
  │   ├── fruit_page.dart        # All fruits
  │   ├── vegetable_page.dart    # All vegetables
  │   └── meat_page.dart         # All meats
  ├── components/
  │   ├── product_card_component.dart       # Product card (grid)
  │   ├── product_cart_component.dart       # Cart item row
  │   └── product_homecard_component.dart   # Product card (home)
  └── widgets/
      ├── navbar_widget.dart    # Bottom navigation bar
      └── tree_widget.dart      # Root page switcher

## assets 
assets/
└── image/
    ├── fruit.png        # Banner image
    ├── vegetables.png   # Banner image
    ├── meats.png        # Banner image
    ├── fruit/           # Fruit product images
    ├── vegetable/       # Vegetable product images
    └── meat/            # Meat product images


## Getting Started 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

