//
//  UniversityListInteractor.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import RealmSwift

protocol UniversityListInteractorOutputAdaptable: AnyObject {
    func didFinishFetchingUniversities(_ data: [University]?, error: TFError?)
}

protocol UniversityListInteractorAdaptable: AnyObject {
    var output: UniversityListInteractorOutputAdaptable! { get set }
    
    func fetchUniversities()
}

class UniversityListInteractor: UniversityListInteractorAdaptable {
    weak var output: UniversityListInteractorOutputAdaptable!
    
    // Can improve with Network manager to handle interceptor etc and a configurable way to have a base url etc. Due to time constraint, doing basic stuff
    private let url = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
    
    func fetchUniversities() {
        guard let url = URL(string: url) else {
            sendBackSavedItems(withError: APIError.badUrl)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard let welf = self else { return }
            
            if let error {
                welf.sendBackSavedItems(withError: CustomError(title: "Error", message: error.localizedDescription))
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                welf.sendBackSavedItems(withError: APIError.serverFailure)
                
                return
            }
            
            guard let data else {
                welf.sendBackSavedItems(withError: APIError.emptyData)
                
                return
            }
            
            do {
                let items = try JSONDecoder().decode([University].self, from: data)
                
                if items.isEmpty { // Get saved list
                    welf.sendBackSavedItems(withError: nil)
                } else { // Clear and re-save the list
                    welf.clearAllUniversityData() {
                        welf.saveUniversities(items) {
                            welf.output.didFinishFetchingUniversities(items, error: nil)
                        }
                    }
                }
            }
            catch {
                welf.sendBackSavedItems(withError: APIError.parsingError)
            }
        }.resume()
    }
    
    private func sendBackSavedItems(withError error: TFError?) {
        getAllSavedUniversities() { savedItems in
            self.output.didFinishFetchingUniversities(savedItems, error: error)
        }
    }
}

extension UniversityListInteractor {
    private func clearAllUniversityData(_ completion: @escaping EmptyClosure) {
        DispatchQueue.dispatchMainIfNeeded {
            guard let realm = try? Realm() else {
                completion()
                return
            }
            
            do {
                try realm.write {
                    realm.delete(realm.objects(University.self))
                }
            } catch {
                
            }
            
            completion()
        }
    }
    
    private func saveUniversities(_ items: [Object], completion: @escaping EmptyClosure) {
        DispatchQueue.dispatchMainIfNeeded {
            guard let realm = try? Realm() else {
                completion()
                return
            }
            
            do {
                try realm.write {
                    realm.add(items)
                }
            } catch {
                
            }
            
            completion()
        }
    }
    
    private func getAllSavedUniversities(_ completion: @escaping ([University]?) -> ()) {
        DispatchQueue.dispatchMainIfNeeded {
            guard let realm = try? Realm() else {
                return completion(nil)
            }
            
            let realmResults = realm.objects(University.self)
            return completion(realmResults.map() { $0 })
        }
    }
}
