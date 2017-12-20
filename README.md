# README

This is a rails application suitable to back-end, only API and JSON, without any views and all related gems for rendering html/js/css.

* Ruby version
`2.2.5`

* Rails Version
`5.1.4`

* System dependencies

* Configuration
`cp config/database.yml.example database.yml` and fill with actual db settings

* Database preparation
`rails db:create db:migrate db:seed`

* How to run the test suite
`rspec spec`

* Deployment instructions

* ...

* What would you improve next?
- add authentication;
- extract verticals, categories and courses logic into separate service;
- for extracting we want to know other parts of future application;
- add messaging between services like ActiveMQ;
- after that we could deploy several instances with extracted services using load balancer or Kubernetes;
- we could add caching to reduce db communications;
- make complex data structure for seeds.rb, not plain.

* How does your solution scale?
- we are able to add very quickly any amount of resources (like vertical, category, course) with RESTful actions and extend with custom logic.

* What was one of the biggest coding challenges that you ever had?
It was about blockchain. It was a new technology for me. We should had safe and confidential storing system of all transactions about private securities (issuance, allocation, transfer, etc.) in blockchain database. I've known background of blockchain and implemented logic for those user's transactions. It was not difficult or hard but something new, interesting and popular thing in our world.
If we are talking about difficult things in development then it could be SAML SSO. Due to absence of good documentation how the provider implemented SSO on their side. I've tried many approach and special keys in SAML communications to get SSO works.