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
    first_choices VARCHAR(255) NOT NULL,
    second_choices VARCHAR(255) NOT NULL,
    third_choices VARCHAR(255) NOT NULL
);

INSERT INTO questions (id, content, image, supplement) VALUES
    (1, '日本のIT人材が2030年...', 'img-quiz01.png', '経済産業省 2019年...'),
    (2, '既存業界のビジネスと、先進的なテクノロジーを結びつけて生まれた、新しいビジネスのことをなんと言うでしょう？', 'img-quiz02.png', NULL),
    (3, 'IoTとは何の略でしょう？', 'img-quiz03.png', NULL),
    (4, 'サイバー空間とフィジカル空間を高度に融合させたシステムにより、経済発展と社会的課題の解決を両立する、人間中心の社会のことをなんと言うでしょう？', 'img-quiz04.png', 'Society5.0 - 科学技術政策 - 内閣府'),
    (5, 'イギリスのコンピューター科学者であるギャビン・ウッド氏が提唱した、ブロックチェーン技術を活用した「次世代分散型インターネット」のことをなんと言うでしょう？', 'img-quiz05.png', NULL),
    (6, '先進テクノロジー活用企業と出遅れた企業の収益性の差はどれくらいあると言われているでしょうか？', 'img-quiz06.png', 'Accenture Technology Vision 2021');

INSERT INTO choices (id, first_choices, second_choices, third_choices) VALUES
    (1, '約28万人', '約79万人', '約183万人'),
    (2, 'INTECH', 'BIZZTECH', 'X-TECH'),
    (3, 'Internet of Things', 'Integrate into Technology', 'Information on Tool'),
    (4, 'Society 5.0', 'CyPhy', 'SDGs'),
    (5, 'Web3.0', 'NFT', 'メタバース'),
    (6, '約2倍', '約5倍', '約11倍');


