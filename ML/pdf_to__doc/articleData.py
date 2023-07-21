import random


articles = [
    {
        "article_id": 1,
        "title": "The Importance of Regular Physical Examinations",
        "content": "Regular physical examinations are crucial for maintaining good health and detecting potential medical conditions at an early stage...",
        "keywords": ["health", "physical examinations", "prevention", "medical conditions"],
    },
    {
        "article_id": 2,
        "title": "Managing Stress for Better Mental Health",
        "content": "Chronic stress can have detrimental effects on mental health. This article discusses effective strategies for managing stress...",
        "keywords": ["stress management", "mental health", "well-being", "coping techniques"],
    },
    {
        "article_id": 3,
        "title": "Understanding Diabetes: Causes, Symptoms, and Treatment",
        "content": "Diabetes is a chronic condition characterized by high blood sugar levels. This article provides an overview of diabetes...",
        "keywords": ["diabetes", "blood sugar", "chronic condition", "treatment"],
    },
    {
        "article_id": 4,
        "title": "The Role of Nutrition in Heart Health",
        "content": "A healthy diet plays a crucial role in maintaining heart health and reducing the risk of cardiovascular diseases...",
        "keywords": ["nutrition", "heart health", "cardiovascular diseases", "healthy diet"],
    },
    {
        "article_id": 5,
        "title": "Understanding Allergies: Causes, Symptoms, and Management",
        "content": "Allergies are hypersensitive reactions to substances. This article explains common allergens, symptoms, and effective management strategies...",
        "keywords": ["allergies", "hypersensitivity", "allergens", "symptoms", "management"],
    },
    # Add more articles to the dataset
]


for i in range(6, 21000):
    article = {
        "article_id": i,
        "title": f"Medical Article {i}",
        "content": f"This is the content of medical article {i}.",
        "keywords": random.sample(["health", "medical", "conditions", "treatment", "prevention"], 3),
    }
    articles.append(article)

for article in articles:
    print(article)
