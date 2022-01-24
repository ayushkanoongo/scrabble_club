# README

## Description
A scrabble club requires a system to store members’ information and provide leader
boards to show their top performing players.

## Requirements
* Ruby - 2.7.4
* Rails - 6.1.4
* PostgreSQL

## Database Schema
  (You can check this same on schema.rb file in the project)
  * To store members details
  ```sql
  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  ```

  * To store matches details
  ```sql
  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  ```

  * To store participants details
  ```sql
  create_table "participants", force: :cascade do |t|
    t.float "score"
    t.bigint "member_id"
    t.bigint "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["match_id"], name: "index_participants_on_match_id"
    t.index ["member_id"], name: "index_participants_on_member_id"
  end
  ```

  * Foreign keys
  ```sql
    add_foreign_key "participants", "matches"
    add_foreign_key "participants", "members"
  ```

1. Remaining Functionality:

  - The given app contains all required functionality. No points are remaining according to the given document.

2. Which type of problem's you've faced during the test.

  - I have completed the app but it took some time to reduce the number of queries which takes time once we got too much data in the system.
  - At one point, I need to change a update in database schema to reduce number of queries.
  - As, I don't have much knowledge about Rspec or unit test in ruby but I have check the maximum number of test cases from my side.

3. I have used following gems:
  - gem "rubocop"
    To follow the best pratices in rails application.

  - gem 'bullet'
    To use eager loading or prevent unnecessary eager loading and make application faster.

  - gem 'will_paginate'
    To use pagination the the listing page to load page faster.

  - gem 'pry'
    For debug purpose

  - Steps to run the application at your end:

    * clone the application
      ```
      git clone https://github.com/ayushkanoongo/scrabble_club.git
      ```

    * Go to app directory
      ```
      cd /scrabble_club
      ```

    * Install the required Ruby version (i.e. ruby-2.7.4)

      ```
      rbenv install 2.7.4
      rbenv local 2.7.4
      ```

      ```
      rvm install ruby-2.7.4
      rvm use 2.7.4
      ```

    * run the following commands in app directory to configure the application

      ```
      bundle install
      ```
      - To install the gems and dependencies

      ```
      rails db:setup
      ```
      - To create the database

      ```
      rails db:migrate
      ```
      - To create the tables in the DB

      ```
      rails db:seed
      ```
      - To install the sample Database in the DB

      ```
      rails s
      ```
      - To run the rails server on local environment

    * Open the Browser the following URL:
      http://localhost:3000/


4. Features that I have implemented:

  - Member Leaderboard:
    leader board screen to list the members with the top 10 average scores, for those members who have played at least 10 matches.

  - Edit Member Information :
    To Edit the Member information (first_name, last_name, phone, email, address)

  - Member profile's Screen:
    * Member personal data
    * Number of Wins
    * Number of Losses
    * Their Average
    * Their highest score, when it was scored, and against whom

  - Create Matches
    * Create maches with addding two particpants via ui and select members from list and set their score.
    * System will automatic calculate who win and lose the match and show the results on leader board.
