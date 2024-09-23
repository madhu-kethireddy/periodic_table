# 💻 Project: Querying data based on user request.

![periodic table banner (4)](https://user-images.githubusercontent.com/88495091/209232470-e7d902b6-0ceb-407e-b3ba-7f3042655162.png)

# Periodic Table Database

Welcome to the Periodic Table Database project! This project involves managing a database of chemical elements and creating a script to query information about these elements.

## Project Overview

This project is divided into three main parts:

1. **Fix the Database**: Correct mistakes in the existing database.
2. **Create a Git Repository**: Version control your code with Git.
3. **Create the Script**: Develop a script to query the database for element information.

## Instructions

### Part 1: Fix the Database

1. **Rename Columns**:
   - Rename the `weight` column to `atomic_mass`.
   - Rename the `melting_point` column to `melting_point_celsius`.
   - Rename the `boiling_point` column to `boiling_point_celsius`.

2. **Set Constraints**:
   - Ensure `melting_point_celsius` and `boiling_point_celsius` columns do not accept null values.
   - Add `UNIQUE` constraint to the `symbol` and `name` columns in the `elements` table.
   - Ensure `symbol` and `name` columns have the `NOT NULL` constraint.

3. **Foreign Keys**:
   - Set the `atomic_number` column in the `properties` table as a foreign key referencing the `atomic_number` column in the `elements` table.

4. **Create Types Table**:
   - Create a `types` table with `type_id` (integer, primary key) and `type` (VARCHAR, not null) columns.
   - Add three rows to the `types` table representing the different types from the `properties` table.
   - Add a `type_id` foreign key column in the `properties` table referencing the `type_id` column in the `types` table.

5. **Data Adjustments**:
   - Capitalize the first letter of all `symbol` values in the `elements` table.
   - Remove trailing zeros from the `atomic_mass` column values.
   - Add the element with atomic number 9 (Fluorine) to the database.

### Part 2: Create Your Git Repository

1. Initialize a Git repository in your project folder.
2. Commit your changes regularly to track your progress.

### Part 3: Create the Script

1. Develop a script (`element.sh`) that accepts an argument (atomic number, symbol, or name) and outputs information about the element.
2. Use the following PSQL variable for querying the database:
   ```bash
   PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

### Notes
1. If you leave your virtual machine, your database may not be saved. Use the following command to create a dump of your database:
   ```bash
   pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
2. To rebuild the database, use:
   ```sh
   psql -U postgres < periodic_table.sql

### License
- This project is licensed under the MIT License. See the LICENSE file for details.

### Acknowledgments
- Thanks to freeCodeCamp for providing the project framework and instructions.
- Special thanks to all contributors and reviewers who help improve this project.

### Submission
 After completing all tasks and passing the tests, save a dump of your database and the final version of your element.sh script 
 in a public repository. Submit the URL to your repository on freeCodeCamp.org.
 Good luck and happy coding!
 ```md
 Feel free to customize this `README.md` file to better fit your project's specifics and any additional details you want to i 
 include. If you need further assistance, just let me know!


