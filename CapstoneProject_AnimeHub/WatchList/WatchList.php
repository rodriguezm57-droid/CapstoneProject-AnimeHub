!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeHub | My WatchList</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">Anime<span>Hub</span></div>

        <nav>
            <a href="#" class="active">My WatchList</a>
        </nav>
    </header>

    <main class="container">

        <section class="hero">
            <p class="eyebrow">YOUR ANIME UNIVERSE</p>
            <h1>My WatchList</h1>
            <p>Track your favorite anime and discover what's next.</p>
        </section>

        <section class="stats">
            <div class="stat-card">
                <h2>0</h2>
                <p>Total Anime</p>
            </div>
            <div class="stat-card">
                <h2>0</h2>
                <p>Watching</p>
            </div>
            <div class="stat-card">
                <h2>0</h2>
                <p>Completed</p>
            </div>
        </section>

        <section class="collection">
            <div class="section-header">
                <h2>Your Collection</h2>
                <input type="search"
                       placeholder="Search your anime...">
            </div>

            <div class="filters">
                <button class="selected">All Anime</button>
                <button>Watching</button>
                <button>Completed</button>
                <button>Plan to Watch</button>
            </div>

            <div class="anime-grid">
                <article class="anime-card">
                    <div class="poster-placeholder">
                        <span>ANIME</span>
                    </div>
                    <div class="card-content">
                        <h3>Naruto</h3>
                        <p>2002 · 220 Episodes</p>
                        <span class="status">Watching</span>
                    </div>
                </article>
            </div>
        </section>

        <section class="add-section">
            <h2>Add to Your WatchList</h2>
            <p>Choose an anime and start tracking it.</p>
            <button class="add-button">+ Add Anime</button>
        </section>

    </main>

</body>
</html>