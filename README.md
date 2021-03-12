# README

Welcome to Tell_Me README file. Here you'll find the both the specs, and how to operate the application.

* About 
    Tell_Me is a Task Creating and Managing application which allows users to be promoted to 
    a "Tasker". The promotiom permits the user to then create project. Under that project the Tasker may create tasks associated to that project only. All users may view the project and the project's tasks, but only the Tasker edit it. Under the projects' homepage there is a link for high priority projects to which only projects of priority 5. 

* Start-Up
    To start the server on a local host type 'rails s' into the terminal, and click on the web address which follows after 'Listening on'. To access the rest of the website you must create an account. So navigate to the signup page via the links provided on the welcome page. Here you may either signup using the form provided or return to the welcome page and signup through google. Both will have the same functionality.

* Home Page
    The homepage is straightforward. It will display who is logged in (a helpful feature if you plan on switching accounts a decent amount), from there you have the option to promote yourself to a Tasker position or not. This choice is currently irreversable. Non-Tasker will simply be able to view which tasks are under which projects created. To close your session, click the 'Log out' button. This will terminate your session as the current user, and return you back to the welcome page. 

* Promotion
    Should you wish to become a Tasker, a button title 'Promote to Tasker' is availible at '/sessions/home'. This is the default page after logging in successfully. A check-box form with be displayed. Checking the box, and submitting the form will promote you. As a Tasker, one is able to create projects with the necessary  fields filled title, description, and priority (1-5).

* Projects and Tasks
    As stated before all users may view projects and respected tasks, but only Taskers may create tasks for his/her project. If a non-Tasker, or non-owner of the project attempts to make a task he/she will be directed to an error page. The user state will not equal the owner's state, and therefore fetch an error. This prevents Taskers from being able to append projects which are not theirs. 

* Specs
    * Rails version: 6.1.3 to check what version of Rails you have installed type 'rails -v'
    * Ruby version: ruby 2.6.1p33 to check what version of Ruby you have installed type 'ruby -v'
    * Refer to 'Gemfile' to see all gems and their respected versions. To install all gems type 'bundle'
    * Database models are created and maintained with Active Record which prevents the need to write direct SQL statements


* Database Creation
    To create the datebase type 'rails db:migrate'. The message below should appear:

        == 20210119204450 CreateUsers: migrating ======================================
        -- create_table(:users)
            -> 0.0026s
        == 20210119204450 CreateUsers: migrated (0.0031s) =============================

        == 20210120193042 CreateTasks: migrating ======================================
        -- create_table(:tasks)
            -> 0.0026s
        == 20210120193042 CreateTasks: migrated (0.0027s) =============================

        == 20210123192301 CreateProjects: migrating ===================================
        -- create_table(:projects)
            -> 0.0032s
        == 20210123192301 CreateProjects: migrated (0.0038s) ==========================

    This show each table being created, and how long it took to create them. You will not being able to start 
    the server unless the database has been migrated.

    To delete the database type 'rails db:drop'. This will drop and delete every table within the database. 
    Any table that had data in it will no longer exist. 
    Seeing the message below ensures that the datebase was deleted properly.

    Dropped database 'db/development.sqlite3'
    Database 'db/test.sqlite3' does not exist 

* Closing the server 
    To the close the server enter 'ctrl + c' together. This will close the server, but not delete any tables within the database.

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

