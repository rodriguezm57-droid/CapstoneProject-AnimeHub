
<?php
session_start();
require_once '/var/www/db-config.php';

if (isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $password === '') {
        $error = 'Please enter your username and password.';
    } else {
        try {
            $stmt = $pdo->prepare(
                'SELECT User_id, Username, Password_hash
                 FROM Users WHERE Username = ? LIMIT 1'
            );
            $stmt->execute([$username]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['Password_hash'])) {
                session_regenerate_id(true);

                $_SESSION['user_id'] = $user['User_id'];
                $_SESSION['username'] = $user['Username'];

                header('Location: index.php');
                exit;
            }

            $error = 'Incorrect username or password.';
        } catch (PDOException $e) {
            error_log('Login error: ' . $e->getMessage());
            $error = 'Unable to log in right now. Please try again.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - AnimeHub</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #15151f;
            color: white;
        }

        header {
            background: #222233;
            text-align: center;
            padding: 35px 20px;
        }

        header h1 {
            color: #a78bfa;
            font-size: 40px;
            margin: 0;
        }

        .login-container {
            max-width: 420px;
            margin: 65px auto;
            padding: 30px;
            background: #252538;
            border-radius: 12px;
        }

        h2 { text-align: center; }

        label {
            display: block;
            margin: 18px 0 8px;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #555;
            border-radius: 6px;
            background: #191925;
            color: white;
            font-size: 16px;
        }

        button {
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            background: #8b5cf6;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover { background: #a78bfa; }

        a { color: #a78bfa; }

        .error {
            background: #572b38;
            padding: 12px;
            border-radius: 6px;
        }

        .links {
            text-align: center;
            margin-top: 22px;
        }
    </style>
</head>
<body>
    <header>
        <h1>AnimeHub</h1>
        <p>Welcome back to your anime community.</p>
    </header>

    <main class="login-container">
        <h2>Login to Your Account</h2>

        <?php if ($error !== ''): ?>
            <p class="error"><?= htmlspecialchars($error, ENT_QUOTES, 'UTF-8') ?></p>
        <?php endif; ?>

        <form method="POST">
            <label for="username">Username</label>
            <input type="text" id="username" name="username"
                   autocomplete="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   autocomplete="current-password" required>

            <button type="submit">Login</button>
        </form>

        <div class="links">
            <p>Don't have an account?
                <a href="register.php">Register here</a>
            </p>
            <a href="index.php">Back to AnimeHub</a>
        </div>
    </main>
</body>
</html>
