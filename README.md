# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# rails-contact-manager
Based on this: http://tutorials.jumpstartlab.com/projects/contact_manager.html

## Notes on the tutorial
When you reach the section titled: Building a Web-based Workflow, you will eventually stumbled upon the following error when running the specs:

```
ActiveRecord::RecordInvalid (Validation failed: Person must exist):
```

To silence this error, set `optional: true` in *app/models/phone_number.rb*:
```
belongs_to :person, optional: true
```
