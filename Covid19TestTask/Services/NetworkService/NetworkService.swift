//
//  NetworkService.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation
import Alamofire
import RxSwift
import CoreLocation



protocol NetworkServiceProtocol: class {
    func getSummaryData() -> Single<[CountryData]>
    func getSummaryWithUrl() -> Single<([CountryData], GlobalData)>
}

class NetworkServiceImp: NetworkServiceProtocol {
    
    //method to get data with alamofire
    func getSummaryData() -> Single<[CountryData]> {
        let data = [String: Any]()
        let manager = SessionManager()
        let routing = CovidRouter.getSummaryData(data)
        return Single.create { (single) -> Disposable in
            let request = manager.request(routing).responseData { (response) in
                let statusCode = response.response?.statusCode
                print(statusCode)
                switch response.result {
                case .success(let value):
                    do {
                        print(value)
                        let jsonObject = try JSONDecoder().decode(SummaryData.self, from: value)
                        var currentSummary = [CountryData]()
                        for countryData in jsonObject.countries {
                            guard let country = CountryData(fromData: countryData) else { return }
                            currentSummary.append(country)
                        }
                        single(.success(currentSummary))
                    } catch let error {
                        single(.failure(error))
                    }
                case .failure(let error):
                    single(.failure(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    //method to get data with URLSession
    func getSummaryWithUrl() -> Single<([CountryData], GlobalData)> {
        return Single.create { (single) -> Disposable in
            let url = URL(string: Covid.summaryPath)!
            let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                guard let data = data, let response = response else { return }
                print(response)
                print(data)
                do {
                    let decoder = JSONDecoder()
                    let jsonObject = try decoder.decode(SummaryData.self, from: data)
                    var currentSummary = [CountryData]()
                    for countryData in jsonObject.countries {
                        guard let country = CountryData(fromData: countryData) else { return }
                        currentSummary.append(country)
                    }
                    let global = GlobalData(global: jsonObject.global)
                    single(.success((currentSummary, global)))// rx transmit data for table view
                } catch {
                    single(.failure(error))
                }
            }.resume()
            return Disposables.create {
                
            }
        }
    }
}



