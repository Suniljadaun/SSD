USE lab2;

DROP PROCEDURE IF EXISTS SendFullWatchReport;

DELIMITER //

CREATE PROCEDURE SendFullWatchReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(100);

    -- Cursor to select all subscribers
    DECLARE sub_cursor CURSOR FOR
        SELECT SubscriberID, SubscriberName
        FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN sub_cursor;

    read_loop: LOOP
        FETCH sub_cursor INTO v_id, v_name;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Header for this subscriber
        SELECT CONCAT('== Report for ', v_name, ' ==') AS Header;

        -- Call Q2 procedure
        CALL GetWatchHistoryBySubscriber(v_id);
    END LOOP;

    CLOSE sub_cursor;
END //

DELIMITER ;
