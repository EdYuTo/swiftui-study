//
//  Meals.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 12/02/23.
//

// MARK: - Meals
struct MealsList: Decodable {
    let list: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case list = "request"
    }
}

// MARK: - Meal
struct Meal: Decodable {
    let id: Int
    let price: Double
    let description: String
    let calories, protein: Int
    let imageUrl: String
    let carbs: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, price, description, calories, protein, carbs, name
        case imageUrl = "imageURL"
    }
}

// MARK: - Mock
struct MockData {
    static let sampleMeal = Meal(
        id: 0x1,
        price: 8.99,
        description: "This perfectly thin cut just melts in your mouth.",
        calories: 99,
        protein: 14,
        imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        carbs: 0,
        name: "Asian Flank Steak"
    )
    
    static let meals = [sampleMeal, sampleMeal, sampleMeal]
}
