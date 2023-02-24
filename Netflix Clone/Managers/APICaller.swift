//
//  APICaller.swift
//  Netflix Clone
//
//  Created by macbook pro on 20.02.2023.
//

import Foundation

enum DataError: Error {
    case failedToGetData
}

typealias Handler = (Result<[Title], Error>) -> Void

final class API_Caller {
    static let shared = API_Caller()
    private init() {}
    
    func fetchTrendingMovies(completion: @escaping Handler) {
        
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchTrendingTV(completion: @escaping Handler) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchUpcomingMovies(completion: @escaping Handler) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-TR&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchPopularMovies(completion: @escaping Handler) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-TR&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchTopRatedMovies(completion: @escaping Handler) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-TR&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchDiscoverMovies(completion: @escaping Handler) {
        guard let url = URL(string: "\(Constant.baseURL)/3/discover/movie?api_key=\(Constant.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping Handler) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constant.baseURL)/3/search/movie?api_key=\(Constant.API_KEY)&query=\(query)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results.results)
                completion(.success(results.results))
            } catch {
                completion(.failure(DataError.failedToGetData))
            }
        }
        task.resume()
    }
}
