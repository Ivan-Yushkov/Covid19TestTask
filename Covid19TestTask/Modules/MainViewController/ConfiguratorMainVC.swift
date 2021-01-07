//
//  Configurator.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation

class ConfiguratorMainVC {
    func configure(
        view: MainViewController,
        networking: NetworkServiceProtocol) {
        let presenter = PresenterMainViewController(view: view, networking: networking)
        view.presenter = presenter
    }
}
