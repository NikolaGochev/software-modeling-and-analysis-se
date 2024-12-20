CREATE FUNCTION GetFullName(@UserId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FullName VARCHAR(100);
    SELECT @FullName = CONCAT(FIRST_NAME, ' ', LAST_NAME)
    FROM [USER]
    WHERE USER_ID = @UserId;

    RETURN @FullName;
END;
SELECT dbo.GetFullName(5) AS FullName;