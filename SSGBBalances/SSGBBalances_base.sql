-- GameData1
-- Author: michael          
-- DateCreated: 9/13/2022 12:58:25 AM
--------------------------------------------------------------

---------------------- G L O B A L ----------------------------

--Barbs are much more frequent and can level up more
UPDATE GlobalParameters SET Value='4' WHERE Name='BARBARIAN_CAMP_MAX_PER_MAJOR_CIV';
UPDATE GlobalParameters SET Value='2' WHERE Name='BARBARIAN_CAMP_MINIMUM_DISTANCE_ANOTHER_CAMP';
UPDATE GlobalParameters SET Value='5' WHERE Name='BARBARIAN_CAMP_MINIMUM_DISTANCE_CITY';
UPDATE GlobalParameters SET Value='80' WHERE Name='BARBARIAN_TECH_PERCENT';
UPDATE GlobalParameters SET Value='2' WHERE Name='EXPERIENCE_BARB_SOFT_CAP';
UPDATE GlobalParameters SET Value='3' WHERE Name='EXPERIENCE_MAX_BARB_LEVEL';

--Housing is buffed by 1
UPDATE GlobalParameters SET Value='-1' WHERE Name='CITY_HOUSING_LEFT_25PCT_GROWTH';
UPDATE GlobalParameters SET Value='0' WHERE Name='CITY_HOUSING_LEFT_50PCT_GROWTH';
UPDATE GlobalParameters SET Value='-5' WHERE Name='CITY_HOUSING_LEFT_ZERO_GROWTH';

--Can buy land up to 4 tiles away DOESN'T WORK
UPDATE GlobalParameters SET Value='5' WHERE Name='CITY_MAX_BUY_PLOT_RANGE';
--Minimum city range updated to two tiles
UPDATE GlobalParameters SET Value='2' WHERE Name='CITY_MIN_RANGE';

--Refresh Loyalty mechanic
UPDATE GlobalParameters SET Value='-17' WHERE Name='IDENTITY_PER_TURN_FROM_STARVATION';
UPDATE GlobalParameters SET Value='-7' WHERE Name='IDENTITY_PER_TURN_FROM_RELIGION_MISMATCHING_FOUNDED';
UPDATE GlobalParameters SET Value='4' WHERE Name='OWNERSHIP_IDENTITY_PRESSURE_TILE_RADIUS';
UPDATE GlobalParameters SET Value='1' WHERE Name='OWNERSHIP_IDENTITY_PRESSURE_FROM_POP_COUNT';
UPDATE GlobalParameters SET Value='3' WHERE Name='OWNERSHIP_IDENTITY_PRESSURE_FROM_CITY_TO_FOREIGN_CITY';

--National parks give gold and older/different governemnts drastically reduce tourism modifiers
UPDATE GlobalParameters SET Value='1' WHERE Name='NATIONAL_PARK_GOLD_YIELD_PER_TOURISM';
UPDATE GlobalParameters SET Value='5' WHERE Name='TOURISM_CONFLICTING_GOVERNMENT_MULTIPLIER';
--Civs that are behind in tech and civics have easier time catching up
UPDATE GlobalParameters SET Value='-50' WHERE Name='TECH_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';
UPDATE GlobalParameters SET Value='-50' WHERE Name='CIVIC_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';

--Alot more Carbon needed, but more coasts at risk
UPDATE GlobalParameters SET Value='85' WHERE Name='CLIMATE_CHANGE_PERCENT_COASTAL_LOWLANDS';
UPDATE Maps_XP2 SET CO2For1DegreeTempRise = CO2For1DegreeTempRise * 3;

--Civics and Techs in later eras scale exponentially
UPDATE Civics SET Cost = Cost * 2 WHERE EraType = 'ERA_ATOMIC';
UPDATE Technologies SET Cost = Cost * 2 WHERE EraType = 'ERA_ATOMIC';

UPDATE Civics SET Cost = Cost * 3 WHERE EraType = 'ERA_INFORMATION';
UPDATE Technologies SET Cost = Cost * 5 WHERE EraType = 'ERA_INFORMATION';

UPDATE Civics SET Cost = Cost * 5 WHERE EraType = 'ERA_FUTURE';
UPDATE Technologies SET Cost = Cost * 10 WHERE EraType = 'ERA_FUTURE';

UPDATE TechnologyRandomCosts SET Cost = Cost * 10;
UPDATE CivicRandomCosts SET Cost = Cost * 10;

--Refresh Great Works
UPDATE GreatWorks SET Tourism = '8' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
UPDATE GlobalParameters SET Value='6' WHERE Name='TOURISM_BASE_FROM_WONDER';

--Civilian Units don't die from storms, volcanoes are fair game
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_FLOOD_MAJOR';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_FLOOD_1000_YEAR';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_BLIZZARD_CRIPPLING';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_DUST_STORM_HABOOB';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_TORNADO_OUTBREAK';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_HURRICANE_CAT_5';
UPDATE RandomEvent_Damages SET Percentage = '0' WHERE RandomEventType = 'RANDOM_EVENT_NUCLEAR_ACCIDENT_MAJOR';


--Testing Hapiness
UPDATE Happinesses SET MaximumAmenityScore = 9 WHERE HappinessType = 'HAPPINESS_ECSTATIC';
UPDATE Happinesses_XP1 SET IdentityPerTurnChange = -40 WHERE HappinessType = 'HAPPINESS_REVOLT';
UPDATE Happinesses_XP1 SET IdentityPerTurnChange = -12 WHERE HappinessType = 'HAPPINESS_UNHAPPY';
UPDATE Happinesses_XP1 SET IdentityPerTurnChange = -6 WHERE HappinessType = 'HAPPINESS_DISPLEASED';

INSERT OR IGNORE INTO Types
	(Type, Kind)
VALUES ('HAPPINESS_WELOVETHEKING', 'KIND_HAPPINESS');

INSERT OR IGNORE INTO Happinesses
	(HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore, GrowthModifier, NonFoodYieldModifier, RebellionPoints)
VALUES ('HAPPINESS_WELOVETHEKING', 'SSGB_LOC_HAPPINESS_WELOVETHEKING_NAME', '10', 'NULL', '100', '50', '-1');

INSERT OR IGNORE INTO Happinesses_XP1
	(HappinessType, IdentityPerTurnChange)
VALUES ('HAPPINESS_WELOVETHEKING', '40');
