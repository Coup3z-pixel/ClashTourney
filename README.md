# Context
Clash Royale: a real-time strategy mobile game developed by Supercell, the same company that made Clash of Clans. It blends elements of card collecting, tower defense, and multiplayer online battle arena (MOBA) games. Here’s a breakdown:

# Problem
I once went to a mate's house and we tried to do a clash royale tournament. My mates being mates, obviously started joking and lying about who won their matches. It was hard to track and verify points which were the determinant for deciding who was the best at clash royale and the point of the tournament. It seemed to show that it was necessary for a website to exist to hold and track your mates in a league and tournament style structure to find the best player in a group and have a leaderboard between your friends to make it more personal and not based on trophy count.

# Solution
The solution needs to be a website for easy distribution and broad accessibility. I need to store information about groups and players their points and previous tournaments. I also need to verify that people aren't lying about if their won their game or not, this is where the official Clash Royale API is used. 

# Technology
Database: Postgres
Reason: Strong backend, speedy, scalable and trusted, also great for dealing with formatted data like a group, person, and handling points

Backend: Go
Reason: sqlx is a great library for handling SQL databases and code generation for SQL, great web framework library system and ability to split and customize handlers and web serving

Frontend: Svelte
Reason: Easy writing experience (All JS Frameworks are the same imo), great JS and HTML loading and data handling on frontend


# 
