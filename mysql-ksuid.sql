DROP FUNCTION IF EXISTS generate_ksuid;
DELIMITER //
CREATE FUNCTION generate_ksuid() RETURNS CHAR(27) NOT DETERMINISTIC
BEGIN
    DECLARE digits CHAR(62) DEFAULT "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    
    DECLARE n DECIMAL(49) DEFAULT UNIX_TIMESTAMP() - 1400000000; -- 8 byte time portion offset per specification.
    DECLARE f DECIMAL(49) DEFAULT 4294967296;
    DECLARE s CHAR(27) DEFAULT "";
    DECLARE i INT DEFAULT 1;

    -- Add in 32 bytes of random data
    SET n = n * f + CAST(RAND() * f AS UNSIGNED); 
    SET n = n * f + CAST(RAND() * f AS UNSIGNED);
    SET n = n * f + CAST(RAND() * f AS UNSIGNED);
    SET n = n * f + CAST(RAND() * f AS UNSIGNED);

    -- Base62 encoding
    WHILE i <= 27 DO
        SET s = CONCAT(SUBSTR(digits, (n MOD 62) + 1, 1), s);
        SET n = FLOOR(n / 62);
        SET i = i + 1;
    END WHILE;

    RETURN s;
    
END//
