//
//  WelcomeInteractor.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadData()
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenterProtocol?
    
    let welcomeService = WelcomeService()
    
    func loadData() {
        welcomeService.parse { [weak self] data in
            self?.presenter?.didLoad(data: data)
        }
        
        
    }
}
