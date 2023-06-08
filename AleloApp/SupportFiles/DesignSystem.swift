
import Foundation
import UIKit
    
public enum Color {
    static let darkGray = UIColor(red: 29.0, green: 29.0, blue: 31.0, alpha: 1)
    static let darkBlue = UIColor(red: 0.004, green: 0.004, blue: 0.157, alpha: 1)
    static let lightBlue = UIColor(red: 0.33, green: 0.31, blue: 0.64, alpha: 1)
    static let lightPurple = UIColor(red: 0.59, green: 0.55, blue: 0.94, alpha: 1)
}

public enum Margin: CGFloat {
    case none = 0
    case ds_2_px = 2
    case ds_20_px = 20
}


public enum Font {
    case title
    case subtitle
    case description
}
