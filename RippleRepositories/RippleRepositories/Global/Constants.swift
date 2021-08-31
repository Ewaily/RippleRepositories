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
}

struct Colors {
    static let SEARCH_BUTTON_BACKGROUND = #colorLiteral(red: 0, green: 0.6174670458, blue: 0.5865109563, alpha: 1)
    static let DARK_SHADE = UIColor(named: "DarkShade")
    static let GRAY = UIColor(named: "Gray")
    static let WHITE = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
}

struct Constants {
    static let SEARCH_BUTTON_CORNER_RADIUS: CGFloat = 5.0
}
