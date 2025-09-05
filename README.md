# Context
Clash Royale: a real-time strategy mobile game developed by Supercell, the same company that made Clash of Clans. It blends elements of card collecting, tower defense, and multiplayer online battle arena (MOBA) games.

# Problem
I once went to a friend’s house, and we tried to organize a Clash Royale tournament. As expected, my friends started joking and exaggerating about who won their matches, which made it difficult to track points accurately. Since points were crucial for determining the best player, this highlighted the need for a website to manage leagues and tournaments, allowing friends to compete fairly. A platform like this could track results and maintain a personalized leaderboard, rather than relying solely on trophy counts.

# Solution
The solution should be a website for easy distribution and broad accessibility. It needs to store information about groups, players, their points, and previous tournaments. To ensure fair play, the site must verify match results, preventing players from lying about their wins. This is where the official Clash Royale API comes into play, providing accurate and verifiable game data.

# Technology
Database: PostgreSQL
Reason: PostgreSQL is a robust, reliable, and widely trusted relational database. It handles structured data extremely well, making it ideal for managing groups, players, points, and tournament histories. It is also scalable and performant, capable of supporting both small-scale leagues and larger competitions as the website grows. Its strong support for ACID transactions ensures data consistency, which is crucial for accurately tracking scores and tournament outcomes.

Backend: Go
Reason: Go is an efficient and powerful language for building web backends. Using sqlx, it provides type-safe and convenient SQL handling, along with code generation for SQL queries, which reduces boilerplate and errors. Go’s standard library and web frameworks allow for modular web server development, enabling easy splitting of handlers, routing, and API endpoints. It also offers excellent concurrency support, which is useful if the website needs to handle multiple users and API requests simultaneously.

Frontend: Svelte
Reason: Svelte offers a smooth and productive development experience for building interactive web interfaces. Unlike some other frameworks, it compiles components to highly efficient JavaScript, resulting in fast page loads and responsive UI. Its reactive data handling makes it easy to manage dynamic elements like leaderboards, points, and tournament brackets. Additionally, Svelte’s syntax is straightforward and intuitive, making it quicker to write and maintain compared to more verbose frameworks, without sacrificing flexibility or performance.

# Design Docs

