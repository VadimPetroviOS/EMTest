//
//  WelcomePresenter.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject  {
    func viewDidLoaded()
    func didLoad(data: WelcomeEntity)
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    let router: WelcomeRouterProtocol
    let interactor: WelcomeInteractorProtocol
    
    
    
    init(interactor: WelcomeInteractorProtocol, router: WelcomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func viewDidLoaded() {
        interactor.loadData()
    }
    
    
    func didLoad(data: WelcomeEntity) {
        view?.showData(data: data)
    }
    
}
