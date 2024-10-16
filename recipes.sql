-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dishes_they_make` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (1,'Sanjeev Kapoor','Butter Chicken, Palak Paneer, Khichdi, Gulab Jamun, Paneer Tikka, Aloo Gobhi'),(2,'Gordon Ramsay','Scrambled Eggs, Lobster Ravioli, Shepherd\'s Pie, Fish & Chips, Chicken Tikka Masala'),(3,'Jamie Oliver','Fish & Chips, Chicken Tikka Masala, Mushroom Risotto, Pasta Carbonara, Prawn Linguine'),(4,'Ranveer Brar','Dal Makhani, Khichdi, Paneer Tikka, Chicken Biryani, Shahi Tukda'),(5,'Vikas Khanna','Dal Makhani, Baked Samosa, Butter Chicken, Pindi Chana, Aloo Gobhi');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'Butter Chicken','Main Course'),(2,'Palak Paneer','Main Course'),(3,'Khichdi','Main Course'),(4,'Gulab Jamun','Dessert'),(5,'Paneer Tikka','Appetizer'),(6,'Scrambled Eggs','Breakfast'),(7,'Lobster Ravioli','Main Course'),(8,'Shepherd\'s Pie','Main Course'),(9,'Fish & Chips','Main Course'),(10,'Chicken Tikka Masala','Main Course'),(11,'Mushroom Risotto','Main Course'),(12,'Pasta Carbonara','Main Course'),(13,'Prawn Linguine','Main Course'),(14,'Dal Makhani','Main Course'),(15,'Chicken Biryani','Main Course'),(16,'Shahi Tukda','Dessert'),(17,'Baked Samosa','Appetizer'),(18,'Pindi Chana','Main Course'),(19,'Aloo Gobhi','Main Course'),(20,'Pizza','Fast Food');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gordon_ramsay_recipes`
--

