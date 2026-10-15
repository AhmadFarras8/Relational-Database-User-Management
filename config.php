<?php
// config.php — database connection (default XAMPP settings)
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_school";

$conn = mysqli_connect($host, $user, $pass, $db);
if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
?>
