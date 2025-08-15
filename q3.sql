USE lab2;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_newID INT;

    -- Check if subscriber already exists
    SELECT COUNT(*) INTO v_count
    FROM Subscribers
    WHERE SubscriberName = subName;

    IF v_count > 0 THEN
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    ELSE
        -- Find the next available SubscriberID
        SELECT COALESCE(MAX(SubscriberID), 0) + 1 INTO v_newID
        FROM Subscribers;

        -- Insert new subscriber
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (v_newID, subName, CURDATE());

        SELECT CONCAT('Subscriber "', subName, '" added successfully.') AS Message;
    END IF;
END //

DELIMITER ;


