--calculates average rainfall and waterSaturation for each farm using "partition by"
SELECT
    f.farm_id,
    AVG(rc.inchesOfRain) OVER (PARTITION BY f.farm_id) AS avg_rain_coverage,
    AVG(sm.waterSaturation) OVER (PARTITION BY f.farm_id) AS avg_soil_moisture
FROM
    Farm f
JOIN
    EnvironmentalFactors ef ON f.factors_id = ef.factors_id
JOIN
    RainCoverage rc ON ef.coverage_id = rc.coverage_id
JOIN
    SoilMoisture sm ON ef.moisture_id = sm.moisture_id;

