
<?php
session_start();
require_once '/var/www/db-config.php';

$search = trim($_GET['search'] ?? '');

$sql = "
    SELECT
        a.Anime_id,
        a.Anime_title,
        a.Description,
        a.Release_year,
        a.episode_count,
        a.anime_type,
        s.Studio_name,
        AVG(r.rating) AS average_rating,
        COUNT(r.review_id) AS review_count
    FROM Anime a
    LEFT JOIN Studios s
        ON a.studio_id = s.Studio_id
    LEFT JOIN Reviews r
        ON a.Anime_id = r.anime_id
    WHERE a.Anime_title LIKE :search
    GROUP BY
        a.Anime_id,
        a.Anime_title,
        a.Description,
        a.Release_year,
        a.episode_count,
        a.anime_type,
        s.Studio_name
    ORDER BY a.Anime_title;
";

$stmt = $pdo->prepare($sql);
$stmt->execute(['search' => '%' . $search . '%']);
$animeList = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>AnimeHub</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #151520;
            color: white;
        }

        header {
            background: #222234;
            padding: 30px 20px;
            text-align: center;
        }

        header h1 {
            color: #a78bfa;
            font-size: 38px;
            margin: 0;
        }

        header p {
            color: #ccccdd;
        }

        main {
            max-width: 1200px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .search-form {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
        }

        .search-form input {
            flex: 1;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #55556b;
            background: #252537;
            color: white;
            font-size: 16px;
        }

        .search-form button {
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            background: #8b5cf6;
            color: white;
            cursor: pointer;
        }

        .search-form button:hover {
            background: #7c3aed;
        }

        .anime-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .anime-card {
            background: #252537;
            border: 1px solid #393950;
            border-radius: 10px;
            padding: 20px;
        }

        .anime-card h2 {
            color: #c4b5fd;
            margin-top: 8px;
        }

        .anime-card p {
            color: #dddded;
            line-height: 1.5;
        }

        .rating {
            color: #facc15 !important;
            font-size: 19px;
            font-weight: bold;
        }

        .anime-id {
            color: #a5a5bb;
            font-size: 13px;
        }

        .results {
            color: #ccccdd;
            margin-bottom: 20px;
        }

        footer {
            text-align: center;
            padding: 30px;
            color: #aaaaaa;
        }
    </style>
</head>

<body>

<header>
    <h1>AnimeHub</h1>
    <p>Discover your next favorite anime.</p>
<div style="margin-top: 20px;">

    <?php if (isset($_SESSION['user_id'])): ?>

        <span style="color: #c4b5fd;">
            Welcome, <?= htmlspecialchars($_SESSION['username'] ?? 'User') ?>!
        </span>

        <a href="logout.php"
           style="color: #ffcc00; margin-left: 20px;">
            Logout
        </a>

    <?php else: ?>

        <a href="login.php"
           style="color: #c4b5fd; margin-right: 20px;">
            Login
        </a>

        <a href="register.php"
           style="color: #ffcc00;">
            Register
        </a>

    <?php endif; ?>

</div>
</header>

<main>

    <h2>Anime Collection</h2>

    <form class="search-form" method="GET" action="">
        <input
            type="text"
            name="search"
            placeholder="Search anime by title..."
            value="<?php echo htmlspecialchars($search); ?>"
        >

        <button type="submit">Search</button>
    </form>

    <p class="results">
        <?php echo count($animeList); ?> anime found
    </p>

    <div class="anime-grid">

        <?php if (count($animeList) > 0): ?>

            <?php foreach ($animeList as $anime): ?>

                <div class="anime-card">

                    <span class="anime-id">
                        Anime #<?php echo htmlspecialchars((string)$anime['Anime_id']); ?>
                    </span>

                    <h2>
                        <?php echo htmlspecialchars($anime['Anime_title']); ?>
                    </h2>

                    <p>
                        <?php echo htmlspecialchars($anime['Description'] ?? 'No description available.'); ?>
                    </p>

                    <p>
                        <strong>Studio:</strong>
                        <?php echo htmlspecialchars($anime['Studio_name'] ?? 'Unknown'); ?>
                    </p>

                    <p>
                        <strong>Release Year:</strong>
                        <?php echo htmlspecialchars((string)$anime['Release_year']); ?>
                    </p>

                    <p>
                        <strong>Episodes:</strong>
                        <?php echo htmlspecialchars((string)$anime['episode_count']); ?>
                    </p>

                    <p>
                        <strong>Type:</strong>
                        <?php echo htmlspecialchars($anime['anime_type']); ?>
                    </p>

                    <p class="rating">
                        <?php
                        if ($anime['average_rating'] !== null) {
                            echo number_format((float)$anime['average_rating'], 1) . " / 10";
                        } else {
                            echo "Not rated yet";
                        }
                        ?>
                    </p>

    <p>
    <?php echo (int)$anime['review_count']; ?> community reviews
</p>                
                        <a href="anime.php?id=<?php echo (int)$anime['Anime_id']; ?>">
    View Reviews
</a>
                    

                </div>

            <?php endforeach; ?>

        <?php else: ?>

            <p>No anime found. Try another search.</p>

        <?php endif; ?>


    </div>

</main>

<footer>
    AnimeHub Community Anime Collection
</footer>

</body>
</html>
