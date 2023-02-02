-- SQLBook: Code
CREATE DATABASE holidays;

SHOW CREATE PROCEDURE insert_packages;


DROP PROCEDURE IF EXISTS insert_packages;
USE holidays;

DROP TABLE IF EXISTS packages;
DROP TABLE IF EXISTS departure_cities;

CREATE TABLE departure_cities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(100) NOT NULL
);

CREATE TABLE packages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  departure_city_id INT NOT NULL,
  destination VARCHAR(100) NOT NULL,
  hotel VARCHAR(100) NOT NULL,
  departure_date DATE NOT NULL,
  arrival_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  imageURL VARCHAR(255),
  description TEXT(65535),
  number_of_stars INT,
  FOREIGN KEY (departure_city_id) REFERENCES departure_cities(id)
);

DELIMITER $$
CREATE PROCEDURE insert_packages (IN p_destination VARCHAR(255), IN p_hotel VARCHAR(255), IN p_imageURL VARCHAR(500), IN p_description TEXT(65535), IN p_number_of_stars INT)
BEGIN
DECLARE v_departure_city_id INT;
  DECLARE v_date DATE;
  DECLARE v_price INT;
  SELECT id INTO v_departure_city_id FROM departure_cities ORDER BY RAND() LIMIT 1;
  SET v_date = '2023-01-01';
  WHILE v_date < '2024-01-01' DO
    SET v_price = FLOOR(800 + (RAND() * (2000 - 800 + 1)));
    INSERT INTO packages (departure_city_id, destination, hotel, departure_date, arrival_date, price, imageURL, description, number_of_stars) 
    VALUES (v_departure_city_id, p_destination, p_hotel, v_date, DATE_ADD(v_date, INTERVAL 8 DAY), v_price, p_imageURL, p_description, p_number_of_stars); 
    SET v_date = DATE_ADD(v_date, INTERVAL 9 DAY);
  END WHILE;
END
DELIMITER ;


SHOW PROCEDURE STATUS;

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Hm Playa Del Carmen', 'https://www.hmplayadelcarmen.com/wp-content/uploads/1739/1694/nggallery/home//10-HM-Playa-del-Carmen-Shoot2-10.jpg', 'This hotel is located in Playa del Carmen, in the Quintana Roo region, 100 meters from Quinta Avenida and 200 meters from the beach. The HM Playa del Carmen offers an outdoor pool, terrace and cafeteria.

The rooms feature a flat-screen TV and a private bathroom with shower.

There are several stores.

The hotel provides car rental service. HM Playa del Carmen is 1 km from ADO International Bus Station and 1.2 km from Playa del Carmen''s maritime terminal. Cozumel International Airport is 20 km away.

Our guests say this part of Playa del Carmen is their favorite, according to independent reviews.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Bluebay Grand Esmeralda', 'https://www.hmplayadelcarmen.com/wp-content/uploads/1739/1694/nggallery/home//10-HM-Playa-del-Carmen-Shoot2-10.jpg', 'This upscale hotel is 5 miles from the Maroma Adventures activity center, 5 miles from El Manglar golf course and 6 miles from Punta Esmeralda.


Modern rooms feature balconies, flat-screen TVs, pay Wi-Fi, sitting areas, desks, minibars and coffeemakers. Superior options include ocean views. Suites have separate living rooms and whirlpool tubs. Room service is available.

The hotel offers free parking and buffet breakfast, and has a private beach, 4 restaurants, a simple sports bar, 3 outdoor pools, a hot tub, a children''s pool, 2 tennis courts, golf course, fitness center and spa.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Grand Bahia Principe Tulum', 'https://www.bahia-principe.com/content/image/g/1418275512449/tulum-carrusel-despues-del-video.jpg', 'This luxury beach resort is 5 km from Akumal Beach and Aktun Chen Natural Park, and 11 km from the underwater caverns of Dos Ojos Cenote.


Functional rooms feature free Internet access, flat-screen TV, coffeemaker, iron, minibar, balcony and, in some cases, sofa bed and views of the garden, pool or sea.

Breakfast is complimentary, as well as 3 dinners per week in one of the 4 restaurants. There is also a swimming pool with 3 Jacuzzis, a children''s pool, a water park and water activities with dolphins (for a supplement), as well as a private beach with cabanas, a spa with massages and Mayan treatments, live shows, a casino and 9 bars.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Grand Bahia Principe Coba', 'https://www.bahia-principe.com/content/image/g/1418245983097/resort-coba.jpg', 'This all-inclusive resort faces a white-sand Caribbean beach, 2 km from the Riviera Maya Golf Club and 7 km from the Xel-Ha archaeological site.

