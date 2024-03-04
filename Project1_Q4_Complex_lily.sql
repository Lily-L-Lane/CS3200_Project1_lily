--Returns the farms that grow Wild varieities of plants that are on red soil, limestone soil, or loam soil
SELECT 
    Farm.farm_id,
    Farm.location,
    Crop.Name AS crop_name,
    SoilType.type AS soil_type
FROM 
    Farm
JOIN 
    Crop ON Farm.crop_id = Crop.crop_id
JOIN 
    GeologicalRegion ON Farm.region_id = GeologicalRegion.region_id
JOIN 
    SoilType ON GeologicalRegion.soil_id = SoilType.soil_id
WHERE 
    Crop.Name LIKE '%Wild%'
    AND (SoilType.type = 'Loam Soil' OR SoilType.type = 'Red Soil' OR SoilType.type = 'Limestone Soil');


