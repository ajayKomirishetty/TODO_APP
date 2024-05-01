# Todo Application

This project is a simple yet robust Todo application built using Ruby on Rails. It leverages modern web technologies including Tailwind CSS for styling, SQLite3 for the database, and Turbo Frames from Hotwire for dynamic content updates without full page reloads.

## Features

- **Add Todos**: Users can add todos with details such as title, description, and time.
- **Todo Sections**: Todos are organized into two sections:
    - **In Progress Todos**: Displays todos that are currently being worked on.
    - **Completed Todos**: Shows todos that have been completed.

## Technology Stack

- **Ruby on Rails**: A powerful web application framework.
- **Tailwind CSS**: A utility-first CSS framework for rapidly building custom designs.
- **SQLite3**: A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine.
- **Turbo Frames**: Part of Hotwire, allows particular sections of a page to be updated without causing a full page reload.

## Installation

To get this application running on your local machine, follow these steps:

1. **Set up the database**
   Following command will create the database, load the schema, and initialize it with the seed data.

   ```bash
   rails db:setup

2. **Start the server**
   ```bash
   rails s
This will boot the Puma web server at http://localhost:3000 (unless port specified). Navigate to this URL in your web browser to view the application.Note: If you encounter issues where the CSS is not loading, and Tailwind does not seem to be building correctly, try running the server with:
   ```bash
    bin/dev
