from pymongo import MongoClient
import os
from dotenv import load_dotenv

# Load the environment variables from the .env file
load_dotenv()

# Get the MongoDB connection string from the environment variable
connection_string = os.getenv('MONGODB_URL')

# Check if the connection string is loaded correctly
if connection_string is None:
    raise ValueError("No MongoDB connection string found in .env file.")

# Connect to the MongoDB cluster
client = MongoClient(connection_string)

# Select the database (this will create the database if it doesn't exist)
db = client['shopping_db']  # Name of your database

# Create collections for items and logs
logs_collection = db['shopping_logs']  # Collection for shopping logs

# Data for shopping_log with user IDs 1 to 10
shopping_log = {
    1: [

    ],
    2: [

    ],
    3: [

    ],
    4: [

    ],
    5: [

    ],
    6: [

    ],
    7: [

    ],
    8: [

    ],
    9: [

    ],
    10: [

    ]
}

# Insert shopping logs into the shopping_logs collection
for user_id, log_entries in shopping_log.items():
    log = []
    for entry in log_entries:
        log.append({
            "status": entry[0],
            "item": entry[1],
            "item_details": entry[2],
            "checkout": entry[3]
        })
    
    logs_collection.insert_one({
        "user_id": user_id,
        "log": log
    })

nutrition_collection = db['product_nutrition']

# Nutritional data to be added
nutrition_data = [
    {
        "product_name": "Green Apple",
        "calories": 1.0,
        "carbs": 20,
        "fat": 15,
        "protein": 6,
        "price": 0.3
    },
    {
        "product_name": "Water Bottle",
        "calories": 0,
        "carbs": 0,
        "fat": 0,
        "protein": 0,
        "price": 1.5
    },
    {
        "product_name": "Coca Cola",
        "calories": 0.5,
        "carbs": 5,
        "fat": 35,
        "protein": 2,
        "price": 0.2
    }
]

# Insert the data into the product_nutrition collection
nutrition_collection.insert_many(nutrition_data)

print("Data inserted into MongoDB successfully!")
