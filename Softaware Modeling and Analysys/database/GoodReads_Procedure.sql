CREATE PROCEDURE GetTopRatedBooks
    @TopN INT
AS
BEGIN
    SELECT TOP (@TopN)
        B.BOOK_ID, B.TITLE, B.PUBLISHER, AVG(R.RATING) AS AvgRating
    FROM 
        BOOK B
    JOIN 
        REVIEW R ON B.BOOK_ID = R.BOOK_ID
    GROUP BY 
        B.BOOK_ID, B.TITLE, B.PUBLISHER
    ORDER BY 
        AvgRating DESC;

    PRINT 'Top rated books fetched successfully.';
END;

EXEC GetTopRatedBooks @TopN = 5;
