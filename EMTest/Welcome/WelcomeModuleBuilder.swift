//
//  WelcomeModuleBuilder.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import UIKit

class WelcomeModuleBuilder {
    static func build() -> ViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)
        let viewController = ViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.presenter = presenter
        
        return viewController
    }
}
