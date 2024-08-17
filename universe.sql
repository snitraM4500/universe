CREATE DATABASE universe;

\c universe

CREATE TABLE moon(moon_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(60) NOT NULL UNIQUE, description TEXT, is_spherical BOOLEAN);
CREATE TABLE planet(planet_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(60) NOT NULL UNIQUE, has_life BOOLEAN, is_spherical BOOLEAN);
CREATE TABLE planet_type(planet_type_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(60) NOT NULL UNIQUE, description TEXT);
CREATE TABLE star(star_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(60) NOT NULL UNIQUE, age_in_millions_of_years INT, distance_from_earth NUMERIC(8,5));
CREATE TABLE galaxy(galaxy_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(60) NOT NULL UNIQUE, age_in_millions_of_years INT, description TEXT,has_life BOOLEAN);

ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE planet ADD COLUMN planet_type_id INT REFERENCES planet_type(planet_type_id);
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);

INSERT INTO planet_type (name, description) VALUES
('Terrestrial', 'Planets that are primarily composed of silicate rocks or metals.'),
('Gas Giant', 'Large planets composed mostly of hydrogen and helium.'),
('Ice Giant', 'Planets composed mainly of low-boiling-point materials such as water, methane, and ammonia.');

INSERT INTO galaxy (name, age_in_millions_of_years, description, has_life) VALUES
('Milky Way', 13600, 'Our home galaxy', TRUE),
('Andromeda', 10000, 'Nearest major galaxy to Milky Way', FALSE),
('Whirlpool', 2000, 'A grand design spiral galaxy', FALSE),
('Sombrero', 3000, 'Unbarred spiral galaxy', FALSE),
('Pinwheel', 2500, 'Face-on spiral galaxy', FALSE),
('Triangulum', 2600, 'Spiral galaxy', FALSE);

INSERT INTO star (name, age_in_millions_of_years, distance_from_earth, galaxy_id) VALUES
('Sun', 4600, 0.00, 1),
('Alpha Centauri', 4730, 4.37, 1),
('Betelgeuse', 8.5, 642.50, 1),
('Rigel', 8, 863.00, 1),
('Vega', 455, 25.04, 1),
('Sirius', 125, 8.61, 1);

-- Assuming planet_type_id 1 is 'Terrestrial', 2 is 'Gas Giant', and 3 is 'Ice Giant'
INSERT INTO planet (name, has_life, is_spherical, star_id, planet_type_id) VALUES
('Earth', TRUE, TRUE, 1, 1), -- Example terrestrial planet
('Mars', FALSE, TRUE, 1, 1),
('Venus', FALSE, TRUE, 1, 1),
('Mercury', FALSE, TRUE, 1, 1),
('Jupiter', FALSE, TRUE, 2, 2), -- Example gas giant
('Saturn', FALSE, TRUE, 2, 2),
('Uranus', FALSE, TRUE, 2, 3), -- Assuming Uranus is considered an Ice Giant for this example
('Neptune', FALSE, TRUE, 2, 3),
('Proxima Centauri b', FALSE, TRUE, 2, 1), -- Hypothetical terrestrial exoplanet
('Gliese 581 c', FALSE, TRUE, 2, 1),
('HD 85512 b', FALSE, TRUE, 2, 1),
('Kepler-452b', FALSE, TRUE, 2, 1), -- Another hypothetical terrestrial exoplanet
('Trappist-1e', FALSE, TRUE, 2, 1),
('GJ 1214 b', FALSE, TRUE, 2, 1),
('CoRoT-7b', FALSE, TRUE, 2, 1),
('Kepler-62f', FALSE, TRUE, 2, 1),
('Kepler-186f', FALSE, TRUE, 2, 1),
('LHS 1140 b', FALSE, TRUE, 2, 1),
('Kepler-442b', FALSE, TRUE, 2, 1),
('Wolf 1061c', FALSE, TRUE, 2, 1),
('Gliese 667 Cc', FALSE, TRUE, 2, 1),
('TRAPPIST-1e', FALSE, TRUE, 2, 1);

INSERT INTO moon (name, description, is_spherical, planet_id) VALUES
('Moon', 'Earth''s only natural satellite', TRUE, 1),
('Phobos', 'Innermost and larger of Mars'' two moons', FALSE, 2),
('Deimos', 'Smaller of Mars'' two moons', FALSE, 2),
('Io', 'Volcanically active moon of Jupiter', TRUE, 5),
('Europa', 'One of Jupiter''s Galilean moons', TRUE, 5),
('Ganymede', 'Largest moon in the Solar System', TRUE, 5),
('Callisto', 'Second-largest moon of Jupiter', TRUE, 5),
('Titan', 'Largest moon of Saturn', TRUE, 6),
('Enceladus', 'Reflective, icy moon of Saturn', TRUE, 6),
('Tethys', 'Mid-sized moon of Saturn', TRUE, 6),
('Dione', 'Slightly smaller than Tethys', TRUE, 6),
('Rhea', 'Second-largest moon of Saturn', TRUE, 6),
('Titania', 'Largest moon of Uranus', TRUE, 8),
('Oberon', 'Outermost major moon of Uranus', TRUE, 8),
('Umbriel', 'Third largest moon of Uranus', TRUE, 8),
('Ariel', 'Fourth largest moon of Uranus', TRUE, 8),
('Miranda', 'Smallest and innermost of Uranus'' five major moons', TRUE, 8),
('Triton', 'Largest moon of Neptune', TRUE, 9),
('Proteus', 'Second largest Neptunian moon', TRUE, 9),
('Nereid', 'Irregular satellite of Neptune', FALSE, 9);