/*Table Creation Scripts*/
CREATE TABLE  `fuelType` (
  `idfuelType` INTEGER,
  `fuelTypeName` VARCHAR(45) NULL,
  `fuelTypeShortName` VARCHAR(45) NULL,
  PRIMARY KEY (`idfuelType`));

/* Minor improvement to be done here, 
make VehicleMileageUnit as CHECK type with; 
VehicleMileageUnit TEXT CHECK (`VehicleMileageUnit` IN ("km", "mi")) NULL */
CREATE TABLE  `Vehicle` (
  `idVehicle` INTEGER,
  `VehicleName` VARCHAR(45) NULL,
  `VehicleFuel` VARCHAR(45) NULL,
  `VehicleNotes` VARCHAR(45) NULL,
  `VehicleMileageUnit` VARCHAR(45) NULL,
  PRIMARY KEY (`idVehicle`));

CREATE TABLE  `Units` (
  `idUnits` INTEGER,
  `UnitsName` VARCHAR(45) NULL,
  `UnitsShortName` VARCHAR(45) NULL,
  PRIMARY KEY (`idUnits`));

CREATE TABLE  `refuelEntries` (
  `idrefuelEntries` INTEGER,
  `refuelDate` DATETIME NULL,
  `refuelMileage` INT NULL,
  `refuelQty` DOUBLE NULL,
  `refuelType` TEXT CHECK (`refuelType` IN ("Full", "Partial")) NULL,
  `refuelUnitPrice` VARCHAR(45) NULL,
  `refuelAmount` VARCHAR(45) NULL,
  `fuelType_idfuelType` INT NOT NULL,
  `Vehicle_idVehicle` INT NOT NULL,
  `Units_idUnits` INT NOT NULL,
  PRIMARY KEY (`idrefuelEntries`),
  CONSTRAINT `fk_refuelEntries_fuelType`
    FOREIGN KEY (`fuelType_idfuelType`)
    REFERENCES `fuelType` (`idfuelType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_refuelEntries_Vehicle1`
    FOREIGN KEY (`Vehicle_idVehicle`)
    REFERENCES `Vehicle` (`idVehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_refuelEntries_Units1`
    FOREIGN KEY (`Units_idUnits`)
    REFERENCES `Units` (`idUnits`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/*Data Creation Scripts*/
INSERT INTO `units` (`UnitsName`, `UnitsShortName`) VALUES ('Litre', 'l'), ('Gallon', 'gal');
INSERT INTO `fueltype` (`fuelTypeName`, `fuelTypeShortName`) VALUES ('Petrol', 'Petrol'), ('Diesel', 'Diesel');
INSERT INTO `vehicle` (`VehicleName`, `VehicleFuel`, `VehicleNotes`, `VehicleMileageUnit`) VALUES ('Car', '1', 'sample note', 'km');

INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-01 00:00:00', '1234', '10', 'Full', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-02 00:00:00', '1250', '10', 'Partial', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-03 00:00:00', '1300', '10', 'Full', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-04 00:00:00', '1350', '10', 'Partial', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-05 00:00:00', '1400', '10', 'Partial', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-06 00:00:00', '1450', '10', 'Partial', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-07 00:00:00', '1500', '10', 'Full', '370', '3700', '1', '1', '1');
INSERT INTO `refuelentries` (`refuelDate`, `refuelMileage`, `refuelQty`, `refuelType`, `refuelUnitPrice`, `refuelAmount`, `fuelType_idfuelType`, `Vehicle_idVehicle`, `Units_idUnits`) VALUES ('2022-11-08 00:00:00', '1550', '12', 'Full', '370', '4440', '1', '1', '1');