DROP TABLE IF EXISTS `gordon_ramsay_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gordon_ramsay_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `instructions` text,
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `gordon_ramsay_recipes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gordon_ramsay_recipes`
--

LOCK TABLES `gordon_ramsay_recipes` WRITE;
/*!40000 ALTER TABLE `gordon_ramsay_recipes` DISABLE KEYS */;
INSERT INTO `gordon_ramsay_recipes` VALUES (1,'Scrambled Eggs','Breakfast','3 large eggs, 1 tbsp unsalted butter, 1 tbsp cr├¿me fra├«che, salt to taste, freshly ground black pepper to taste, and chopped chives for garnish.','Crack the eggs into a cold pan and add unsalted butter. Place the pan over medium heat and stir continuously with a spatula, making sure to scrape the bottom of the pan. After 30 seconds, remove the pan from the heat and keep stirring for 10 seconds. Return the pan to the heat and repeat the process until the eggs are softly scrambled. Stir in the cr├¿me fra├«che, season with salt and pepper, and cook for a few more seconds. Garnish with chopped chives and serve immediately on toasted bread.','00:5:00','00:5:00',4.9,6),(2,'Lobster Ravioli','Main Course','1 large lobster (cooked and meat removed), 1 tbsp olive oil, 1 clove garlic (minced), 1 shallot (finely chopped), 2 tbsp mascarpone cheese, 1 tbsp fresh tarragon (chopped), salt to taste, freshly ground black pepper to taste, fresh pasta sheets, 1 egg (beaten, for sealing), and 2 tbsp butter.','Saut├⌐ minced garlic and chopped shallot in olive oil until soft. Add the lobster meat and cook briefly. Remove from heat and stir in mascarpone cheese and chopped tarragon. Season with salt and pepper, then set the mixture aside to cool. Cut fresh pasta sheets into squares or circles, and place a spoonful of lobster filling in the center of each. Brush the edges with beaten egg, fold the pasta over, and seal tightly. Cook the ravioli in boiling salted water for 2-3 minutes until they float to the top. In a separate pan, melt butter and gently toss the cooked ravioli in it. Serve immediately, optionally garnished with additional tarragon or a light sauce.','00:30:00','00:10:00',4.8,7),(3,'Shepherd\'s Pie','Main Course','500g minced lamb, 2 tbsp olive oil, 1 onion (finely chopped), 1 large carrot (diced), 2 cloves garlic (minced), 1 tbsp tomato pur├⌐e, 1 tbsp Worcestershire sauce, 1 tsp thyme leaves, 1 cup chicken or lamb stock, 1 cup red wine (optional), 4 large potatoes (peeled and quartered), 2 tbsp butter, 1/4 cup milk, salt to taste, freshly ground black pepper to taste, and grated cheddar cheese for topping.','Heat olive oil in a pan, add minced lamb, and cook until browned. Add chopped onion, diced carrot, and minced garlic, cooking until softened. Stir in tomato pur├⌐e, Worcestershire sauce, and thyme, cooking for another minute. Pour in red wine (if using) and reduce slightly. Add chicken or lamb stock and simmer for 20 minutes until the sauce thickens. Meanwhile, boil the potatoes until tender, then mash with butter and milk, seasoning with salt and pepper. Transfer the lamb mixture to a baking dish, spread the mashed potatoes over the top, and sprinkle with grated cheddar cheese. Bake in a preheated oven at 200┬░C (392┬░F) for 20-25 minutes, until the top is golden and crisp. Serve hot.','00:20:00','00:45:00',4.7,8),(4,'Fish & Chips','Main Course','4 cod fillets (about 150-200g each), 1 cup all-purpose flour (plus extra for dusting), 1 cup rice flour, 1 tsp baking powder, 1 cup cold sparkling water, salt to taste, freshly ground black pepper to taste, 4 large potatoes (peeled and cut into thick chips), vegetable oil for frying, 1 lemon (cut into wedges), and fresh parsley for garnish.','Start by heating the oil in a deep fryer or large pan to 180┬░C (350┬░F). Rinse and dry the potato chips, then fry them in batches until golden and crispy. Drain on paper towels and season with salt. For the batter, mix all-purpose flour, rice flour, baking powder, salt, and pepper in a bowl. Gradually whisk in cold sparkling water until the batter is smooth. Dust the cod fillets lightly with flour, then dip them into the batter, allowing any excess to drip off. Fry the fish in hot oil for about 4-5 minutes until golden and crispy. Drain on paper towels. Serve the fish and chips hot with lemon wedges and fresh parsley.','00:20:00','00:30:00',4.8,9),(5,'Chicken Tikka Masala','Main Course','500g boneless chicken (cut into cubes), 1 cup plain yogurt, 2 tbsp lemon juice, 2 tbsp garam masala, 1 tbsp ground cumin, 1 tbsp ground coriander, 1 tsp turmeric powder, 1 tsp red chili powder, 4 tbsp vegetable oil, 2 onions (finely chopped), 4 garlic cloves (minced), 1 tbsp ginger (grated), 1 can (400g) chopped tomatoes, 1/2 cup heavy cream, salt to taste, freshly ground black pepper to taste, and fresh coriander leaves for garnish.','Marinate the chicken in yogurt, lemon juice, garam masala, cumin, coriander, turmeric, red chili powder, salt, and pepper for at least 30 minutes, preferably overnight. Heat oil in a large pan, add the marinated chicken, and cook until browned on all sides. Remove the chicken and set aside. In the same pan, saut├⌐ finely chopped onions until golden brown. Add minced garlic and grated ginger, cooking for a minute. Stir in the chopped tomatoes, cook for 10-15 minutes until the sauce thickens, then add the browned chicken back into the pan. Simmer for another 10 minutes. Stir in heavy cream, adjust seasoning, and cook for a few more minutes until the sauce is creamy and the chicken is cooked through. Garnish with fresh coriander leaves and serve hot with rice or naan.','00:30:00','00:40:00',4.6,10);
/*!40000 ALTER TABLE `gordon_ramsay_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jamie_oliver_recipes`
--

DROP TABLE IF EXISTS `jamie_oliver_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jamie_oliver_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `instructions` text,
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `jamie_oliver_recipes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jamie_oliver_recipes`
--

