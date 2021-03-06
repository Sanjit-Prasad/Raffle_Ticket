# README

This README will document the partial fulfilment of the assignment. We explains each task briefly and how we accomplish them. We also provide a detailed view of all the services, tools, databases, programming languages used for the same.

* Ruby version
    * ruby 2.4.10p364 (2020-03-31 revision 67879) [x86_64-linux]

* Rails version
    * Rails 5.2.4.4

* Services
    * cron job
    * job queues

* Database
    * DatabaseName: MySql2
    * Server: localhost:3306
    * DatabaseName: raffle_ticketdb
    * Tables: users, rewards, tikets, winners

* Tools
    * phpMyAdmin: UI to view database
    * Postman: To make API calls to server

# ER Diagram
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/ER.png?raw=true)

# Association between Models
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/6.png?raw=true)


# Objective
Lucky Draw Gaming Service

# Task
Design & Implement a service which allows users to get Lucky Draw Raffle tickets and use one lucky draw raffle ticket to participate in a lucky draw game.

# Functional Requirements

# 1. API which allows users to get the raffle tickets

* If the user dosen't have generated any raffle ticket for the event, then she call an API 'generate_raffle_ticket', which issue them a raffle ticket from available tickets.

* API & Result

![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/1.1.png?raw=true)


![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/1.2.png?raw=true)

# 2. - Design an API which shows the next Lucky Draw Event timing & the corresponding reward.

* A cron_job will run everyday at 8AM which will compute the winner using API 'find_winner'.
* The job will also resets the users (ticket_id) and tikets (used) data.
* The same users can participate in next event and we can use the same ticket from database.

# 3. Design an API which allows users to participate in the game. Once a user has participated with a raffle ticket, she shouldn’t be able to participate again in the same event.

* If the user already has already participated in the ongoing event and has already generate the ticket, we show the ticket_number for the ticket user has generated.

# 4. Design an API which lists all the winners of all the events in the last one week.

* We call an API 'search_last_week_winners' which makes a query to the databse and get a json repsonse of winners of past week.

* API & Result

![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/4.1.png?raw=true)


![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/4.2.png?raw=true)

# 5. Compute the winner for the event and announce the winner.

* We have made a cron_job which will run everyday at 8AM. The task of the job is to compute the winner for the last ongoing event and select a user who has participated in the event by generating a raffle ticket for that event.

* API & Result

![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/5.1.png?raw=true)


![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/5.2.png?raw=true)


# Extras

## Database Tables

# 1. User Table
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/user.png?raw=true)

# 2. Reward Table
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/reward.png?raw=true)

# 3. Ticket Table
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/ticket.png?raw=true)

# 4. Winner Table
![alt text](https://github.com/Sanjit-Prasad/Raffle_Ticket/blob/main/images/winner.png?raw=true)