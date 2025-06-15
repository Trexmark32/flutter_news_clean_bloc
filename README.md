# Flutter News App - Clean Architecture & BLoC

This Flutter project demonstrates a news application built using Clean Architecture principles and BLoC for state management. It fetches top headlines from the NewsAPI (specifically from TechCrunch) and displays them in a swipeable, page-view format similar to Inshorts.

## Core Architectural Goals

The primary goal of this project is to showcase:

1.  **A Well-Defined Folder Structure with Clean Architecture:**
    Clean Architecture promotes separation of concerns, making the codebase more understandable, maintainable, testable, and scalable. Our structure divides the application into distinct layers:

    *   **Domain Layer (`lib/features/article/domain`):**
        *   **Entities (`entities`):** Contains the core business objects (e.g., `ArticleEntity`). These are plain Dart objects and have no dependencies on other layers.
        *   **Repositories (`repository`):** Abstract interfaces defining contracts for data operations (e.g., `ArticleRepository`). The domain layer depends on these abstractions, not concrete implementations.
        *   **Use Cases (`usecases`):** Encapsulate specific business logic or application-specific rules (e.g., `GetArticleUsecase`). They orchestrate data flow between the presentation and data layers by using repository abstractions.

    *   **Data Layer (`lib/features/article/data`):**
        *   **Data Sources (`data_sources`):** Responsible for fetching data from external sources (e.g., `ArticleApiService` for remote API calls).
        *   **Models (`models`):** Data transfer objects (DTOs) that extend domain entities and include logic for serialization/deserialization (e.g., `ArticleModel` with `fromJson`).
        *   **Repositories (`repository`):** Concrete implementations of the repository interfaces defined in the domain layer (e.g., `ArticleRepositoryImpl`). This layer handles data fetching, mapping, and error handling.

    *   **Presentation Layer (`lib/features/article/presentation`):**
        *   **BLoC (`bloc`):** Manages the state of UI components. It receives events from the UI, interacts with use cases, and emits states that the UI observes and rebuilds accordingly. (e.g., `ArticleBloc`, `ArticleState`, `ArticleEvent`).
        *   **Pages/Screens (`pages`):** UI screens that users interact with (e.g., `NewsFeedPage`). They dispatch events to BLoCs and listen to state changes to update the UI.
        *   **Widgets (`widgets`):** Reusable UI components (e.g., `ArticlePageItem`).

    *   **Core (`lib/core`):** Contains shared utilities, constants, and base classes used across multiple features (e.g., `DataState` for handling API call states).

    *   **Config (`lib/config`):** Application-level configurations (though currently minimal in this project).

    *   **Dependency Injection (`lib/injection_container.dart`):** Uses `get_it` to manage and provide dependencies throughout the application, promoting loose coupling.

    This layered approach ensures that UI changes don't affect business logic, and business logic changes don't affect data sources, leading to a more robust and flexible application.

2.  **Simplified State Management with BLoC:**
    BLoC (Business Logic Component) is a predictable state management library that helps separate business logic from the UI.

    *   **Events:** Represent user actions or other triggers (e.g., `GetArticleEvent`).
    *   **BLoCs:** Receive events, process them (often by calling use cases), and emit new states.
    *   **States:** Represent the UI's current condition (e.g., `ArticleLoading`, `ArticleLoaded`, `ArticleError`).

    By using BLoC, the state of complex applications becomes easier to manage, test, and debug. The UI simply reacts to state changes, making the data flow unidirectional and clear. In this project, `ArticleBloc` handles fetching and displaying news articles, managing loading, success, and error states seamlessly.

## Features

*   Fetches top headlines from TechCrunch via NewsAPI.
*   Displays news articles in a vertical swipeable `PageView`.
*   Shows article image, title, author, published date, and description.
*   Handles loading and error states gracefully.
*   Uses `flutter_dotenv` to manage API keys and base URLs.

## Setup

1.  Clone the repository.
2.  Create a `.env` file in the root of the project with your NewsAPI key and base URL:
    ```
    NEWS_API_BASE_URL=https://newsapi.org/v2
    NEWS_API_KEY=YOUR_NEWS_API_KEY
    ```
3.  Run `flutter pub get`.
4.  Run the app: `flutter run`.

This project serves as a practical example of applying Clean Architecture and BLoC in a Flutter application, demonstrating how these patterns contribute to building scalable and maintainable mobile apps.

