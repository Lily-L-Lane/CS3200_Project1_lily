--returns the average location of farms that have black soil (lattitude)
SELECT AVG(location) AS avg_location
FROM Farm
WHERE region_id IN (
    SELECT Farm.region_id
    FROM Farm
    JOIN GeologicalRegion ON Farm.region_id = GeologicalRegion.region_id
    JOIN SoilType ON GeologicalRegion.soil_id = SoilType.soil_id
    WHERE SoilType.type = 'Black Soil'
);
