<?php
$dsn = 'mysql:host=db;dbname=posse;charset=utf8';
$user = 'root';
$password = 'root';

try {
    $dbh = new PDO($dsn, $user, $password);
    // echo 'Connection to DB<br>';

    $sql = 'SELECT * FROM questions';
    $sql1='SELECT*FROM choices';

    // foreach ($dbh->query($sql) as $row) {
    //     echo  $row['id'] ;
    //     echo  $row['content'] ;
    //     echo  $row['supplement'];
    // }

    // foreach ($dbh->query($sql1) as $row) {
    //     echo  $row['question_id'] ;
    //     echo  $row['name'] ;
    //     echo  $row['valid'] ;
    // }

} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>