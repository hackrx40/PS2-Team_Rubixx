from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Example dataset of articles
articles = [
    {
        "article_id": 1,
        "title": "Article 1",
        "content": "This is the content of article 1.",
        "keywords": ["keyword1", "keyword2", "keyword3"],
    },
    {
        "article_id": 2,
        "title": "Article 2",
        "content": "This is the content of article 2.",
        "keywords": ["keyword2", "keyword4", "keyword5"],
    },
    # Add more articles to the dataset
    {
        "article_id": 3,
        "title": "Article 3",
        "content": "This is the content of article 3.",
        "keywords": ["keyword1", "keyword3", "keyword6"],
    },
    {
        "article_id": 4,
        "title": "Article 4",
        "content": "This is the content of article 4.",
        "keywords": ["keyword4", "keyword7", "keyword8"],
    },
    {
        "article_id": 5,
        "title": "Article 5",
        "content": "This is the content of article 5.",
        "keywords": ["keyword2", "keyword9", "keyword10"],
    },
    {
        "article_id": 6,
        "title": "Article 6",
        "content": "This is the content of article 6.",
        "keywords": ["keyword11", "keyword12", "keyword13"],
    },
    {
        "article_id": 7,
        "title": "Article 7",
        "content": "This is the content of article 7.",
        "keywords": ["keyword14", "keyword15", "keyword16"],
    },
    {
        "article_id": 8,
        "title": "Article 8",
        "content": "This is the content of article 8.",
        "keywords": ["keyword17", "keyword18", "keyword19"],
    },
    {
        "article_id": 9,
        "title": "Article 9",
        "content": "This is the content of article 9.",
        "keywords": ["keyword20", "keyword21", "keyword22"],
    },
    {
        "article_id": 10,
        "title": "Article 10",
        "content": "This is the content of article 10.",
        "keywords": ["keyword23", "keyword24", "keyword25"],
    },
    {
        "article_id": 11,
        "title": "Article 11",
        "content": "This is the content of article 11.",
        "keywords": ["keyword26", "keyword27", "keyword28"],
    },
    {
        "article_id": 12,
        "title": "Article 12",
        "content": "This is the content of article 12.",
        "keywords": ["keyword29", "keyword30", "keyword31"],
    },
    {
        "article_id": 13,
        "title": "Article 13",
        "content": "This is the content of article 13.",
        "keywords": ["keyword32", "keyword33", "keyword34"],
    },
    {
        "article_id": 14,
        "title": "Article 14",
        "content": "This is the content of article 14.",
        "keywords": ["keyword35", "keyword36", "keyword37"],
    },
    {
        "article_id": 15,
        "title": "Article 15",
        "content": "This is the content of article 15.",
        "keywords": ["keyword38", "keyword39", "keyword40"],
    },
    {
        "article_id": 16,
        "title": "Article 16",
        "content": "This is the content of article 16.",
        "keywords": ["keyword41", "keyword42", "keyword43"],
    },
    {
        "article_id": 17,
        "title": "Article 17",
        "content": "This is the content of article 17.",
        "keywords": ["keyword44", "keyword45", "keyword46"],
    },
    {
        "article_id": 18,
        "title": "Article 18",
        "content": "This is the content of article 18.",
        "keywords": ["keyword47", "keyword48", "keyword49"],
    },
    {
        "article_id": 19,
        "title": "Article 19",
        "content": "This is the content of article 19.",
        "keywords": ["keyword50", "keyword51", "keyword52"],
    },
    {
        "article_id": 20,
        "title": "Article 20",
        "content": "This is the content of article 20.",
        "keywords": ["keyword53", "keyword54", "keyword55"],
    },
]

# Preprocess and create a list of article contents
preprocessed_contents = [article["content"] for article in articles]

# Create TF-IDF vectors for contents
vectorizer = TfidfVectorizer()
tfidf_matrix = vectorizer.fit_transform(preprocessed_contents)

# Create a set of all unique keywords in the dataset
all_keywords = set()
for article in articles:
    all_keywords.update(article["keywords"])

# Example user profile
user_profile = ["keyword1", "keyword4"]  # User's interests or preferred keywords

# Filter articles based on user's preferred keywords
filtered_articles = [article for article in articles if any(keyword in article["keywords"] for keyword in user_profile)]

# Create TF-IDF vectors for keywords
keyword_tfidf_matrix = vectorizer.transform([", ".join(article["keywords"]) for article in filtered_articles])

# Calculate similarity scores based on both content and keywords
user_profile_tfidf = vectorizer.transform([" ".join(user_profile)])
similarity_scores = cosine_similarity(user_profile_tfidf, tfidf_matrix).flatten()
keyword_similarity_scores = cosine_similarity(user_profile_tfidf, keyword_tfidf_matrix).flatten()

# Combine similarity scores for content and keywords (e.g., using weighted average)
content_weight = 0.7  # Weight for content similarity
keyword_weight = 0.3  # Weight for keyword similarity
combined_similarity_scores = content_weight * similarity_scores + keyword_weight * keyword_similarity_scores

# Sort articles based on combined similarity scores
sorted_articles = sorted(zip(filtered_articles, combined_similarity_scores), key=lambda x: x[1], reverse=True)

# Get top-n recommended articles
n = 5
recommended_articles = [article for article, score in sorted_articles[:n]]

# Print recommended articles
for article in recommended_articles:
    print(f"Article ID: {article['article_id']}, Title: {article['title']}")
