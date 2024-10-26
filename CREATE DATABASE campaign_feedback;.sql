CREATE DATABASE campaign_feedback;

USE campaign_feedback;

CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    feedback TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    submission_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE DATABASE campaign_feedback;

USE campaign_feedback;

CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    feedback TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    submission_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
<?php
$servername = "localhost";
$username = "root"; // Update with your MySQL username
$password = ""; // Update with your MySQL password
$dbname = "campaign_feedback";

// Capture form data
$name = $_POST['name'];
$email = $_POST['email'];
$feedback = $_POST['feedback'];
$rating = $_POST['rating'];

// Create database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Insert data into feedback table
$sql = "INSERT INTO feedback (name, email, feedback, rating) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $name, $email, $feedback, $rating);

if ($stmt->execute()) {
    echo "Feedback submitted successfully!";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "campaign_feedback";

// Create database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve data from feedback table
$sql = "SELECT name, email, feedback, rating, submission_date FROM feedback";
$result = $conn->query($sql);

echo "<h2>Feedback List</h2>";
if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Name</th><th>Email</th><th>Feedback</th><th>Rating</th><th>Submission Date</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['name']}</td><td>{$row['email']}</td><td>{$row['feedback']}</td><td>{$row['rating']}</td><td>{$row['submission_date']}</td></tr>";
    }
    echo "</table>";
} else {
    echo "No feedback available.";
}

$conn->close();
?>


