<?php
$dsn = 'mysql:host=db;dbname=posse;charset=utf8';
$user = 'root';
$password = 'root';

try {
    // データベースに接続
    $dbh = new PDO($dsn, $user, $password);
    echo 'Connection to DB<br>';

    // SQL ステートメント
    $sql = 'SELECT * FROM questions';

    // テーブル内のレコードを順番に出力
    foreach ($dbh->query($sql) as $row) {
        // レコードの各カラムを表示
        echo 'Question ID: ' . $row['question_id'] . '<br>';
        echo 'Question Text: ' . $row['question_text'] . '<br>';
        echo 'Choices: ' . $row['choices'] . '<br>';
        echo '<br>';
    }
} catch (PDOException $e) {
    // 接続エラー時のメッセージ
    echo 'Connection failed: ' . $e->getMessage();
}
?>