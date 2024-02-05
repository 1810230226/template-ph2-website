<?php
session_start();

require __DIR__ . '/../../dbconnect.php';
$questions = $dbh->query("SELECT id , content FROM questions")->fetchAll(PDO::FETCH_ASSOC);

if (!isset($_SESSION['id'])) {
    // header('Location: /admin/auth/signin.php');
} else {
    if (isset($_SESSION['message'])) {
    $message = $_SESSION['message'];
    unset($_SESSION['message']);
    }

  $questions = $dbh->query("SELECT * FROM questions")->fetchAll();
    $is_empty = count($questions) === 0;
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $dbh->beginTransaction();

      // 削除する問題の画像ファイル名を取得
        $sql = "SELECT image FROM questions WHERE id = :id";
        $stmt = $dbh->prepare($sql);
        $stmt->bindValue(":id", $_POST["id"]);
        $stmt->execute();
        $question = $stmt->fetch();
        $image_name = $question['image'];

      // 画像ファイルが存在する場合、削除する
        if ($image_name) {
        $image_path = __DIR__ . '/../assets/img/quiz/' . $image_name;
        if (file_exists($image_path)) {
            unlink($image_path);
        }
        }

      // 問題と選択肢をデータベースから削除
        $sql = "DELETE FROM choices WHERE question_id = :question_id";
        $stmt = $dbh->prepare($sql);
        $stmt->bindValue(":question_id", $_POST["id"]);
        $stmt->execute();

        $sql = "DELETE FROM questions WHERE id = :id";
        $stmt = $dbh->prepare($sql);
        $stmt->bindValue(":id", $_POST["id"]);
        $stmt->execute();

        $dbh->commit();
        $_SESSION['message'] = "問題削除に成功しました。";
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    } catch (PDOException $e) {
        $dbh->rollBack();
        $_SESSION['message'] = "問題削除に失敗しました。";
        error_log($e->getMessage());
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    }
}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/style.css">
    <link rel="stylesheet" href="../styles/recet.css">
    <title>index</title>
</head>
<body>
<header class="header">
        <figure>
            <img src="../img/logo.svg" alt="">
        </figure>
        <button>ログアウト</button>
    </header>
    <main class="main">
        <section class="select-tag">
            <ul>
                <li><a href="http://localhost:8080/admin/index.php">ユーザー招待</a></li>
                <li><a href="http://localhost:8080/assets/admin/index.php">問題一覧</a></li>
                <li><a href="http://localhost:8080/assets/admin/questions/create.php">問題作成</a></li>
            </ul>
        </section>
        <section class="quiz">
            <div class="q-word">問題一覧</div>
            <ul class="q-guidance">
                <li>ID</li>
                <li>問題</li>
            </ul>
            <?php for ($i = 0; $i < count($questions); $i++) { ?>
                <ul class="q-select">
                    <li><?= $questions[$i]["id"]; ?></li>
                    <li>
                        <a href=""><?= $questions[$i]["content"]; ?></a>
                    </li>
                    <li><button>削除</button></li>
                </ul>
            <?php } ?>
        </section>
    </main>
    <footer></footer>
</body>
</html>