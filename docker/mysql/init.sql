DROP DATABASE IF EXISTS posse;
CREATE DATABASE posse;
USE posse;

CREATE TABLE if not exists questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    image VARCHAR(255),
    supplement VARCHAR(255)
);

CREATE TABLE if not exists choices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    valid VARCHAR(255) NOT NULL
);

INSERT INTO questions (id, content, image, supplement) VALUES
    (1, '日本のIT人材が2030年...', 'img-quiz01.png', '経済産業省 2019年3月 － IT 人材需給に関する調査'),
    (2, '既存業界のビジネスと、先進的なテクノロジーを結びつけて生まれた、新しいビジネスのことをなんと言うでしょう？', 'img-quiz02.png', NULL),
    (3, 'IoTとは何の略でしょう？', 'img-quiz03.png', NULL),
    (4, 'サイバー空間とフィジカル空間を高度に融合させたシステムにより、経済発展と社会的課題の解決を両立する、人間中心の社会のことをなんと言うでしょう？', 'img-quiz04.png', 'Society5.0 - 科学技術政策 - 内閣府'),
    (5, 'イギリスのコンピューター科学者であるギャビン・ウッド氏が提唱した、ブロックチェーン技術を活用した「次世代分散型インターネット」のことをなんと言うでしょう？', 'img-quiz05.png', NULL),
    (6, '先進テクノロジー活用企業と出遅れた企業の収益性の差はどれくらいあると言われているでしょうか？', 'img-quiz06.png', 'Accenture Technology Vision 2021');

INSERT INTO choices (id, question_id, name, valid) VALUES
    (1,1,'約28万人',0),
    (2,1,'約79万人',1),
    (3,1,'約183万人',0),
    (4,2,'INTECH',0),
    (5,2,'BIZZTECH',0),
    (6,2,'X-TECH',1),
    (7,3,'internet of Things',1),
    (8,3,'integrate into Technology',0),
    (9,3,'Information on Tool',0),
    (10,4,'Society 5.0',1),
    (11,4,'CyPhy',0),
    (12,4,'SDGs',0),
    (13,5,'Web3.0',1),
    (14,5,'NFT',0),
    (15,5,'メタバース',0),
    (16,6,'約2倍',0),
    (17,6,'約5倍',1),
    (18,6,'約11倍',0);






-- exit
-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse\template-ph2-website> docker compose exec db bash
-- root@e07197474fba:/# ls
-- bin   dev                         entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
-- boot  docker-entrypoint-initdb.d  etc            lib   media  opt  root  sbin  sys  usr
-- root@e07197474fba:/# cd docker-entrypoint-initdb.d
-- root@e07197474fba:/docker-entrypoint-initdb.d# ls
-- Dockerfile  db  init.sql  my.cnf
-- root@e07197474fba:/docker-entrypoint-initdb.d# mysql -u root -p < init.sql
-- Enter password:
-- ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
-- root@e07197474fba:/docker-entrypoint-initdb.d# mysql -u root -p < init.sql
-- Enter password:
-- ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
-- root@e07197474fba:/docker-entrypoint-initdb.d# mysql -u root -p < init.sql
-- Enter password:
-- root@e07197474fba:/docker-entrypoint-initdb.d# mysql -u root -p < init.sql
-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse\template-ph2-website>

-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse> docker compose exec db bash
-- no configuration file provided: not found
-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse> cd .\template-ph2-website\
-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse\template-ph2-website> docker compose exec db bash
-- root@e07197474fba:/# mysql -u root -p
-- Enter password: 
-- Welcome to the MySQL monitor.  Commands end with ; or \g.
-- Your MySQL connection id is 11
-- Server version: 8.0.34 MySQL Community Server - GPL

-- Copyright (c) 2000, 2023, Oracle and/or its affiliates.

-- Oracle is a registered trademark of Oracle Corporation and/or its
-- affiliates. Other names may be trademarks of their respective
-- owners.

-- Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

-- mysql> use posse
-- Reading table information for completion of table and column names
-- You can turn off this feature to get a quicker startup with -A

-- Database changed
-- mysql> show tables;
-- +-----------------+
-- | Tables_in_posse |
-- +-----------------+
-- | choices         |
-- | questions       |
-- +-----------------+
-- 2 rows in set (0.00 sec)

-- mysql> select*from questions
--     -> ;
-- +----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------+
-- | id | content                                                                                                             
--                                                                                                                     | image          | supplement                                  |
-- +----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------+
-- |  1 | 日本のIT人材が2030年...                                                                                             
--                                                                                                                     | img-quiz01.png | 経済産業省 2019年...                        |
-- |  2 | 既存業界のビジネスと、先進的なテクノロジーを結びつけて生まれた、新しいビジネスのことをなんと言うでしょう？          
--                                                                                                                     | img-quiz02.png | NULL                                        |
-- |  3 | IoTとは何の略でしょう？                                                                                             
--                                                                                                                     | img-quiz03.png | NULL                                        |
-- |  4 | サイバー空間とフィジカル空間を高度に融合させたシステムにより、経済発展と社会的課題の解決を両立する、人間中心の社会のことをなんと言うでしょう？                                                                                          | img-quiz04.png | Society5.0 - 科学技術政策 - 内閣府          |
-- |  5 | イギリスのコンピューター科学者であるギャビン・ウッド氏が提唱した、ブロックチェーン技術を活用した「次世代分散型インターネット」のことをなんと言うでしょう？                                                                              | img-quiz05.png | NULL                                        |
-- |  6 | 先進テクノロジー活用企業と出遅れた企業の収益性の差はどれくらいあると言われているでしょうか？                        
--                                                                                                                     | img-quiz06.png | Accenture Technology Vision 2021            |
-- +----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------+
-- 6 rows in set (0.00 sec)

-- mysql> select*from choices;
-- +----+--------------------+---------------------------+---------------------+
-- | id | first_choices      | second_choices            | third_choices       |
-- +----+--------------------+---------------------------+---------------------+
-- |  1 | 約28万人           | 約79万人                  | 約183万人           |
-- |  2 | INTECH             | BIZZTECH                  | X-TECH              |
-- |  3 | Internet of Things | Integrate into Technology | Information on Tool |
-- |  4 | Society 5.0        | CyPhy                     | SDGs                |
-- |  5 | Web3.0             | NFT                       | メタバース          |
-- |  6 | 約2倍              | 約5倍                     | 約11倍              |
-- +----+--------------------+---------------------------+---------------------+
-- 6 rows in set (0.00 sec)

-- mysql>
-- PS C:\Users\mi3mi\OneDrive\デスクトップ\ph2\posse\template-ph2-website>