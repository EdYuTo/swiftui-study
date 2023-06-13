//
//  NetworkManager.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 22/04/23.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func makeRequest<T>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return self.completeFailure(completion, with: NetworkError.unknown)
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return self.completeFailure(completion, with: NetworkError.invalidResponse)
            }
            guard let data = data else {
                return self.completeFailure(completion, with: NetworkError.invalidData)
            }
            let decoder = JSONDecoder()
            guard let decodedObject = try? decoder.decode(T.self, from: data) else {
                return self.completeFailure(completion, with: NetworkError.invalidResponse)
            }
            self.completeSuccess(completion, with: decodedObject)
        }
        task.resume()
    }
    
    func makeRequest<T>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        guard let url = URL(string: endpoint) else {
            return completeFailure(completion, with: NetworkError.invalidURL)
        }
        makeRequest(request: URLRequest(url: url), completion: completion)
    }
    
    private func completeSuccess<T>(_ completion: @escaping (Result<T, Error>) -> Void, with data: T) {
        DispatchQueue.main.async {
            completion(.success(data))
        }
    }
    
    private func completeFailure<T>(_ completion: @escaping (Result<T, Error>) -> Void, with data: Error) {
        DispatchQueue.main.async {
            completion(.failure(data))
        }
    }
}

// MARK: - Image
extension NetworkManager {
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        let key = NSString(string: url)
        if let image = cache.object(forKey: key) {
            return complete(completion, image: image)
        }
        guard let url = URL(string: url) else {
            return complete(completion, image: nil)
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data)
            else {
                return self.complete(completion, image: nil)
            }
            self.cache.setObject(image, forKey: key)
            self.complete(completion, image: image)
        }
        task.resume()
    }
    
    private func complete(_ completion: @escaping (UIImage?) -> Void, image: UIImage?) {
        DispatchQueue.main.async {
            completion(image)
        }
    }
}

// MARK: - Appetizers
extension NetworkManager {
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let mealsURL = baseURL + "appetizers"
    
    func getAppetizers(completion: @escaping (Result<[Meal], Error>) -> Void) {
        makeRequest(endpoint: NetworkManager.mealsURL) { (result: Result<MealsList, Error>) -> Void in
            switch result {
            case .success(let meals):
                completion(.success(meals.list))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

