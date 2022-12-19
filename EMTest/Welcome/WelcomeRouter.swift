//
//  WelcomeRouter.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject  {
    
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var presenter: WelcomePresenterProtocol?
}