The simple suites feature whirlpool tubs, flat-screen TVs, minibars, sofa beds and Internet access (surcharge). Room service is available 24 hours a day.

The resort has 11 restaurants and bars, beach access, spa, hot tubs, fitness center, 2 outdoor pools, water park, children''s play area and entertainment program.', 5);


INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Breathless Riviera Cancun Resort Spa', 'https://static11.com-hotel.com/uploads/hotel/14640/photo/breathless-riviera-cancun-resort-spa-adults-only-all-inclusive_163388361814.jpg', 'This upscale adults-only, all-inclusive resort overlooking the Caribbean Sea sits on lush grounds next to a beach, 20 km from Cancun''s international airport.


Modern suites feature a balcony or terrace, free Wi-Fi, flat-screen TVs and minibars. Superior suites have ocean views and, in some cases, access to the pool, living room, kitchen or oceanfront location. Club rooms include a private pool, whirlpool tub or lounge access.

The resort includes meals, beverages and activities such as kayaking and snorkeling as complimentary extras. There are 10 restaurants, 9 bars, 3 outdoor pools, 35-person hot tub, beach volleyball court and spa.', 5);
INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Barcelo Maya Grand Resort', 'https://static.barcelo.com/content/dam/bhg/master/es/hoteles/mexico/riviera-maya/barcelo-maya-riviera/galeria/spa/BMAYAGR_HEAL_61.jpg.bhgimg.stripe2000.jpg/1604637670558.jpg', 'This upscale adults-only, all-inclusive resort overlooking the Caribbean Sea sits on lush grounds next to a beach, 20 km from Cancun''s international airport.

Modern suites feature a balcony or terrace, free Wi-Fi, flat-screen TVs and minibars. Superior suites have ocean views and, in some cases, access to the pool, living room, kitchen or oceanfront location. Club rooms include a private pool, whirlpool tub or lounge access.

The resort includes meals, beverages and activities such as kayaking and snorkeling as complimentary extras. There are 10 restaurants, 9 bars, 3 outdoor pools, 35-person hot tub, beach volleyball court and spa.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Barcelo Maya Palace', 'https://static.barcelo.com/content/dam/bhg/master/es/hoteles/mexico/riviera-maya/barcelo-maya-palace/gallery/reuniones-y-eventos/BMAYAP_CONV_21.jpg.bhgimg.stripe1900.jpg/1604625965269.jpg', 'This all-inclusive resort is on a white-sand beach 2 km from Cenote Azul, a swimming cave, and 4 km from the Dolphin Discovery Riviera Maya water park.

The modern, cozy suites feature free Wi-Fi, flat-screen TVs, minibars, balconies and sitting areas. Superior suites include a separate bedroom. Room service is available 24 hours a day.

The hotel includes meals and drinks served at 6 bars and restaurants, including Brazilian and French cuisine options. There are 2 swimming pools, children''s water park, discotheque, shopping center, spa, gym, beach and tennis court. It offers activities such as water sports, volleyball and dance classes.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Iberostar Paraiso Lindo All Inclusive', 'https://apiimg.iberostar.com/uploads/image/61618/crops/16:9/1920/image.jpeg', 'This lively all-inclusive resort is set amidst a sprawling complex of Spanish colonial-style buildings, next to a beach on the Caribbean Sea, 1 km from Highway 307 and 10 km from Dolphin Discovery Playa del Carmen''s marine life.
Highway 307 and 10 km from the marine life of Dolphin Discovery Playa del Carmen.

Bright, airy rooms with balconies offer free Wi-Fi, flat-screen TVs, minibars, tea and coffeemakers. Upgraded rooms may include a guest area or outdoor whirlpool tub. Suites include separate living room. Room service is available 24 hours a day, every day.

Inclusive meals and beverages are served at 5 restaurants, as well as poolside and beachfront bars. Sports facilities include a golf course and tennis courts. There is also a spa and fitness center.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Dreams Sapphire Resort Spa', 'https://static11.com-hotel.com/uploads/hotel/14629/photo/dreams-sapphire-resort-spa_163494923011.jpg', 'This upscale, all-inclusive beach resort is 2.7 km from Croco Cun Zoo and 10 km from Marina La Bonita Marina.

