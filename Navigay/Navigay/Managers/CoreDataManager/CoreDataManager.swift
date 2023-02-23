//
//  CoreDataManager.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 23.02.23.
//

import Foundation
import CoreData

struct UserModel {
    var id: UUID
    var name: String
    var about: String?
}

protocol CoreDataManagerProtocol {
//    var cities: [City] {get set}
//    var cityAdded: ((CityModel) -> Void)? { get set }
//
//    func save (city: CityModel, complition: @escaping((Bool) -> Void))
//    func getCities() -> [City]
//    func deleteCity(indexPath: Int, complition: @escaping ((Bool) -> Void))

}

final class CoreDataManager: ObservableObject {

    @Published var isUserLoggedIn: Bool? = nil
    @Published var user: CoreDataUser? = nil
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                debugPrint("Unresolved error \(error), \(error.userInfo)")
                return
            }
        })
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.persistentContainer.viewContext
    
    init() {
        getUser()
    }
}
// MARK: - CoreDataManagerProtocol

extension CoreDataManager: CoreDataManagerProtocol {
    private func getUser() {
        let request: NSFetchRequest<CoreDataUser> = CoreDataUser.fetchRequest()
        do {
            if let user = try managedContext.fetch(request).first {
                self.user = user
                isUserLoggedIn = true
            } else {
                isUserLoggedIn = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
                self?.isUserLoggedIn = true
            }
            
        } catch let error {
            isUserLoggedIn = false
            print("Error fetching singers \(error)")
        }
    }
    
//    func save(city: CityModel, complition: @escaping ((Bool) -> Void)) {
//        let coreDataCity = makeCity(city: city)
//        cities.append(coreDataCity)
//        if managedContext.hasChanges {
//            do {
//                try managedContext.save()
//                cityAdded?(city)
//                complition(true)
//            } catch {
//                let nserror = error as NSError
//                debugPrint("Unresolved error \(nserror), \(nserror.userInfo)")
//                complition(false)
//            }
//        }
//    }
//
//    func deleteCity(indexPath: Int, complition: @escaping ((Bool) -> Void)) {
//        managedContext.delete(cities[indexPath])
//        if managedContext.hasChanges {
//            do {
//                try managedContext.save()
//                complition(true)
//            } catch {
//                let nserror = error as NSError
//                debugPrint("Unresolved error \(nserror), \(nserror.userInfo)")
//                complition(false)
//            }
//        }
//    }
}

// MARK: - Private functions

//extension CoreDataManager {
//
//    private func makeCity(city model: CityModel) -> City {
//        let city = City(context: managedContext)
//        city.setValue(model.longitude, forKey: #keyPath(City.longitude))
//        city.setValue(model.latitude, forKey: #keyPath(City.latitude))
//        city.setValue(model.name, forKey: #keyPath(City.name))
//        city.setValue(model.country, forKey: #keyPath(City.country))
//        return city
//    }
//}
