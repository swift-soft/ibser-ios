import Foundation
import UIKit

enum ImageNamePredifined: String {
    case houseIcon = "houseIcon"
    case transcactionIcon = "transactionIcon"
    case walletIcon = "walletIcon"
    case profileIcon = "profileIcon"
}

extension UIImage {
    static func getImage(_ predifined: ImageNamePredifined) -> UIImage {
        return UIImage(named: predifined.rawValue) ?? UIImage(systemName: predifined.rawValue) ?? UIImage()
    }
}