Spacious, refined rooms feature a terrace, whirlpool tub, minibar, flat-screen TV and free Wi-Fi. Superior options offer ocean views, a terrace with whirlpool tub and access to a private adults-only pool area.

The resort has 5 a la carte restaurants, buffet restaurant, steakhouse, cafeteria and 5 bars (two of them at the pools). There are 2 outdoor pools, kids club, teen club, family entertainment program and activities such as kayaking and snorkeling.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Mexico', 'Grand Palladium White Sand', 'https://www.palladiumhotelgroup.com/content/dam/palladium/content-fragments/hoteles/es/grand-palladium-white-sand-resort-&-spa/galer%C3%ADa/im%C3%A1genes/hotel/Grand-Palladium-White-Sand-Resort-Spa_Vista-a%C3%A9rea-de-la-piscina-principal.jpg.transform/rendition-sm/image.jpg', 'This exclusive all-inclusive resort is surrounded by landscaped gardens and lakes, on a private beach in the Riviera Maya, 14 km from the Dolphin Discovery dolphinarium in Tulum-Akumal and 87 km from Cancun International Airport. Tulum-Akumal and 87 km from Cancun International Airport.

The suites are bright and feature a furnished balcony, sophisticated living area with sofa bed, free Wi-Fi, flat-screen TV, minibar and whirlpool tub. The adults-only, lakeside bungalows include thatched roofs, sitting areas and private jetties with canoes.

The resort serves complimentary meals and drinks at 14 restaurants and 21 bars. There are 7 swimming pools, a fitness center, spa, miniature golf, disco and kids'' club.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Memories Varadero Beach Resort', 'https://www.memoriesresorts.com/assets/images/memories/Memories-Varadero/Gallery/Entertainment/IMG_1444-copia.jpg', 'Located on one of the most beautiful beaches in Varadero, Memories Varadero Beach Resort is the ideal destination for a romantic getaway or an exciting family vacation. Take in the stunning views of sparkling pools, blue skies, and turquoise Caribbean waters which complement the lush gardens and tropical foliage surrounding the resort.

Spacious guestrooms and suites feature deluxe amenities are available in a variety of categories perfect for couples, solo travelers, and families alike. For those seeking an exclusive vacation experience, Memories Varadero offers a Diamond Club™ package featuring premium services and amenities.

Guests can enjoy a variety of all-inclusive amenities and services for an incredible vacation experience. Choose from an extensive collection of global cuisines at our international buffet, 9 restaurants, and 9 bars. Whether you wish to fill your days with non-stop action, or lounge by the pool with a refreshing cocktail, Memories Varadero ensures the perfect vacation for travelers of all types.   ', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Meliá Peninsula Varadero', 'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/bf/79387/1ca7868676c5c4de8cb3d82d85c2390c-1643729475.jpg', 'Meliá Península Varadero provides the perfect atmosphere for an unforgettable stay with your family or partner. A Key West colonial-style resort with all the facilities required for a magnificent holiday in Varadero, alongside the most famous beach in Cuba.

The Meliá Península Varadero Hotel is ideal for an unforgettable stay with the family, or together with your friends or your partner. It has several swimming pools which are perfect for enjoying life outdoors, as well as fantastic dining options. Kids will love the lively Miniclub and the special rooms designed for families.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Sol Sirenas Coral', 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_470,q_auto,w_805/uploadimages/22/73/22737670.jpeg', 'The Sol Sirenas-Coral Hotel, in Cuba''s world-famous beach resort of Varadero, is an excellent option to spend your vacations with you family, for couples or groups, cultural trips and individual tourism. The establishment resulted from the merge of the hotels Sol Club Coral and Sol Club Las Sirenas. It is located on the best beach strip in Cuba''s main coastal resort. The hotel benefits from its proximity to the Plaza America Commercial and Convention Center and the Varadero Golf Club, which is the best golf course in Cuba.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Be Live Experience Tropical', 'https://static11.com-hotel.com/uploads/hotel/51385/photo/labranda-varadero-resort_15565268305.jpeg', 'The Be Live Experience Tropical is distributed in two areas, in the Main Building you will find 319 rooms distributed in 5 Floors and the Beach Club area 124 Rooms distributed in 5 Bungalows, all have terraces with beautiful views of the sea and tropical gardens, in the Main building we have at your disposal 31 Junior Suites.

Facilities include a reception area open 24 hours, a tourist office, a currency exchange service, a lift, a hairdresser and massage area (with extra charge) and a souvenir shop.

