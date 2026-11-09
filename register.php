
<?php
session_start();
require_once '/var/www/db-config.php';

$message = "";
$success = false;

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $username = trim($_POST["username"] ?? "");
    $email = strtolower(trim($_POST["email"] ?? ""));
    $password = $_POST["password"] ?? "";

    if ($username === "" || $email === "" || $password === "") {
        $message = "Please fill in all fields.";

    } elseif (strlen($username) > 100 || strlen($email) > 100) {
        $message = "Username and email must be 100 characters or less.";

    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = "Please enter a valid email address.";

    } elseif (strlen($password) < 8) {
        $message = "Your password must be at least 8 characters.";

    } else {

        // Securely hash the password
        $password_hash = password_hash($password, PASSWORD_DEFAULT);

        try {
            $sql = "INSERT INTO Users
                    (Username, Email, Password_hash, Date_created)
                    VALUES (:username, :email, :password, CURDATE())";

            $stmt = $pdo->prepare($sql);

            $stmt->execute([
                "username" => $username,
                "email" => $email,
                "password" => $password_hash
            ]);

            // Remember the newly registered user
            session_regenerate_id(true);
            $_SESSION["user_id"] = $pdo->lastInsertId();
            $_SESSION["username"] = $username;

            $success = true;

        } catch (PDOException $e) {
            if ($e->getCode() == "23000") {
                $message = "That email is already registered.";
            } else {
                $message = "Something went wrong. Please try again.";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeHub Registration</title>

    <style>
        body {
            background: #151520;
            color: white;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            padding-top: 70px;
        }

        .container {
            background: #252537;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
        }

        h1 {
            color: #a78bfa;
            text-align: center;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #8b5cf6;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        a {
            color: #a78bfa;
        }

        .message {
            margin-bottom: 15px;
            color: #facc15;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Join AnimeHub</h1>

    <?php if ($success): ?>

        <h2>Account created!</h2>

        <p>Welcome, <?php echo htmlspecialchars($_SESSION["username"]); ?>!</p>

        <p>Your account has been saved successfully.</p>

        <a href="index.php">Go to AnimeHub</a>

    <?php else: ?>

        <?php if ($message !== ""): ?>
            <p class="message">
                <?php echo htmlspecialchars($message); ?>
            </p>
        <?php endif; ?>

        <form method="POST">

            <input
                type="text"
                name="username"
                placeholder="Choose a username"
                maxlength="100"
                required
            >

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                maxlength="100"
                required
            >

            <input
                type="password"
                name="password"
                placeholder="Create a password (8+ characters)"
                minlength="8"
                required
            >

            <button type="submit">Create Account</button>

        </form>

        <p><a href="index.php">Back to AnimeHub</a></p>

    <?php endif; ?>

</div>

</body>
</html>
