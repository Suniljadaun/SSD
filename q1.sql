USE lab2;

DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER //

CREATE PROCEDURE ListAllSubscribers()
BEGIN 
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(100);
    
    DECLARE sub_cursor CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN sub_cursor;

    read_loop : LOOP
        FETCH sub_cursor INTO v_name;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;
        SELECT v_name AS SubscriberName;
    END LOOP;

    CLOSE sub_cursor;
END //

DELIMITER ;
