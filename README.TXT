Lab 2 – Stored Procedures and Cursors
Roll Number: 2025202003
Name: Sunil Kumar


Setup Instructions

1. Open MySQL Workbench and connect to the MySQL server.
2. Create and select the lab2 database:
   CREATE DATABASE lab2;
   USE lab2;

3. Create the required tables and insert the sample data from Activity.pdf:
   - Shows
   - Subscribers
   - WatchHistory

4. (For richer testing only) Locally added extra tuples to Subscribers, Shows, and WatchHistory tables to verify procedures with more varied data.

5. Run each .sql file (q1.sql to q5.sql) to create the procedures.


Execution Instructions

Q1:
USE lab2;
CALL ListAllSubscribers();

Q2:
USE lab2;
CALL GetWatchHistoryBySubscriber(<SubscriberID>);

Q3:
USE lab2;
CALL AddSubscriberIfNotExists('<SubscriberName>');

Q4:
USE lab2;
CALL SendWatchTimeReport();

Q5:
USE lab2;
CALL SendFullWatchReport();


Sample Output for Q1

CALL ListAllSubscribers();

SubscriberName
Aman

SubscriberName
Ravi

SubscriberName
Neha

SubscriberName
Priya

SubscriberName
Karan


Sample Output for Q2

CALL GetWatchHistoryBySubscriber(1);

Title                | WatchTime
Stranger Things      | 100
The Crown            | 10
The Witcher          | 30


Sample Output for Q3

CALL AddSubscriberIfNotExists('John Doe');
Subscriber "John Doe" added successfully.

CALL AddSubscriberIfNotExists('John Doe');
Subscriber "John Doe" already exists.


Sample Output for Q4

CALL SendWatchTimeReport();

== Report for Aman ==
Stranger Things      100
The Crown            10
The Witcher          30

== Report for Ravi ==
Stranger Things      20
The Crown            40
The Witcher          10

== Report for Priya ==
The Crown            60
The Witcher          45

== Report for Karan ==
Stranger Things      25


Sample Output for Q5

CALL SendFullWatchReport();

== Report for Aman ==
Stranger Things      100
The Crown            10
The Witcher          30

== Report for Ravi ==
Stranger Things      20
The Crown            40
The Witcher          10

== Report for Neha ==
(no shows watched)

== Report for Priya ==
The Crown            60
The Witcher          45

== Report for Karan ==
Stranger Things      25


Git Repository Link

<PASTE YOUR GITHUB REPO URL HERE>


Notes-
- Each .sql file contains only the procedure definition (no CREATE TABLE or INSERT statements).
- Additional sample tuples were inserted locally during testing to produce richer outputs for verification.
- These extra tuples are NOT part of the submitted .sql files, as the evaluator already has the base dataset.
