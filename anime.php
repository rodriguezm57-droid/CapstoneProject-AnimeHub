
<?php
session_start();
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

// Handle review submissions
$review_error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['user_id'])) {
        $review_error = 'Please log in to leave a review.';
    } elseif (
        !isset($_POST['csrf_token'], $_SESSION['review_csrf']) ||
        !hash_equals($_SESSION['review_csrf'], $_POST['csrf_token'])
    ) {
        $review_error = 'Invalid form submission. Please try again.';
    } else {
        $rating = filter_var(
            $_POST['rating'] ?? null,
            FILTER_VALIDATE_INT
        );
        $review_text = trim($_POST['review_text'] ?? '');

        if ($rating === false || $rating < 1 || $rating > 10) {
            $review_error = 'Please select a rating from 1 to 10.';
        } elseif ($review_text === '' || strlen($review_text) > 255) {
            $review_error = 'Review must be 1 to 255 characters.';
        } else {
            $sql = "
                INSERT INTO Reviews
                    (user_id, anime_id, rating, review_text,
                     review_date, last_updated)
                VALUES
                    (:user_id, :anime_id, :rating, :review_text,
                     CURDATE(), CURDATE())
                ON DUPLICATE KEY UPDATE
                    rating = VALUES(rating),
                    review_text = VALUES(review_text),
                    last_updated = CURDATE()
            ";

            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                'user_id' => $_SESSION['user_id'],
                'anime_id' => $anime_id,
                'rating' => $rating,
                'review_text' => $review_text
            ]);

            header('Location: anime.php?id=' . $anime_id);
            exit;
        }
    }
}

if (empty($_SESSION['review_csrf'])) {
    $_SESSION['review_csrf'] = bin2hex(random_bytes(32));
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
    .review-form {
    background: #252537;
    border: 1px solid #393950;
    border-radius: 12px;
    padding: 25px;
    margin: 25px 0;
}

.star-rating {
    display: flex;
    flex-wrap: wrap;
    gap: 5px;
    margin: 15px 0;
}

.star {
    background: transparent;
    border: none;
    color: #777;
    font-size: 32px;
    cursor: pointer;
    padding: 2px;
    transition: color 0.15s, transform 0.15s;
}

.star.active {
    color: #ffcc00;
}

.star:hover {
    transform: scale(1.15);
}

.review-form textarea {
    display: block;
    width: 100%;
    box-sizing: border-box;
    padding: 12px;
    margin: 12px 0;
    background: #151520;
    color: white;
    border: 1px solid #555;
    border-radius: 8px;
    font-family: Arial, sans-serif;
}

.submit-review {
    background: #8b5cf6;
    color: white;
    border: none;
    padding: 12px 22px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
}

.submit-review:hover {
    background: #a78bfa;
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

    
<section class="review-form">
    <h2>Rate & Review This Anime</h2>

    <?php if (isset($_SESSION['user_id'])): ?>

        <?php if (!empty($review_error)): ?>
            <p style="color: #ff7777;">
                <?= htmlspecialchars($review_error) ?>
            </p>
        <?php endif; ?>

        <form method="POST"
              action="anime.php?id=<?= (int)$anime_id ?>">

            <input type="hidden" name="csrf_token"
                   value="<?= htmlspecialchars($_SESSION['review_csrf']) ?>">

            <p>Select your rating:</p>

            <div class="star-rating" id="starRating">
                <?php for ($i = 1; $i <= 10; $i++): ?>
                    <button type="button"
                            class="star"
                            data-rating="<?= $i ?>"
                            aria-label="Rate <?= $i ?> out of 10">
                        ★
                    </button>
                <?php endfor; ?>
            </div>

            <input type="hidden" name="rating"
                   id="selectedRating" required>

            <p id="ratingText">No rating selected</p>

            <label for="reviewText">Your Review</label>

            <textarea id="reviewText"
                      name="review_text"
                      maxlength="255"
                      rows="5"
                      required
                      placeholder="What did you think of this anime?"></textarea>

            <button type="submit" class="submit-review">
                Submit Review
            </button>
        </form>

    <?php else: ?>

        <p>
            Please <a href="login.php">log in</a>
            to rate and review this anime.
        </p>

    <?php endif; ?>
</section>
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
<script>
document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('#starRating .star');
    const ratingInput = document.getElementById('selectedRating');
    const ratingText = document.getElementById('ratingText');
    const starContainer = document.getElementById('starRating');

    if (!starContainer || !ratingInput || !ratingText) return;

    let selectedRating = 0;

    function highlightStars(rating) {
        stars.forEach(function (star) {
            const starValue = Number(star.dataset.rating);
            star.classList.toggle('active', starValue <= rating);
        });
    }

    stars.forEach(function (star) {
        star.addEventListener('mouseenter', function () {
            const rating = Number(star.dataset.rating);
            highlightStars(rating);
            ratingText.textContent = rating + ' / 10';
        });

        star.addEventListener('click', function () {
            selectedRating = Number(star.dataset.rating);
            ratingInput.value = selectedRating;
            highlightStars(selectedRating);
            ratingText.textContent = 'Your rating: ' + selectedRating + ' / 10';
        });
    });

    starContainer.addEventListener('mouseleave', function () {
        highlightStars(selectedRating);

        ratingText.textContent = selectedRating
            ? 'Your rating: ' + selectedRating + ' / 10'
            : 'No rating selected';
    });
});
</script>
</body>
</html>
