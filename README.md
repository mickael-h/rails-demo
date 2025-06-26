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
- **PostgreSQL**: Production-ready relational database
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

## Development Setup

### Prerequisites

- Ruby 3.2+
- Rails 8+
- PostgreSQL 14+
- Node.js & Yarn (for JS/CSS bundling)

### 1. Install dependencies

```sh
bundle install
```

### 2. Set up environment variables

For local development, you can use a `.env` file (with [dotenv-rails](https://github.com/bkeepers/dotenv)) or export variables in your shell:

```sh
export PGUSER=postgres
export PGPASSWORD=postgres
export PGHOST=localhost
export PGPORT=5432
```

Or create a `.env` file:

```
PGUSER=postgres
PGPASSWORD=postgres
PGHOST=localhost
PGPORT=5432
```

### 3. Prepare the database

```sh
bin/rails db:prepare
```

### 4. Start the server

```sh
bin/dev
# or
rails server
```

### 5. Run tests

```sh
bundle exec rspec
```

## Deployment (Render)

1. **Push your code to GitHub/GitLab.**
2. **Create a new Web Service on [Render](https://dashboard.render.com/):**
   - Connect your repo
   - Set build command: `bundle install && bundle exec rails db:migrate`
   - Set start command: `bundle exec rails server -p 10000`
   - Add environment variables:
     - `RAILS_ENV=production`
     - `RAILS_MASTER_KEY` (from `config/master.key`)
     - `DATABASE_URL` (from Render's PostgreSQL service)
3. **Add a PostgreSQL database on Render and link it to your service.**
4. **Deploy!**

## Notes

- The app uses TheMealDB API (no API key required for basic use)
- All recipe previews are cached in the browser for the session
- The UI is fully responsive and works on desktop and mobile

## Contributing

PRs and suggestions are welcome! This project is intended as a clean, modern Rails demo.
