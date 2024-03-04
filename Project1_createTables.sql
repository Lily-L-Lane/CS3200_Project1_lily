--creates all the tables
CREATE TABLE Owner (
    user_id INT PRIMARY KEY,
    firstName VARCHAR,
    lastName VARCHAR,
    ipAddress VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    farmer_id INT,
    manager_id INT,
    organization_id INT,
    FOREIGN KEY (farmer_id) REFERENCES Farmer(farmer_id),
    FOREIGN KEY (manager_id) REFERENCES FarmManager(manager_id),
    FOREIGN KEY (organization_id) REFERENCES AgriculturalOrganization(organization_id)
);

CREATE TABLE Farmer (
    farmer_id INT PRIMARY KEY
);

CREATE TABLE FarmManager (
    manager_id INT PRIMARY KEY
);

CREATE TABLE AgriculturalOrganization (
    organization_id INT PRIMARY KEY
);

CREATE TABLE IrrigationSolution (
    solution_id INT PRIMARY KEY,
    visualization_id INT,
    information BLOB,
    user_id INT,
    FOREIGN KEY (visualization_id) REFERENCES Visualization(visualization_id),
    FOREIGN KEY (user_id) REFERENCES Owner(user_id)
);

CREATE TABLE Insights (
    insight_id INT PRIMARY KEY,
    insights BLOB,
    user_id INT,
    analyst_id INT,
    FOREIGN KEY (user_id) REFERENCES Owner(user_id),
    FOREIGN KEY (analyst_id) REFERENCES Analyst(analyst_id)
);

CREATE TABLE Analyst (
    analyst_id INT PRIMARY KEY,
    concentration TEXT,
    engineer_id INT,
    specialist_id INT,
    FOREIGN KEY (engineer_id) REFERENCES Bioengineer(engineer_id),
    FOREIGN KEY (specialist_id) REFERENCES EnvironmentalSpecialist(specialist_id)
);

CREATE TABLE EnvironmentalSpecialist (
    specialist_id INT PRIMARY KEY
);

CREATE TABLE Bioengineer (
    engineer_id INT PRIMARY KEY
);

CREATE TABLE Accesses (
    analyst_id INT,
    visualization_id INT,
    FOREIGN KEY (analyst_id) REFERENCES Analyst(analyst_id),
    FOREIGN KEY (visualization_id) REFERENCES Visualization(visualization_id)
);

CREATE TABLE Visualization (
    visualization_id INT PRIMARY KEY,
    image BLOB
);

CREATE TABLE Algorithm (
    algorithm_id INT PRIMARY KEY
);

CREATE TABLE Analyzes (
    algorithm_id INT,
    farm_id INT,
    FOREIGN KEY (algorithm_id) REFERENCES Algorithm(algorithm_id),
    FOREIGN KEY (farm_id) REFERENCES Farm(farm_id)
);

CREATE TABLE Farm (
    farm_id INT PRIMARY KEY,
    factors_id INT,
    region_id INT,
    plant_id INT,
    location VARCHAR, -- Assuming coordinates are stored as a string
    FOREIGN KEY (factors_id) REFERENCES EnvironmentalFactors(factors_id),
    FOREIGN KEY (region_id) REFERENCES GeologicalRegion(region_id),
    FOREIGN KEY (plant_id) REFERENCES Crop(plant_id)
);


CREATE TABLE ProductOf (
    crop_id INT,
    farm_id INT,
    FOREIGN KEY (crop_id) REFERENCES Crop(crop_id),
    FOREIGN KEY (farm_id) REFERENCES Farm(farm_id)
);

CREATE TABLE Crop (
    crop_id INT PRIMARY KEY,
    Name VARCHAR,
    Requirements BLOB,
    health_id INT,
    yield_id INT,
    FOREIGN KEY (health_id) REFERENCES CropHealth(health_id),
    FOREIGN KEY (yield_id) REFERENCES CropYield(yield_id)
);

CREATE TABLE CropHealth (
    health_id INT PRIMARY KEY,
    diseases TEXT,
    health BLOB
);

CREATE TABLE CropYield (
    yield_id INT PRIMARY KEY,
    yield NUMBER
);

CREATE TABLE EnvironmentalFactors (
    factors_id INT PRIMARY KEY,
    coverage_id INT,
    moisture_id INT,
    humidity_id INT,
    time NUMBER, -- Assuming it's a numeric data type
    FOREIGN KEY (coverage_id) REFERENCES RainCoverage(coverage_id),
    FOREIGN KEY (moisture_id) REFERENCES SoilMoisture(moisture_id),
    FOREIGN KEY (humidity_id) REFERENCES Humidity(humidity_id)
);


CREATE TABLE RainCoverage (
    coverage_id INT PRIMARY KEY,
    inchesOfRain NUMBER,
    location VARCHAR -- Assuming coordinates are stored as a string
);

CREATE TABLE SoilMoisture (
    moisture_id INT PRIMARY KEY,
    waterSaturation NUMBER
);

CREATE TABLE Humidity (
    humidity_id INT PRIMARY KEY,
    humidity NUMBER
);

CREATE TABLE GeologicalRegion (
    region_id INT PRIMARY KEY,
    soil_id INT,
    climate_id INT,
    location VARCHAR, -- Assuming coordinates are stored as a string
	FOREIGN KEY (soil_id) REFERENCES SoilType(soil_id),
    FOREIGN KEY (climate_id) REFERENCES Climate(climate_id)
);

CREATE TABLE Climate (
    climate_id INT PRIMARY KEY,
    data VARCHAR
);

CREATE TABLE SoilType (
    soil_id INT PRIMARY KEY,
    type TEXT
);
