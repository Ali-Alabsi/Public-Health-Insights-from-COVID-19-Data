<?php

include 'db_connection.php';

// تأكد من اتصال قاعدة البيانات
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// تأكد من وجود الجدول والبيانات
$sql = "SELECT * FROM covid_deaths";
$result = $conn->query($sql);

if (!$result) {
    die("Query failed: " . $conn->error);
}

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    echo json_encode(['message' => 'No data found']);
    $conn->close();
    exit;
}

header('Content-Type: application/json'); // تعيين نوع المحتوى كـ JSON
echo json_encode($data);

$conn->close();
?>
