//
//  CoreDataMananger.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import CoreData
import Foundation

protocol CoreDataManagerProtocol {
    func saveMovie(movie:MovieEntity)
    func fetchMovies() -> [MovieEntity]
}

class CoreDataManager:CoreDataManagerProtocol {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MovieSoftek")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveMovie(movie:MovieEntity) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieData")
        fetchRequest.predicate = NSPredicate(format: "id == %lld", Int64(movie.id))
        do {
            let result = try context.fetch(fetchRequest)
            if result.isEmpty {
                let entity = NSEntityDescription.entity(forEntityName: "MovieData", in: context)!
                let newMovie = NSManagedObject(entity: entity, insertInto: context)
                newMovie.setValue(Int64(movie.id), forKey: "id")
                newMovie.setValue(movie.title, forKey: "title")
                newMovie.setValue(movie.rating, forKey: "rating")
                newMovie.setValue(movie.overview, forKey: "overview")
                newMovie.setValue(movie.releaseDate, forKey: "releaseDate")
                try context.save()
            }
        } catch {
            print("Error saving or fetching movie: \(error)")
        }
    }

    func fetchMovies() -> [MovieEntity] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieData")

        do {
            let results = try context.fetch(fetchRequest)
            return results.map { movie in
                let id = movie.value(forKey: "id") as? Int ?? 0
                let title = movie.value(forKey: "title") as? String ?? ""
                let rating = movie.value(forKey: "rating") as? String ?? ""
                let overview = movie.value(forKey: "overview") as? String ?? ""
                let releaseDate = movie.value(forKey: "releaseDate") as? String ?? ""
                return MovieEntity(id: id, title: title, rating: rating, releaseDate: releaseDate, overview: overview)
            }
        } catch let error as NSError {
            print("Could not fetch movies: \(error), \(error.userInfo)")
            return []
        }
    }

}

extension MovieData {
    func toMovieEntity() -> MovieEntity{
        return MovieEntity(id: Int(self.id), title: self.title ?? "", rating: self.rating ?? "" , releaseDate: self.releaseDate ?? "", overview: self.overview ?? "")
    }
}

