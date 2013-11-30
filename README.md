# To Do

* Move create recording form to ember
* Add comments to user_mailer
* Load next video on finish
* Add zip file type
* Browser test

# Mongodb dump

https://webops.nodejitsu.com/databases

`mongoexport --host staff.mongohq.com:10080 -db nodejitsudb729415965755 -u nodejitsu -p{{pass}} --collection recordings --out dump/recordings.json`

`mongoexport --host staff.mongohq.com:10080 -db nodejitsudb729415965755 -u nodejitsu -p{{pass}} --collection users --out dump/users.json`