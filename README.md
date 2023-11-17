# Ruby on Rails Soft Delete Functionality

## Overview

This Ruby on Rails application introduces a basic soft delete functionality for an `Item` model. Soft delete allows records to be marked as 'deleted' without being physically removed from the database, enabling features like a trash or recycle bin where records can be restored.

## Getting Started

### Prerequisites

- Ruby: ruby 3.1.2p20
- Rails: Rails 7.1.2
- Database: PostgreSQL

### Setup

1. Clone the repository:
   https://github.com/kennethlee0502/Coding-test

2. Install dependencies:
   bundle install

3. Set up the database:
   rails db:create
   rails db:migrate

### Running the Application

Start the Rails server:
rails server

Access the app at `http://localhost:3000`.

### Running Tests

Execute RSpec tests:
rspec

## Soft Delete Functionality

### Implementation

- The `Item` model includes a `deleted_at` attribute (datetime).
- Soft delete is facilitated by two methods:
  - `soft_delete` - Sets `deleted_at` to the current timestamp.
  - `restore` - Resets `deleted_at` to `nil`.
- Default scope in `Item` model excludes records where `deleted_at` is not `nil`.

## Challenges and Solutions

### Encountered Challenges

- **Understanding Soft Delete**: Initially grasping the concept of soft delete and its implications for data retrieval and integrity. This was resolved by researching soft delete patterns and understanding their use cases in application development.

- **Implementing Default Scope**: Deciding whether to use a default scope for soft-deleted records. The challenge was to understand how it affects queries throughout the application. This was resolved by testing various scenarios and ensuring that the default scope aligns with the application's query requirements.

- **RSpec Testing**: Writing effective tests for the soft delete functionality using RSpec was initially challenging, especially in simulating different states of the `Item` model. Overcame this by referring to RSpec documentation and online resources, leading to a robust suite of tests that accurately assess the functionality.

- **Database Migrations**: Encountered some difficulties in managing database migrations, particularly in adding the `deleted_at` column to the existing `Item` model. Resolved by reviewing Rails migration documentation and ensuring proper rollback mechanisms were in place.

- **Performance Considerations**: Assessing the impact of the soft delete functionality on the application's performance, especially with large datasets. Optimized queries and indexed the `deleted_at` column to mitigate any performance issues.

### Design Decisions

- **Soft Delete Mechanism**: Chosen for its ability to preserve data integrity and allow data recovery.
- **Default Scope Usage**: Employed to simplify queries across the application, excluding soft-deleted items by default.
