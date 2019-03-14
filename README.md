## RP on Rails (backend)

This is the backend for RP on rails - a SPA web app that helps RP GMs keep track
of their campaigns' locations, related plots, and random side plots. The front
end for this app is [here](https://tarayoo.github.io/rp-on-rails-client/). The repository is [here]()

### Features

#### User Authorization
The back end enables user sign up, authorization (token generation), password change, and sign out. General Assembly Boston set up the database structure, security features, and dependencies for user authorization.

#### Locations
Locations have plots, and indicate whether the players have either visited the location, or are currently in the location. A user has many locations.
Users can only interact with their own locations.

#### Risks and Rewards
Risks and rewards are named 'Bokbulboks' in the code to follow Rails convention of using single wards for model names. Bokbulbok is a Korean slang for randomly selected items that could either be terrible or great. Each risk or reward has a plot, and indicates whether the risk or reward were used. Risks and rewards are not treated separately, since they're supposed to be selected form the same black box.

### Planning
#### ERD
![ERD](https://i.imgur.com/VMjIeF6.png)

#### User stories
For now, GMs are the only users.

- As a user, I want to have my own account that I can sign up for, and sign into
- As a user, I want to be able to change my passwords
- As a user, I want to be able to log out and in
- As a user, I want only myself to be able to access my information
- As a user, I want clear feedback on all actions
- As a user, I want my authorization forms to clear after each interaction
MVP
- As a gm, I want to add locations that the party can go to
- As a gm, I want to associate plots with my locations
- As a gm, I want to indicate whether or not the party visited the location, or is currently in that location
- As a gm, I want to add the outcomes of the players' visiting a location

- As a gm, I want to have a pool of risks and rewards that will happen to the players when they leave
a location to travel to another one

### Future issues
- Add an adjacency matrix to locations to represent how locations are clustered together. The end goal would be to represent the relationship between locations as a graph
- Pull plots out into its own table. Many plots go unused because the players randomly decide to skip over other locations, or to kill key npcs. Moving the plot and creating a many-to-many relationship would help GMs reuse their plots.
- Add a party table. The party table should track the entire party's health, actions, and items to help gms track the party as a single entity to easily develop balanced encounters.
- Add an npc table. Most plots revolve around NPCs, and NPCs should be able to move around independent of location.
- Create a join table to link plots, npcs, and locations so all elements can function independent of each other

### Technologies
- Ruby
- Rails