We have Buffet Restaurants and Bars distributed in the different areas of the hotel where you can find food and drinks available 24 hours a day. In addition to Restaurants of Gastronomic Specialties (They require previous reservation)

Every day you can participate in different recreational activities in the pool area and the beach, and every night, we have varied shows for the whole family in our Main Theater.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Valentin El Patriarca Varadero', 'https://www.valentinhotels.com/data/webp/valetinelpatriarca688.jpg-3030fbe2ca615080c32d27b63f035574.webp', 'Valentin El Patriarca Varadero is a five-star resort for adults only (+16 years old) located in front of the paradisiacal beach of Varadero, surrounded by large green areas, including the legendary "Patriarca" cactus with more than 500 years of history. The hotel has exclusive rooms, as well as a wide range of services including themed restaurants, Despacio Spa Centre and Privilege service.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Paradisus Varadero', 'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/c3/50212/19502a70b11ca972fbb967c54b359e37-1606831486.jpg', 'The perfect combination of an endless beach and an exceptional natural environment is made even more attractive by all the benefits of this eco-resort, ideal for couples, groups of friends and families. In addition to the delicious and varied cuisine and an excellent entertainment programme, we invite you to discover all the benefits of the exclusive The Reserve service or the intimate Royal Service experience.

This attractive all-inclusive ecoresort and spa boasts a privileged location in a beautiful beach area in Varadero, and is the perfect choice for a unique vacation in Cuba. It provides a magnificent The Reserve area, with preferential services and facilities for families, and a Royal Service area designed for adults only. Paradisus Varadero Resort & Spa provides extraordinarily comfortable Suites and Junior Suites with free Wi-Fi, exquisite cuisine, spaces for weddings and meetings, a YHI Spa and numerous life-enriching activities.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Royalton hicacos resort spa', 'https://marriott.cdn.tambourine.com/royalton-resorts/media/royalton-hicacos_aerials_19_lr-62bcaf6f31ef7-optimized.jpg', 'Nestled on the white-sand shores of Varadero, Royalton Hicacos Resort & Spa offers discerning travelers an unforgettable all-inclusive experience in Cuba. Combining the island''s charming culture with exceptional service and incredible attention to detail, Royalton Hicacos is a cut above the rest with its all-inclusive resort facilities designed to create the perfect ambience for relaxation.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Melia Las Americas', 'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/98/79734/d7d0d29ea1824254b81a43cc35c2cfc8-1643802451.jpg', 'Meliá Las Américas es el único hotel que ofrece acceso directo al Varadero Golf Club. Un resort ideal para los amantes de este deporte en primera línea de playa, con exclusivos servicios The Level y ambiente Solo Adultos ideal para relajarse.

Si te apasionan el golf y el mar esta es una elección perfecta. Disfruta de las bondades de este hotel 5 estrellas Todo Incluido y la tranquilidad que ofrecen sus atmósferas de Solo Adultos (+ 18). El resort ofrece acceso directo al Varadero Golf Club, exquisitas habitaciones con vistas al mar y al campo de golf, variada gastronomía y servicio exclusivo The Level en planta independiente. Magnífica opción para deportistas, parejas y grupos de amigos.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Blau Varadero', 'https://www.blau-varadero.com/cache/93/fe/93fe25d0500570acb4cd24687da07c7e.jpg', 'Blau varadero is one of the best resorts in Cuba. This adults-only hotel is the perfect place to enjoy an exceptional vacation in a unique setting in Varadero.

The 13 miles of white sand found on Varadero beach counts for just one of the many activities you can enjoy on your adults-only vacation in Cuba. At the blau varadero hotel you will enjoy a fun and pleasant stay with other like-minded adults, along with our all-inclusive service, spa & wellness center, sea view rooms, water sports and much more.

The Select rooms and suites at the all-inclusive blau varadero hotel are the ideal choice of accommodation in Varadero Beach. Discover everything that awaits you in these spacious rooms which feature unparalleled sea views, bathrobes & slippers, air conditioning, premium amenities, a mini bar that is replenished on a daily basis.

Cuisine has a special place at our hotel along Varadero Beach. We offer 4 restaurants (Flamboyán Buffet Restaurant, Grill, Palma Real, Las Adelfas Restaurant) and 5 bars (Orquídea Lobby Bar, a Piano Bar, Chill Out Bar, Pool Bar and Beach Bar) where you can try different specialties amongst an exquisite setting.

