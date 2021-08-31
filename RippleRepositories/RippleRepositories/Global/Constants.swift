//
//  Constants.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

enum Storyboards : String {
    case REPOSITORIES    = "Repositories"
}

struct Strings {
    static let SEARCH = "Search"
    static let FIND_A_REPOSITORY = "Find a repository..."
    static let REPOSITORIES_LIST = "Repositories List"
    static let INVALID_SEARCH_QUERY = "Invalid search query"
}

struct Fonts {

    static let TITLE_FONT = Fonts.getFont(style: .Semibold, size: 20)

    enum Style: String {
        case Regular
        case Medium
        case Light
        case Bold
        case Semibold
    }
    
    static func getFont(style: Style, size: CGFloat) -> UIFont {
        return UIFont(name: "SFUIText-\(style.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
}

struct Colors {
    static let SEARCH_BUTTON_BACKGROUND = UIColor(named: "Ripple")
    static let DARK_SHADE = UIColor(named: "DarkShade")
    static let GRAY = UIColor(named: "Gray")
    static let WHITE = UIColor(named: "White")
}

struct Dimensions {
    static let APP_CORNER_RADIUS: CGFloat = 5.0
    static let APP_BORDER_WIDTH : CGFloat = 0.3
}

struct Images {
    static let NO_INTERNET_IMAGE = UIImage(named: "noInternectConnection")
    static let NO_SEARCH_RESULTS = UIImage(named: "noResultFound")
}
