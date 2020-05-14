use USAirlineFlights2;
-- 1. Quantitat de registres de la taula de vols
SELECT COUNT(flightID) FROM usairlineflights2.flights
-- 2. Retard promig de sortida i arribada segons l’aeroport origen
SELECT Origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides FROM usairlineflights2.flights
GROUP BY Origin
-- 3. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen.
SELECT Origin, colYear, colMonth, AVG(ArrDelay) FROM usairlineflights2.flights
GROUP BY colMonth, Origin, colYear
ORDER BY Origin ASC, colYear ASC, colMonth ASC
-- 4. mateixa consulta que abans i amb el mateix ordre, però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
SELECT usairports.City, colYear, colMonth, AVG(ArrDelay) FROM usairlineflights2.flights
JOIN usairlineflights2.usairports
ON usairports.IATA = flights.Origin
GROUP BY colMonth, Origin, colYear
ORDER BY usairports.City ASC, colYear ASC, colMonth ASC
-- 5. Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) FROM usairlineflights2.flights
GROUP BY Cancelled, colMonth, colYear, UniqueCarrier
ORDER BY SUM(Cancelled) DESC, UniqueCarrier, colYear ASC, colMonth ASC
GROUP BY UniqueCarrier, colMonth, colYear, Cancelled
-- 6. L’identificador dels 10 avions que més distància han recorregut fent vols
SELECT TailNum, SUM(Distance) FROM flights
GROUP BY TailNum
ORDER BY SUM(Distance) DESC
LIMIT 10
-- 7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts
SELECT UniqueCarrier, AVG(ArrDelay) FROM flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) > 10
ORDER BY AVG(ArrDelay) DESC