Relax, enjoy the entertainment and have fun! blau varadero is ideal for couples and groups of friends. The spa is the perfect place to take care of your wellbeing with its sauna, gym and Jacuzzi, in addition to the tennis courts and numerous water sports we offer.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Cuba', 'Iberostar Tainos', 'https://apiimg.iberostar.com/uploads/image/61618/crops/16:9/1920/image.jpeg', '4-star, all-inclusive resort located in Varadero, surrounded by beautiful tropical landscapes that invite relaxation and enjoyment. It offers excellent gastronomy, comfortable rooms, personalized service with a massage menu, a wide range of recreational activities and for golf lovers, just 7 km from the hotel there is a large 18-hole golf course. Recommended for families, couples, weddings and honeymoons, golf and incentives.', 4);


INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Grand Bahia Principe Punta Cana', 'https://www.bahia-principe.com/content/image/g/1418249516379/bp-turquesa-thingstodo-1.jpg', 'This all-inclusive resort, which occupies an extensive beachfront site, is located 23 km from the Bavaro Adventure Park, where extreme sports can be practiced, and 28 km from the Punta Cana International Airport.
Punta Cana International Airport.

The bright suites feature a balcony or terrace, flat-screen TV, free minibar, coffeemaker, kettle, sofa bed, whirlpool tub, and Wi-Fi (surcharge).

The resort includes free extras such as meals, kids club, shows, nightclub access, and sports activities at all resort hotels (kayaking and scuba diving on a limited basis). There is a private beach, spa, children''s water park, outdoor pools and hot tubs.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Luxury Bahia Principe Esmeralda', 'https://www.bahia-principe.com/content/image/g/1418244761239/esmeralda-aerial.jpg', 'This luxury all-suite, all-inclusive resort on Arena Gorda Beach is a 14-minute walk from Punta Blanca Golf Club and 14 km from Dolphin Island Park.


The suites are elegant and feature canopy beds, minibars, free Wi-Fi, flat-screen TVs, whirlpool tubs, coffeemakers, tea/coffee makers and balconies or terraces. Room service and 24-hour butler service are available.

The resort includes meals and drinks served in 6 restaurants and 8 bars, non-motorized water sports and bicycle loan. There are 2 swimming pools, gym, kids club, water park and spa with beauty treatments and massages.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Luxury Bahia Principe Fantasia Don Pablo Collectio', 'https://www.bahia-principe.com/content/image/1418241908206/otro/bahia-principe-fantasia-noche-1.jpg', 'This sprawling, all-inclusive, fairy-tale-inspired resort is a 4-minute walk from Arena Gorda Beach and 27 km from Punta Cana International Airport.


Suites are simple and feature a balcony or terrace, free Wi-Fi, flat-screen TV, minibar, kettle, coffeemaker, sofa bed and whirlpool tub. In-room catering, 24-hour turndown service, turndown service and butler service are offered.

The resort serves complimentary dining and has 6 restaurants, 6 bars, access to restaurants in adjacent facilities, fitness center, spa, water sports, 2 swimming pools, water park, and children''s and youth clubs.', 5);


INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Garden Suites By Melia', 'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/04/69591/ec43a7de67f5438faa473685b05e17cf-1637829926.jpg?', 'This impressive resort is located in Punta Cana and has direct access to a private beach area. It also features a large spa available for a supplement and a large outdoor pool with waterslides.

The suites at Garden Suites by Meliá - All inclusive are elegantly decorated and feature a private terrace, a full minibar and a 2-person Jacuzzi®. The suites are equipped with a sofa bed. Family suites are available.

The Garden Suites by Meliá - All inclusive is home to 11 restaurants and has a variety of activities for children and adults. This resort has a children''s club and offers yoga or pilates classes, among others. It also has a casino.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Lopesan Costa Bavaro Resort Spa & Casino', 'https://www.lopesan.com/img/hotels/5598/494-1000-vista-aerea-lopesan-costa-bavaro-resort-spa-casino-punta-cana.jpg', 'This all-inclusive resort is a 1-minute walk from white-sand Playa Bávaro, 2 miles from Dolphin Island Park, where you can snorkel with dolphins, and 17 miles from Punta Cana International Airport.
Punta Cana International Airport.

The 1036 spacious and refined suites feature free Wi-Fi, flat-screen TV, minibar, kettle, coffee maker, terrace with garden, pool or ocean views, and, in some cases, direct pool access. Superior suites are available for adults only.

