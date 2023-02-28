//
//  DataPersistenceManager.swift
//  Netflix Clone
//
//  Created by macbook pro on 28.02.2023.
//

import Foundation
import CoreData
import UIKit


class DataPersistenceManager {
    
    
    enum DatabaseError: Error {
        case failedToGetData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
     
        let item = TitleItem(context: context)
        
        item.original_name = model.original_name
        item.id = Int64(model.id!)
        item.original_title = model.original_title
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count!)
        item.vote_average = model.vote_average!
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToGetData))
        }
    }
    
}
