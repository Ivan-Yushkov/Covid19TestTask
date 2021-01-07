//
//  MainVCPresenter.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation

import RxSwift
import CoreLocation

protocol PresenterMainVCProtocol: class {
    func getCurrentSummary()
    func getCount() -> Int
}

class PresenterMainViewController: PresenterMainVCProtocol {
    
    
    private var view: MainViewControllerProtocol
    private var networking: NetworkServiceProtocol
    private let disposeBag = DisposeBag()
    private var countries = [CountryData]()
    
    init(view: MainViewControllerProtocol, networking: NetworkServiceProtocol) {
        self.view = view
        self.networking = networking
    }
    
    func getCurrentSummary() {
        view.showActivityIndicator(message: "Loading")
        _ = networking.getSummaryWithUrl()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                //self?.view.stopRefreshing()
                switch event {
                case .success(let (currentSummary, global)):
                    self?.view.updateInterface(currentSummary: currentSummary, global: global)
                    self?.countries = currentSummary
                    self?.view.hideActivityIndicator()
                case .failure(let error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getCount() -> Int {
        return countries.count
    }

}
