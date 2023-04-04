CREATE DATABASE Office;
USE Office;

-- buildings Table 생성 후 데이터 입력
CREATE TABLE buildings (
	building_no INT NOT NULL AUTO_INCREMENT, 
    building_name VARCHAR(255) NOT NULL,
	address VARCHAR(355) NOT NULL,
	PRIMARY KEY (building_no)
) CHARSET = utf8mb4;

INSERT INTO buildings(building_name, address)
VALUES("ACME Headquaters", "3950 North 1st Street CA 95134");
INSERT INTO buildings(building_name, address)
VALUES("ACME Sales", "5000 North 1st Street CA 95134");

-- rooms Table 생성 후 데이터 입력
CREATE TABLE rooms(
	room_no INT NOT NULL AUTO_INCREMENT, 
    room_name VARCHAR(255) NOT NULL, 
    building_no INT NOT NULL,
	PRIMARY KEY (room_no),
	KEY building_no(building_no), 
    CONSTRAINT rooms_ibfk_1
    FOREIGN KEY(building_no) REFERENCES buildings (building_no) 
    ON DELETE CASCADE
) CHARSET = utf8mb4;

INSERT INTO rooms(room_name, building_no) VALUES("Amazon", 1);
INSERT INTO rooms(room_name, building_no) VALUES("War Room", 1);
INSERT INTO rooms(room_name, building_no) VALUES("Office of CEO", 1);
INSERT INTO rooms(room_name, building_no) VALUES("Marketing", 2);
INSERT INTO rooms(room_name, building_no) VALUES("Showroom", 2);

-- 생성 결과
SELECT * FROM buildings;
SELECT * FROM rooms;

/* room 테이블을 캡처하고, 2번 building을 삭제 한 후에 room 테이 블을 캡처하시오 */
DELETE FROM buildings WHERE building_no = 2;
-- room 결과 확인
SELECT * FROM rooms;