LOCK TABLES `jamie_oliver_recipes` WRITE;
/*!40000 ALTER TABLE `jamie_oliver_recipes` DISABLE KEYS */;
INSERT INTO `jamie_oliver_recipes` VALUES (1,'Fish & Chips','Main Course','4 large cod fillets (about 150-200g each), 4 large potatoes (peeled and cut into thick chips), 1 cup all-purpose flour, 1 tsp baking powder, 1 cup cold sparkling water, 1 lemon (zested and juiced), 1 tbsp chopped fresh parsley, 1 tsp salt, freshly ground black pepper to taste, vegetable oil for frying, and malt vinegar (optional) for serving.','Preheat the oven to 200┬░C (400┬░F). Toss the potato chips in a little olive oil, salt, and pepper, and bake for about 30-40 minutes, turning occasionally until crispy and golden. For the batter, mix all-purpose flour, baking powder, salt, and pepper in a bowl. Gradually whisk in cold sparkling water until smooth. Dust the cod fillets with flour, dip them into the batter, letting any excess drip off. Heat vegetable oil in a deep fryer or large pan to 180┬░C (350┬░F). Fry the fish fillets in batches for 4-5 minutes until golden and crispy. Drain on paper towels. Serve the fish and chips with lemon wedges, fresh parsley, and a splash of malt vinegar if desired.','00:20:00','00:50:00',4.7,9),(2,'Chicken Tikka Masala','Main Course','500g boneless chicken thighs (cut into chunks), 1 cup plain yogurt, 2 tbsp lemon juice, 2 tbsp tikka masala paste, 2 tbsp vegetable oil, 1 large onion (finely chopped), 3 garlic cloves (minced), 1 tbsp ginger (grated), 1 can (400g) chopped tomatoes, 1 cup coconut milk, 1 tbsp garam masala, 1 tsp ground cumin, 1 tsp ground coriander, salt to taste, freshly ground black pepper to taste, and fresh coriander leaves for garnish.','Marinate the chicken in yogurt, lemon juice, and tikka masala paste for at least 30 minutes or overnight. Heat vegetable oil in a large pan, add the marinated chicken, and cook until browned and cooked through. Remove the chicken and set aside. In the same pan, add chopped onion and cook until golden. Add minced garlic and grated ginger, cooking for a minute. Stir in chopped tomatoes, coconut milk, garam masala, cumin, coriander, salt, and pepper. Simmer the sauce for about 10 minutes until thickened. Return the chicken to the pan and simmer for an additional 5-10 minutes. Garnish with fresh coriander leaves and serve hot with rice or naan.','00:20:00','00:40:00',4.5,10),(3,'Mushroom Risotto','Main Course','300g arborio rice, 250g mixed mushrooms (sliced), 1 onion (finely chopped), 2 garlic cloves (minced), 1 cup dry white wine, 1 liter vegetable or chicken stock (heated), 50g Parmesan cheese (grated), 2 tbsp olive oil, 2 tbsp butter, 1 tbsp fresh thyme leaves, salt to taste, freshly ground black pepper to taste, and fresh parsley for garnish.','Heat olive oil and 1 tablespoon of butter in a large pan, add the chopped onion, and cook until softened. Add minced garlic and sliced mushrooms, cooking until the mushrooms are golden and tender. Stir in the arborio rice and cook for a couple of minutes until the rice is slightly translucent. Pour in the white wine and cook until it has mostly evaporated. Begin adding the heated stock, one ladle at a time, stirring frequently until the rice is creamy and cooked al dente. Stir in the remaining butter, grated Parmesan cheese, and fresh thyme leaves. Season with salt and pepper. Garnish with fresh parsley and serve immediately.','00:10:00','00:30:00',4.6,11),(4,'Pasta Carbonara','Main Course','400g spaghetti, 150g pancetta or bacon (diced), 2 large eggs, 100g Parmesan cheese (grated), 2 garlic cloves (minced), 1 tbsp olive oil, salt to taste, freshly ground black pepper to taste, and fresh parsley for garnish.','Cook the spaghetti in salted boiling water according to package instructions until al dente. Meanwhile, heat olive oil in a large pan over medium heat and cook the diced pancetta or bacon until crispy. Add minced garlic and cook for another minute. In a bowl, whisk together eggs and grated Parmesan cheese. Once the spaghetti is cooked, reserve a cup of pasta water and then drain the pasta. Add the hot pasta to the pan with pancetta and garlic. Remove from heat and quickly stir in the egg and cheese mixture, adding a little reserved pasta water to create a creamy sauce. Season with salt and freshly ground black pepper. Garnish with fresh parsley and serve immediately.','00:10:00','00:15:00',4.7,12),(5,'Prawn Linguine','Main Course','300g linguine, 300g large raw prawns (peeled and deveined), 2 tbsp olive oil, 3 garlic cloves (minced), 1 red chili (finely chopped), 1 lemon (zested and juiced), 200g cherry tomatoes (halved), 1/2 cup white wine, 1 tbsp fresh parsley (chopped), salt to taste, freshly ground black pepper to taste, and Parmesan cheese for serving.','Cook the linguine in salted boiling water according to package instructions until al dente. Meanwhile, heat olive oil in a large pan over medium heat. Add minced garlic and chopped chili, and cook for a minute until fragrant. Add the prawns and cook until pink and cooked through. Remove the prawns from the pan and set aside. Add cherry tomatoes and white wine to the same pan, and cook until the tomatoes start to soften and the wine reduces slightly. Return the prawns to the pan, stir in lemon zest and juice, and cook briefly. Drain the linguine and toss it with the prawn mixture. Season with salt and pepper, and garnish with chopped parsley and Parmesan cheese.','00:10:00','00:20:00',4.6,13);
/*!40000 ALTER TABLE `jamie_oliver_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranveer_brar_recipes`
--

DROP TABLE IF EXISTS `ranveer_brar_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranveer_brar_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `instructions` text,
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `ranveer_brar_recipes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranveer_brar_recipes`
--

LOCK TABLES `ranveer_brar_recipes` WRITE;
/*!40000 ALTER TABLE `ranveer_brar_recipes` DISABLE KEYS */;
INSERT INTO `ranveer_brar_recipes` VALUES (1,'Dal Makhani','Main Course','1 cup whole black gram (urad dal), 1/4 cup red kidney beans (rajma), 2 tbsp butter, 1 tbsp ghee, 1 large onion (finely chopped), 2 tomatoes (pureed), 1 tbsp ginger-garlic paste, 1 tsp cumin seeds, 2-3 green chilies (slit), 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp garam masala, 1/4 cup fresh cream, salt to taste, 1/2 tsp kasuri methi (dried fenugreek leaves), and fresh coriander leaves for garnish.','Soak the whole black gram and red kidney beans overnight. Drain and cook them in a pressure cooker with water until soft. In a pan, heat ghee and butter, then add cumin seeds. Once they crackle, add finely chopped onion and saut├⌐ until golden brown. Add ginger-garlic paste and green chilies, cooking for a minute. Stir in tomato puree, turmeric powder, red chili powder, and salt, and cook until the oil separates. Add the cooked dal and rajma, along with some water, and simmer on low heat for about 30-40 minutes. Stir in garam masala, fresh cream, and kasuri methi. Cook for a few more minutes until creamy. Garnish with fresh coriander leaves and serve hot with rice or naan.','00:15:00','01:30:00',4.9,14),(2,'Khichdi','Main Course','1 cup rice, 1/2 cup split yellow moong dal, 1 tbsp ghee, 1 tsp cumin seeds, 1/4 tsp asafoetida (hing), 1/2 tsp turmeric powder, 1 tsp ginger (grated), 2 green chilies (chopped), 1 large tomato (chopped), 1/2 tsp red chili powder, 1/2 tsp garam masala, 4 cups water, salt to taste, and fresh coriander leaves for garnish.','Rinse and soak the rice and moong dal together for about 15-20 minutes. Heat ghee in a pressure cooker, add cumin seeds and asafoetida, and saut├⌐ for a few seconds. Add grated ginger, chopped green chilies, and chopped tomato, and cook until the tomato softens. Stir in turmeric powder, red chili powder, and salt. Drain the soaked rice and dal, add them to the cooker, and saut├⌐ for a couple of minutes. Pour in water and bring to a boil. Close the pressure cooker and cook for 3-4 whistles. Once the pressure releases, open the cooker and stir the khichdi gently. Garnish with fresh coriander leaves and serve hot with yogurt or pickle.','00:15:00','00:20:00',4.5,3),(3,'Paneer Tikka','Appetizer','250g paneer (cut into cubes), 1 cup plain yogurt, 2 tbsp ginger-garlic paste, 1 tbsp lemon juice, 2 tbsp tikka masala, 1/2 tsp turmeric powder, 1/2 tsp red chili powder, 1/2 tsp cumin powder, salt to taste, 1 tbsp mustard oil, 1 large onion (cut into squares), 1 bell pepper (cut into squares), 1 lemon (cut into wedges), and fresh coriander leaves for garnish.','In a bowl, combine plain yogurt, ginger-garlic paste, lemon juice, tikka masala, turmeric powder, red chili powder, cumin powder, mustard oil, and salt to make the marinade. Add the paneer cubes, onion, and bell pepper to the marinade and mix well. Let it marinate for at least 30 minutes. Preheat the oven to 200┬░C (392┬░F). Thread the marinated paneer and vegetables onto skewers, alternating between paneer, onion, and bell pepper. Place the skewers on a baking tray and bake for 15-20 minutes, turning occasionally, until the paneer is charred and cooked through. Garnish with fresh coriander leaves and serve hot with lemon wedges.','00:20:00','00:20:00',4.6,5),(4,'Chicken Biryani','Main Course','500g chicken (cut into pieces), 2 cups basmati rice, 1 cup plain yogurt, 2 large onions (thinly sliced), 2 tomatoes (chopped), 2 tbsp ginger-garlic paste, 2 green chilies (slit), 1/4 cup mint leaves, 1/4 cup coriander leaves, 2 tsp biryani masala, 1/2 tsp turmeric powder, 1 tsp red chili powder, 1/2 tsp cumin powder, 1/2 tsp garam masala, 4-5 cloves, 2-3 green cardamom pods, 1 bay leaf, 1-inch cinnamon stick, 4 cups water, 3 tbsp ghee or oil, and salt to taste.','Rinse and soak the basmati rice for 30 minutes, then drain. Heat ghee or oil in a large pot, add cloves, cardamom pods, bay leaf, and cinnamon stick, and saut├⌐ briefly. Add sliced onions and cook until golden brown. Stir in ginger-garlic paste and green chilies, cooking for a minute. Add chicken pieces, turmeric powder, red chili powder, cumin powder, and salt, and cook until the chicken is browned. Stir in chopped tomatoes, yogurt, biryani masala, and garam masala, cooking until the chicken is cooked through and the oil separates from the gravy. In a separate pot, bring water to a boil, add soaked rice, and cook until 70% done. Drain the rice and layer it over the chicken in the pot. Sprinkle mint leaves and coriander leaves on top. Cover and cook on low heat for 20-25 minutes, allowing the flavors to meld. Serve hot with raita or a side salad.','00:30:00','01:00:00',4.8,15),(5,'Shahi Tukda','Dessert','7 slices of white bread (preferably slightly stale), 1 cup milk, 1 cup heavy cream, 1/2 cup sugar, 1/4 cup chopped nuts (such as almonds, cashews, and pistachios), 1/4 tsp saffron strands (soaked in 2 tbsp warm milk), 1/2 tsp cardamom powder, 2 tbsp ghee or clarified butter, 1 tbsp rose water (optional), and fresh rose petals for garnish (optional).','Trim the edges from the bread slices and cut them into triangles. Heat ghee in a pan and fry the bread slices until golden and crispy. Remove and drain on paper towels. In a separate saucepan, heat milk, heavy cream, and sugar, and bring to a simmer. Stir in cardamom powder, saffron milk, and rose water (if using). Cook until the mixture thickens slightly. Arrange the fried bread slices in a serving dish and pour the hot milk mixture over them, ensuring the bread is well-soaked. Garnish with chopped nuts and fresh rose petals if desired. Let it sit for at least an hour to allow the flavors to meld. Serve chilled or at room temperature.','00:15:00','00:20:00',4.7,16);
/*!40000 ALTER TABLE `ranveer_brar_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanjeev_kapoor_recipes`
--

DROP TABLE IF EXISTS `sanjeev_kapoor_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanjeev_kapoor_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `instructions` text,
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `sanjeev_kapoor_recipes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanjeev_kapoor_recipes`
--

LOCK TABLES `sanjeev_kapoor_recipes` WRITE;
/*!40000 ALTER TABLE `sanjeev_kapoor_recipes` DISABLE KEYS */;
INSERT INTO `sanjeev_kapoor_recipes` VALUES (1,'Butter Chicken','Main Course','500g boneless chicken (cut into pieces), 1 cup plain yogurt, 1 tbsp ginger-garlic paste, 1 tbsp lemon juice, 1 tsp turmeric powder, 1 tsp red chili powder, 1 tsp garam masala, salt to taste, 2 tbsp butter, 1 tbsp oil, 1 large onion (finely chopped), 2 tbsp ginger-garlic paste, 2 large tomatoes (pureed), 1/2 cup cashew paste, 1 tsp red chili powder, 1/2 tsp turmeric powder, 1 tsp garam masala, 1/2 tsp cumin powder, 1/2 cup cream, 1 tsp sugar (optional), and fresh coriander leaves for garnish','Marinate the chicken in a mixture of yogurt, ginger-garlic paste, lemon juice, turmeric powder, red chili powder, garam masala, and salt for at least 1 hour. Heat butter and oil in a pan, then saut├⌐ finely chopped onions until golden. Add ginger-garlic paste and cook for a minute. Stir in tomato puree and cook until oil separates. Add cashew paste, red chili powder, turmeric powder, garam masala, cumin powder, and salt. Add the marinated chicken and cook until done. Stir in cream and simmer for a few minutes. Garnish with fresh coriander leaves and serve hot with naan, roti, or rice.','01:00:00','00:40:00',4.8,1),(2,'Palak Paneer','Main Course','200g paneer (cubed), 500g spinach leaves, 2 tbsp oil, 1 tsp cumin seeds, 1 large onion (finely chopped), 1 tbsp ginger-garlic paste, 2 green chilies (chopped), 2 large tomatoes (pureed), 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp garam masala, 1/2 tsp cumin powder, 1/4 cup fresh cream, salt to taste, and a pinch of asafoetida (hing)','Blanch spinach leaves in boiling water for 2-3 minutes, then cool and blend into a smooth paste. Heat oil in a pan, add cumin seeds and a pinch of asafoetida, then saut├⌐ chopped onions until golden. Add ginger-garlic paste and chopped green chilies, and cook for a minute. Stir in tomato puree, turmeric powder, red chili powder, garam masala, and cumin powder, cooking until the oil separates. Add the spinach puree and cook for a few minutes. Stir in paneer cubes and salt, and cook for another 5-7 minutes. Finally, add fresh cream, mix well, and serve hot with roti, naan, or rice.','00:15:00','00:30:00',4.5,2),(3,'Khichdi','Main Course','1 cup rice, 1/2 cup split yellow moong dal (washed), 2 tbsp ghee, 1 tsp cumin seeds, 1/4 tsp asafoetida (hing), 1/2 tsp turmeric powder, 1 tsp ginger (grated), 2 green chilies (slit), 1 large tomato (chopped), 1/2 tsp red chili powder, salt to taste, 4 cups water, and fresh coriander leaves for garnish.','Wash and soak the rice and moong dal together for about 15-20 minutes. Heat ghee in a pressure cooker, add cumin seeds and asafoetida, and saut├⌐ for a few seconds. Add grated ginger, green chilies, and chopped tomatoes, and cook until the tomatoes soften. Stir in turmeric powder, red chili powder, and salt. Drain the soaked rice and dal, and add them to the cooker. Saut├⌐ for a couple of minutes, then pour in water. Close the pressure cooker and cook for 3-4 whistles. Once the pressure releases, open the cooker and stir the khichdi gently. Garnish with fresh coriander leaves and serve hot with yogurt or pickle.','00:20:00','00:20:00',4.2,3),(4,'Gulab Jamun','Dessert','1 cup khoya (grated), 1/4 cup all-purpose flour (maida), 1/8 tsp baking soda, 2 cups sugar, 1 cup water, 4-5 green cardamom pods (crushed), a few drops of rose water, ghee or oil for deep frying, and chopped pistachios for garnish.','Combine grated khoya, all-purpose flour, and baking soda in a bowl to form a smooth dough. Divide the dough into small, equal-sized balls, ensuring there are no cracks. In a separate pan, dissolve sugar in water over low heat to make the sugar syrup. Add crushed cardamom pods and rose water, and keep the syrup warm. Heat ghee or oil in a deep pan on low heat. Fry the dough balls until they are golden brown, turning them gently to ensure even cooking. Once fried, remove the gulab jamuns and drain excess oil. Immediately immerse them in the warm sugar syrup and let them soak for at least 2 hours. Garnish with chopped pistachios before serving.','00:20:00','00:30:00',4.7,4),(5,'Paneer Tikka','Appetizer','250g paneer (cut into cubes), 1/2 cup thick yogurt, 1 tbsp ginger-garlic paste, 1 tsp red chili powder, 1/2 tsp turmeric powder, 1 tsp garam masala, 1/2 tsp cumin powder, 1/2 tsp chaat masala, 1 tbsp lemon juice, 1 tbsp mustard oil, salt to taste, 1 large onion (cut into squares), 1 large bell pepper (cut into squares), 1 large tomato (cut into squares), and skewers.','In a bowl, mix thick yogurt, ginger-garlic paste, red chili powder, turmeric powder, garam masala, cumin powder, chaat masala, lemon juice, mustard oil, and salt to make the marinade. Add paneer cubes, onion, bell pepper, and tomato pieces to the marinade and mix well, ensuring everything is coated evenly. Let it marinate for at least 30 minutes. Thread the marinated paneer and vegetables onto skewers, alternating between paneer, onion, bell pepper, and tomato. Grill or bake in a preheated oven at 200┬░C (392┬░F) for 15-20 minutes, turning the skewers occasionally until the paneer is golden and slightly charred. Serve hot with mint chutney and lemon wedges.','00:15:00','00:20:00',4.6,5),(8,'Aloo Gobhi','Main Course','2 large potatoes (peeled and cut into cubes), 1 medium cauliflower (cut into florets), 2 tbsp oil, 1 tsp cumin seeds, 1/2 tsp mustard seeds, 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp coriander powder, 1/2 tsp garam masala, 1/2 tsp amchur (dry mango powder), salt to taste, and fresh coriander leaves for garnish.','Heat oil in a large pan, add cumin seeds and mustard seeds, and cook until they start to splutter. Add the potato cubes and cauliflower florets, and stir well. Sprinkle turmeric powder, red chili powder, coriander powder, and salt over the vegetables. Mix everything well to coat the vegetables with the spices. Cover the pan and cook on medium heat for about 15-20 minutes, stirring occasionally, until the potatoes and cauliflower are tender and cooked through. Stir in garam masala and amchur powder. Cook for an additional 2-3 minutes to blend the flavors. Garnish with fresh coriander leaves and serve hot with roti or paratha.','00:20:00','00:25:00',4.9,19);
/*!40000 ALTER TABLE `sanjeev_kapoor_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('viewer','editor') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin1','password123','editor'),(2,'User1','password','viewer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vikas_khanna_recipes`
--

DROP TABLE IF EXISTS `vikas_khanna_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vikas_khanna_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `instructions` text,
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `vikas_khanna_recipes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vikas_khanna_recipes`
--

LOCK TABLES `vikas_khanna_recipes` WRITE;
/*!40000 ALTER TABLE `vikas_khanna_recipes` DISABLE KEYS */;
INSERT INTO `vikas_khanna_recipes` VALUES (1,'Dal Makhani','Main Course','1 cup black lentils (whole urad dal), 1/4 cup red kidney beans (rajma), 2 tbsp butter, 2 tbsp ghee, 1 large onion (finely chopped), 2 tomatoes (pureed), 1 tbsp ginger-garlic paste, 1 tsp cumin seeds, 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp garam masala, 1/4 cup fresh cream, salt to taste, and fresh coriander leaves for garnish.','Soak the black lentils and red kidney beans overnight. Drain and cook them in a pressure cooker with enough water until soft. In a large pan, heat ghee and butter, add cumin seeds, and cook until they crackle. Add finely chopped onion and cook until golden brown. Stir in ginger-garlic paste and cook for a minute. Add pureed tomatoes, turmeric powder, red chili powder, and salt. Cook until the oil separates from the tomato mixture. Add the cooked dal and rajma, and simmer on low heat for 30 minutes, stirring occasionally. Stir in garam masala and fresh cream, and cook for an additional 5-10 minutes. Garnish with fresh coriander leaves and serve hot with rice or naan.','00:10:00','01:30:00',4.9,14),(2,'Baked Samosa','Appetizer','1 cup all-purpose flour, 1/4 cup whole wheat flour, 1/4 cup melted ghee or butter, 1/2 tsp carom seeds (ajwain), 1/2 tsp cumin seeds, 1/2 tsp salt, 2-3 tbsp water (or as needed for dough), 2 tbsp oil, 1 tsp cumin seeds, 1/2 tsp mustard seeds, 1/2 tsp turmeric powder, 1 tsp garam masala, 1/2 tsp chili powder, 1 cup boiled and mashed potatoes, 1/2 cup boiled peas, 1 tbsp chopped cilantro, 1 tbsp lemon juice, and salt to taste.','Preheat the oven to 200┬░C (400┬░F). In a bowl, mix all-purpose flour, whole wheat flour, carom seeds, cumin seeds, salt, and melted ghee or butter. Add water gradually to form a smooth dough. Let it rest for 15-20 minutes. For the filling, heat oil in a pan, add cumin seeds and mustard seeds, and cook until they splutter. Add turmeric powder, garam masala, chili powder, and cook for a minute. Stir in mashed potatoes, boiled peas, chopped cilantro, lemon juice, and salt. Cook for a few minutes and let the filling cool. Roll out the dough into thin circles, cut into half, and form cones. Fill each cone with the potato mixture and seal the edges, shaping into triangles. Place the samosas on a baking sheet and brush with oil. Bake for 20-25 minutes or until golden and crisp. Serve hot with chutney.','00:30:00','00:30:00',4.6,17),(3,'Butter Chicken','Main Course','500g boneless chicken (cut into pieces), 1 cup plain yogurt, 2 tbsp lemon juice, 1 tbsp ginger-garlic paste, 1 tbsp garam masala, 1 tsp turmeric powder, 1 tsp red chili powder, 2 tbsp butter, 2 tbsp oil, 1 large onion (finely chopped), 2 tomatoes (pureed), 1/2 cup heavy cream, 1/4 cup kasuri methi (dried fenugreek leaves), salt to taste, and fresh coriander leaves for garnish.','Marinate the chicken in yogurt, lemon juice, ginger-garlic paste, garam masala, turmeric powder, red chili powder, and salt for at least 1 hour or overnight. Heat oil and butter in a large pan, add chopped onion, and cook until golden brown. Stir in the marinated chicken and cook until browned on all sides. Add tomato puree and cook for 10 minutes, stirring occasionally. Pour in heavy cream and kasuri methi, and simmer for another 10-15 minutes until the chicken is cooked through and the sauce is creamy. Garnish with fresh coriander leaves and serve hot with naan or rice.','00:15:00','00:40:00',4.8,1),(4,'Pindi Chana','Main Course','1 cup black chickpeas (kala chana), 2 tbsp oil, 1 tsp cumin seeds, 1/2 tsp asafoetida (hing), 1 large onion (finely chopped), 2 tomatoes (chopped), 1 tbsp ginger-garlic paste, 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp coriander powder, 1/2 tsp garam masala, 1 tsp pomegranate seeds powder, 1 tbsp tamarind paste, salt to taste, and fresh coriander leaves for garnish.','Soak black chickpeas overnight. Drain and cook in a pressure cooker with enough water until soft. Heat oil in a large pan, add cumin seeds and asafoetida, and cook briefly. Add chopped onion and cook until golden brown. Stir in ginger-garlic paste and cook for a minute. Add chopped tomatoes, turmeric powder, red chili powder, coriander powder, and salt. Cook until the oil separates from the tomato mixture. Add the cooked chickpeas along with a little of the cooking water, and simmer for 15-20 minutes. Stir in garam masala, pomegranate seeds powder, and tamarind paste. Cook for a few more minutes until the flavors meld. Garnish with fresh coriander leaves and serve hot with rice or naan.','00:15:00','00:30:00',4.7,18),(5,'Aloo Gobhi','Main Course','2 large potatoes (peeled and cut into cubes), 1 medium cauliflower (cut into florets), 2 tbsp oil, 1 tsp cumin seeds, 1/2 tsp asafoetida (hing), 1 large onion (finely chopped), 2 tomatoes (chopped), 1 tbsp ginger-garlic paste, 1/2 tsp turmeric powder, 1 tsp red chili powder, 1 tsp coriander powder, 1/2 tsp garam masala, 1/2 tsp cumin powder, salt to taste, and fresh coriander leaves for garnish.','Heat oil in a large pan, add cumin seeds and asafoetida, and cook briefly. Add chopped onion and cook until golden brown. Stir in ginger-garlic paste and cook for a minute. Add chopped tomatoes, turmeric powder, red chili powder, coriander powder, and salt. Cook until the oil separates from the tomato mixture. Add the potato cubes and cauliflower florets, stirring to coat with the spices. Cover and cook on low heat for about 20-25 minutes, stirring occasionally, until the vegetables are tender. Stir in garam masala and cumin powder. Cook for a few more minutes to blend the flavors. Garnish with fresh coriander leaves and serve hot with rice or roti.','00:15:00','00:30:00',4.5,19);
/*!40000 ALTER TABLE `vikas_khanna_recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-12 16:01:05
