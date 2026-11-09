
<?php
require_once '/var/www/db-config.php';

// Get the anime ID from the URL
$anime_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$anime_id) {
    die("Invalid anime ID.");
}

// Get the selected anime
$sql = "
    SELECT a.*, s.Studio_name
    FROM Anime a
    LEFT JOIN Studios s ON a.studio_id = s.Studio_id
    WHERE a.Anime_id = :id
";

$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $anime_id]);
$anime = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$anime) {
    die("Anime not found.");
}

// Get reviews for THIS anime only
$sql = "
    SELECT r.review_id, r.rating, r.review_text,
           r.review_date, u.Username
    FROM Reviews r
    JOIN Users u ON r.user_id = u.User_id
    WHERE r.anime_id = :id
    ORDER BY r.review_date DESC
";

$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $anime_id]);
$reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($anime['Anime_title']); ?> Reviews</title>

    <style>
        body {
            background: #151520;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 25px;
        }

        main {
            max-width: 850px;
            margin: auto;
        }

        h1, h2 {
            color: #c4b5fd;
        }

        .review {
            background: #252537;
            border: 1px solid #393950;
            padding: 20px;
            margin: 15px 0;
            border-radius: 10px;
        }

        .rating {
            color: #facc15;
            font-weight: bold;
        }

        a {
            color: #a78bfa;
        }
    </style>
</head>

<body>
<main>

    <a href="index.php">← Back to AnimeHub</a>

    <h1><?php echo htmlspecialchars($anime['Anime_title']); ?></h1>

    <p>
        <?php echo htmlspecialchars($anime['Description'] ?? 'No description available.'); ?>
    </p>

    <h2>Community Reviews</h2>

    <?php if (count($reviews) > 0): ?>

        <?php foreach ($reviews as $review): ?>

            <div class="review">

                <h3>
                    <?php echo htmlspecialchars($review['Username']); ?>
                </h3>

                <p class="rating">
                    Rating: <?php echo htmlspecialchars((string)$review['rating']); ?>/10
                </p>

                <p>
                    <?php echo nl2br(htmlspecialchars($review['review_text'])); ?>
                </p>

                <small>
                    Posted: <?php echo htmlspecialchars($review['review_date']); ?>
                </small>

            </div>

        <?php endforeach; ?>

    <?php else: ?>

        <p>No reviews yet. Be the first to review this anime!</p>

    <?php endif; ?>

</main>
</body>
</html>
