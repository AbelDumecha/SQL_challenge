# SQL Challenge: Employee Data Analysis

## Overview
### This repository contains a data engineering and analysis project focusing on employee data from the 1980s and 1990s at Pewlett Hackard. The project includes data modeling, data engineering (importing CSV files into SQL tables), and data analysis tasks.

## Directory Structure
### • data/: Contains the CSV files with employee data.
### • sql/: Contains SQL scripts for table creation and data analysis queries.
### • README.md: This file providing an overview and instructions.
### • ERD.png: Entity Relationship Diagram (ERD) for the database schema.

## Instructions
## Data Modeling
### • Inspect the CSV files provided in the data/ directory.
### • Use a tool like QuickDBD to sketch an Entity Relationship Diagram (ERD) for  the database tables.

## Data Engineering
### • Create a table schema for each CSV file in the sql/tables.sql script.
### • Define data types, primary keys, foreign keys, and other constraints as necessary.
### • Create the tables in the correct order to handle foreign keys.
### • Import each CSV file into its corresponding SQL table using the sql/import_data.sql script.

## Data Analysis
### 1. Use SQL queries to perform the following data analysis tasks:
#### • List employee information such as employee number, last name, first name, sex, and salary.
#### • List employees hired in 1986 with their first name, last name, and hire date.
#### • List department managers with department information and employee details.
#### • List employee department information.
#### • List specific employee details based on criteria (e.g., first name, last name, department).
#### • Perform frequency counts of employee last names.

## Usage
### • Clone this repository to your local machine.
### • Set up a PostgreSQL database.
### • Run the SQL scripts in the sql/ directory to create tables, import data, and perform data analysis.

## Files Included
### • ERD.png: Entity Relationship Diagram (ERD) image.
### • sql/tables.sql: SQL script for creating table schemas.
### • sql/import_data.sql: SQL script for importing CSV data into tables.
### • sql/analysis_queries.sql: SQL script containing data analysis queries.
### • data/: CSV files with employee data.

