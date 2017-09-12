straVS.
=======

https://stra-vs.herokuapp.com/
email: jeremysabat@gmail.com
password: test1234

### Members

- [Ethan Spiro](https://github.com/ethanspiro)
- [Shirley Shaw](https://github.com/shirleys)
- [Jeremy Sabat](https://github.com/velveetachef)
- [Murat Gocmen](https://github.com/muratdbc)

___

### Team Agreements

 - Learn as much as possible in a short sprint
 - 100% effort
 - Be kind, honest and actionable
 - Focus on working during core hours
 - Have fun

___

### About StraVS.

StraVS. is a competitive biking and running application built using the Strava API. Users sign in with an exisiting Strava account and form teams with their friends or peers. Teams challenge eachother to week-long battles of endurance and athletics. A winner is determined at the end of the week by total meters run.

___

### Technology Stack

 - Rails API
 - AngularJS
 - Bootstrap
 - HTML5
 - CSS3
 - Deploy: Heroku

___

### Git Workflow

 1. git clone master repo
 2. git checkout -b "feature name"
 3. Do you work on that feature branch
 4. git add .
 5. git commit -m "meaningful commit message"
 6. git fetch origin
 7. git rebase origin/master

#### IF CONFLICTS
 - explore files and fix
 - git add .
 - git rebase --continue OR git rebase --skip (to escape)

8. git push origin "your branch name"
9. create pull request on github
10. somebody else merges (this should never have conflicts and should always automerge)
11. git checkout master
12. git pull origin master
13. delete old branch (git branch -d <name of branch you want to delete>

___

### Schema

![alt text](schema.png "Schema Design")

___

### API Documentation

 - [straVS API](https://github.com/muratdbc/strava)

Resource :User

 - Endpoint:/api/v1/users      Method:Post    Action: new user
 - Endpoint:/api/v1/users/:id  Method:Get     Action:show user
 - Endpoint:/api/v1/users/:id  Method:Patch   Action:update user
 - Endpoint:/api/v1/users/:id  Method:Delete  Action:delete user

Resource :Team

 - Endpoint:/api/v1/teams     Method:Post    Action:new team
 - Endpoint:/api/v1/teams     Method:Get     Action:all teams
 - Endpoint:/api/v1/teams/:id Method:Get     Action:show team
 - Endpoint:/api/v1/teams/:id Method:Patch   Action:update team
 - Endpoint:/api/v1/teams/:id Method:Delete  Action:destroy team


Resource :Game

 - Endpoint:/api/v1/games     Method:Post    Action:new game
 - Endpoint:/api/v1/games     Method:Get     Action:all games
 - Endpoint:/api/v1/games/:id Method:Get     Action:show game
 - Endpoint:/api/v1/games/:id Method:Patch   Action:update game
 - Endpoint:/api/v1/games/:id Method:Delete  Action:destroy game

Warning Even though PUT routes shows up in the rake routes, it is NOT imeplemented in the controller.

If you want to test it from Postman, here is an example for Post:
 - Form data key value should be user[strava_name]
 - value = name



