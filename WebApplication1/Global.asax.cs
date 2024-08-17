using System;
using System.Collections.Generic;
using System.Web;
using WebApplication1.model;

namespace WebApplication1
{
    public class Global : System.Web.HttpApplication
    {

        
        public const string user_list = "user_list";
        public const string user_name = "user_name";
        public const string product_list = "ProductList";




        protected void Application_Start(object sender, EventArgs e)
        {
            Application[user_list] = createAListuser();
            Application[product_list] = createProduct();   
           
        }


        private List<Product> createProduct()
        {
            return new List<Product>()
            {
                new Accessory
                {
                    Id = 0,
                    ProductName = "Gym Gloves",
                    Category = "Accessory",
                    Price = 19.99,
                    Description = "Padded gym gloves for better grip",
                    ImageURL = "/img/logoproduct/gym_glove.png",
                    Size = "Medium"
                },
                new Accessory
                {
                    Id = 1,
                    ProductName = "Ab Roller",
                    Category = "Accessory",
                    Price = 14.99,
                    Description = "Set of 5 ab roller for workouts",
                    ImageURL = "/img/logoproduct/abroller.png",
                    Size = "One Size"
                },
                new Accessory
                {
                    Id = 2,
                    ProductName = "Yoga Mat",
                    Category = "Accessory",
                    Price = 29.99,
                    Description = "Non-slip yoga mat",
                    ImageURL = "/img/logoproduct/yoga_mat.png",
                    Size = "Standard"
                },
                new Accessory
                {
                    Id = 3,
                    ProductName = "Water Bottle",
                    Category = "Accessory",
                    Price = 9.99,
                    Description = "Stainless steel water bottle",
                    ImageURL = "/img/logoproduct/water_bottle.png",
                    Size = "500ml"
                },
                new Accessory
                {
                    Id = 4,
                    ProductName = "Jump Rope",
                    Category = "Accessory",
                    Price = 12.99,
                    Description = "Adjustable speed jump rope",
                    ImageURL = "/img/logoproduct/jump_rope.png",
                    Size = "One Size"
                },
                new Accessory
                {
                    Id = 5,
                    ProductName = "Foam Roller",
                    Category = "Accessory",
                    Price = 24.99,
                    Description = "High-density foam roller for muscle recovery",
                    ImageURL = "/img/logoproduct/foam_roller.png",
                    Size = "Standard"
                },
                new Accessory {
                    Id = 6,
                    ProductName = "Barbell Pad",
                    Category = "Accessory",
                    Price = 28.00,
                    Description = "Okay, the Barbell Pad probably doesn’t make squats easy. But it certainly makes them easier. With a soft, compressive Nitrile Rubber foam, this barbell accessory rests comfortably on the body to prevent undue pressure and abrasion through every lift.",
                    ImageURL = "/img/logoproduct/barbellpad.png",
                    Size = "20kg"
                },
                new Clothes
                {
                    Id = 7,
                    ProductName = "Gym T-Shirt",
                    Category = "Clothes",
                    Price = 25.99,
                    Description = "Breathable gym t-shirt for optimal comfort",
                    ImageURL = "/img/logoproduct/gym_tshirt.png",
                    Type = 1
                },
                new Clothes
                {
                    Id = 8,
                    ProductName = "Running Shorts",
                    Category = "Clothes",
                    Price = 29.99,
                    Description = "Lightweight running shorts with pockets",
                    ImageURL = "/img/logoproduct/running_shorts.png",
                    Type = 1
                },
                new Clothes
                {
                    Id = 9,
                    ProductName = "Yoga Pants",
                    Category = "Clothes",
                    Price = 34.99,
                    Description = "Flexible yoga pants for maximum movement",
                    ImageURL = "/img/logoproduct/yoga_pants.png",
                    Type = 1
                },
                new Clothes
                {
                    Id = 10,
                    ProductName = "Hoodie",
                    Category = "Clothes",
                    Price = 45.99,
                    Description = "Warm hoodie for post-workout comfort",
                    ImageURL = "/img/logoproduct/hoodie.png",
                    Type = 1
                },
                new Clothes
                {
                    Id = 11,
                    ProductName = "Compression Socks",
                    Category = "Clothes",
                    Price = 15.99,
                    Description = "Supportive compression socks for workouts",
                    ImageURL = "/img/logoproduct/compression_socks.png",
                    Type = 1
                },
                new Clothes
                {
                    Id = 12,
                    ProductName = "Track Jacket",
                    Category = "Clothes",
                    Price = 59.99,
                    Description = "Water-resistant track jacket for outdoor runs",
                    ImageURL = "/img/logoproduct/track_jacket.png",
                    Type = 1
                },
                new Supplement
                {
                    Id = 13,
                    ProductName = "Whey Protein",
                    Category = "Supplements",
                    Price = 49.99,
                    Description = "High-quality whey protein for muscle building",
                    ImageURL = "/img/logoproduct/whey.png",
                },
                new Supplement
                {
                    Id = 14,
                    ProductName = "Creatine Monohydrate",
                    Category = "Supplements",
                    Price = 29.99,
                    Description = "Enhances strength and performance",
                    ImageURL = "/img/logoproduct/creatine.png",
                },
                new Supplement
                {
                    Id = 15,
                    ProductName = "BCAA Powder",
                    Category = "Supplements",
                    Price = 34.99,
                    Description = "Supports muscle recovery and growth",
                    ImageURL = "/img/logoproduct/bcaa.png",
                            },
                new Supplement
                {
                    Id = 16,
                    ProductName = "Multivitamin",
                    Category = "Supplements",
                    Price = 19.99,
                    Description = "Daily multivitamin for overall health",
                    ImageURL = "/img/logoproduct/multivitamin.png",
                },
                new Supplement
                {
                    Id = 17,
                    ProductName = "Pre-Workout",
                    Category = "Supplements",
                    Price = 39.99,
                    Description = "Boosts energy and focus during workouts",
                    ImageURL = "/img/logoproduct/pre_workout.png",
                },
                new Supplement
                {
                    Id = 18,
                    ProductName = "Vegan Protein",
                    Category = "Supplements",
                    Price = 44.99,
                    Description = "Plant-based protein for a vegan diet",
                    ImageURL = "/img/logoproduct/vegan_protein.png",
                },
                new Supplement
                {
                    Id = 19,
                    ProductName = "Glutamine",
                    Category = "Supplements",
                    Price = 24.99,
                    Description = "Supports muscle recovery and immune function",
                    ImageURL = "/img/logoproduct/glutamine.png",
                },
                new Supplement
                {
                    Id = 20,
                    ProductName = "ZMA",
                    Category = "Supplements",
                    Price = 18.99,
                    Description = "Promotes restful sleep and recovery",
                    ImageURL = "/img/logoproduct/zma.png",
                }
            };
        }

        private List<Users> createAListuser()
        {
            return new List<Users>() {
                new Users{username="1", password="1"},
                new Users{username="2", password="2"}
            };
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session[user_name] = "guest";
        }
    }
}