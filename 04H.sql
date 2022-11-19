SELECT B.NAME, COUNT( DISTINCT C.NAME) CNT
FROM
    BEASTS B
    INNER JOIN ENCOUNTERS E on B.ROWI = E.BEAST
    INNER JOIN PLACES P on P.ROWI = E.PLACE
    INNER JOIN CONTINENTS C on C.ROWI = P.CONT
GROUP BY B.NAME
HAVING CNT > 1
ORDER BY B.NAME;