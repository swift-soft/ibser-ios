//
//  MainROutes.swift
//  Rickapp
//
//  Created by Wojciech Mokwiński on 28/08/2023.
//

import Foundation
import UIKit

enum MainRoutes: Route {
    case menu

    var screen: UIViewController {
        switch self {
        case .menu:
            return buildMenuViewController()
        }
    }
    
    private func buildMenuViewController() -> UIViewController {
        let controller = MenuViewController()
        return controller
    }
}

