//
//  UniversityListInteractor.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

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
            output.didFinishFetchingUniversities(nil, error: APIError.badUrl)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard let welf = self else { return }
            
            if let error {
                welf.output.didFinishFetchingUniversities(nil, error: CustomError(title: "Error", message: error.localizedDescription))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                welf.output.didFinishFetchingUniversities(nil, error: APIError.serverFailure)
                return
            }
            
            guard let data else {
                welf.output.didFinishFetchingUniversities(nil, error: APIError.emptyData)
                return
            }
            
            do {
                let items = try JSONDecoder().decode([University].self, from: data)
                welf.output.didFinishFetchingUniversities(items, error: nil)
            }
            catch {
                welf.output.didFinishFetchingUniversities(nil, error: APIError.parsingError)
            }
        }.resume()
    }
}