The resort offers complimentary extras such as meals, drinks and entertainment. There are 7 outdoor pools, 4 bars, 8 fine restaurants (one specializing in Italian cuisine), casino, spa, gym, kids club and event space.', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Falcons Resort By Melia, All Suites Punta Cana', 'https://www.bahia-principe.com/content/image/g/1418249516379/bp-turquesa-thingstodo-1.jpg', 'Enjoy a five-star, all-inclusive getaway to satisfy your every whim. From dazzling beaches and the most comfortable pools to immersive entertainment and world-class dining, your stay (and your story) is entirely up to you. Come live a new reality.

Falcon''s Resort by Meliá - All Suites Punta Cana seamlessly blends the hospitality and facilities of a world-class beach resort with extraordinary leisure experiences for everyone in a casual yet sophisticated way. Discover the vibrant and exceptional dining, shopping and entertainment offerings, and explore Katmandu Park, an immersive theme park offering rides, endless thrills and new adventures. A resort that will elevate every moment of your vacation beyond your expectations, it''s time to feel, vibrate and be amazed by a unique entertainment experience!', 5);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Whalabávaro', 'https://www.whalabavaro.com/wp-content/uploads/sites/1699/nggallery/fotos-galeria/WHALA_BAVARO_031.jpg', 'This all-inclusive hotel, housed in several colorful buildings, is located on Bávaro''s beachfront, 5 km from Cocotal Golf and Country Club and 7 km from Manati Park.

Bright, functional rooms feature free Wi-Fi, flat-screen TVs, minifridges, furnished terraces or balconies and, in some cases, beach views.

The hotel has 2 buffet restaurants, a refined restaurant, 4 bars (one of them on the beach), 5 outdoor pools, gym and private beach area with sun loungers.', 3);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Vik Hotel Arena Blanca', 'https://lh3.googleusercontent.com/9ljwc-ithDIe7NfvcQAV1IsMUqDqXgD8KtXLTyIwgB4auGLWWpzdDQilnFD98yWz4aOhAiIvgpGZ6a8RrQlXjw', 'This informal all-inclusive resort, surrounded by palm trees and overlooking the Atlantic Ocean, is located in Playa Bávaro, 9 km from Dolphin Island Park and 27 km from Punta Cana International Airport.
Punta Cana International Airport.

Functional rooms feature a balcony or terrace, cable TV and mini-fridge. Superior rooms and suites have ocean views or sofa beds.

The resort offers free services such as parking, food and beverages, and water sports such as kayaking. There''s an Italian restaurant, a buffet, 3 bars (one of them beachfront), outdoor lagoon-style pool, casino, spa, fitness center, 2 tennis courts and practice green.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Vista Sol Punta Cana Beach Resort', 'https://static-resources-elementor.mirai.com/wp-content/uploads/sites/256/home-img-welcome.jpg', 'This all-inclusive luxury resort, set in landscaped gardens overlooking Bávaro Beach, is 2.5 miles from Dolphin Island Park, 2.5 miles from Cocotal Golf and 12 miles from the Punta Cana International Airport.
Punta Cana International Airport.

Bright rooms decorated in a colonial style have balconies, flat-screen TVs, Wi-Fi (for a surcharge), minifridges, coffeemakers and, in some cases, ocean or pool views. There are options with sofa beds and 2-story layouts. Suites include access to a private beach.

The resort has 5 restaurants, 3 swimming pools, discotheque, entertainment area, kids club and spa. It offers water sports, tennis courts, miniature golf and free shuttle service around the area.', 4);

INSERT INTO departure_cities (city) VALUES ('Paris'), ('Nice'), ('Lyon');

CALL insert_packages('Dominican Republic', 'Ocean Blue & Sand Beach Resort', 'https://cmspro.h10hotels.com/ImagenesHotel/OBS.jpg', 'This all-inclusive luxury resort is located right on the beach, 1.5 miles from the Marinarium aquarium and 1.5 miles from Cocotal Golf and Country Club.

Functional, spacious suites feature minibars, flat-screen TVs with premium channels, living rooms with sofa beds, whirlpool tubs in the bathroom, and, in some cases, iPod docking stations and free Wi-Fi. Superior suites, on 2 levels, include a terrace with whirlpool tub.

The resort includes meals and drinks, served in 8 restaurants and 4 bars. There are 2 outdoor pools, 2 hot tubs, a dive center, fitness center, casino, spa and kids'' club.', 5);