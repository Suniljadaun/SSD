USE lab2;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER //

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT s.Title, w.WatchTime
    FROM WatchHistory w
    JOIN Shows s ON s.ShowID = w.ShowID
    WHERE w.SubscriberID = sub_id;
END //

DELIMITER ;
