# Rails Demo: Cooking Recipes App

This is a modern Ruby on Rails 8 demo application that fetches and displays cooking recipes from TheMealDB API. It is designed with clean code principles, a focus on maintainability, and a modern, user-friendly UI.

## Features

- **Search for recipes** by keyword (default: "chicken")
- **Recipe cards**: Clean, responsive, preview cards with image, title, and ingredients
- **Modal preview**: Click a card to preview the full recipe in a Bootstrap modal (with caching for performance)
- **Show page**: Consistent, centered layout with large image, ingredients, instructions, and source link
- **Clean code**: Service objects, thin controllers, separation of concerns
- **Comprehensive tests**: RSpec, FactoryBot, and Shoulda Matchers for models, controllers, requests, and views
- **Bootstrap 5**: Modern, responsive UI via CDN

## Tech Stack & Choices

- **Ruby on Rails 8**: Latest Rails version for modern conventions
- **Bootstrap 5**: For responsive, accessible, and attractive UI
- **RSpec**: For robust, readable testing
- **FactoryBot & Faker**: For test data
- **Shoulda Matchers**: For concise model specs
- **Service Object Pattern**: `app/services/recipe_fetcher.rb` handles all API logic
- **Rails.cache**: Caches fetched recipes for 12 hours to reduce API calls
- **sessionStorage**: Caches modal preview HTML per session for instant UX
- **Turbo**: Used for navigation, with custom JS to ensure event handlers work after search

## Clean Code Principles

- **Separation of concerns**: API logic in service, presentation in views, coordination in controllers
- **No dead code or unused variables**: Regularly cleaned and checked
- **No business logic in views/controllers**: All logic is in models/services
- **Tests match current UI**: All specs are up to date with the latest design

## How to Run

1. **Install dependencies**
   ```sh
   bundle install
   ```
2. **Prepare the database**
   ```sh
   bin/rails db:prepare
   ```
3. **Start the server**
   ```sh
   bin/dev
   # or
   rails server
   ```
4. **Run tests**
   ```sh
   bundle exec rspec
   ```

## Notes

- The app uses TheMealDB API (no API key required for basic use)
- All recipe previews are cached in the browser for the session
- The UI is fully responsive and works on desktop and mobile

## Contributing

PRs and suggestions are welcome! This project is intended as a clean, modern Rails demo.
