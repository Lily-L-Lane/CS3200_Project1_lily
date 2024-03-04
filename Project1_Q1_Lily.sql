--Selects farms that have Black Soil, returns 100 farms
SELECT COUNT(*)
FROM Farm
JOIN GeologicalRegion ON Farm.region_id = GeologicalRegion.region_id
JOIN SoilType ON GeologicalRegion.soil_id = SoilType.soil_id
WHERE SoilType.type = 'Black Soil';


