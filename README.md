# Hacklet

A hackathon management platform.

## Features
- Participant registration/login etc.
- Management of multiple hackathons
- Teams and team management
- Mentor system
- Attendance checking
- Invitation system (each team has a captain and can invite other people - registered/unregistered)
- Submission and approvement of projects
- Hackathon issues submission (for network issues etc.), which can be closed by admins only
- Gallery (for uploading pictures after the event, every registered user can do so and they are later approved by an admin)
- Freebies tagging (i.e when you give out Subway or other free stuff for the participants)

## Installation

0. Don't run on Windows
1. Download and install [Ruby](https://www.ruby-lang.org/en/)
2. Download and install [Rails](http://rubyonrails.org/)
3. Fork and clone the repository

    ```
    $ git clone https://github.com/{$username}/Hacklet
    ```
    
4. Install all of the required Rails packages

    ```
    $ bundle install
    ```
    
5. Start the server

    ```
    $ rails s
    ```
    
6. Start your favourite browser and open

    ```
    http://localhost:3000/
    ```
    
## Deployment

Deployment is done through Capistrano. Once you set up the desired box, configure deployment in `config/deploy.rb`. Initially, run 

    $ cap production deploy:initial
    
Then, for each consequent depoyment:

    $ git add -A
    $ git commit -m "Deploy Message"
    $ git push origin master
    $ cap production deploy

Don't forget to fork the repository before cloning.

## Authors
- Ivaylo Arnaudov (arnaudoff)
- Plamen Neshkov (PlamenNeshkov)
