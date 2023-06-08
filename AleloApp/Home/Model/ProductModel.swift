import Foundation

public struct Product: Codable {
    let name, style, codeColor, colorSlug: String
    let color: String
    let onSale: Bool
    let regularPrice, actualPrice, discountPercentage, installments: String
    let image: String
    let sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case name, style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments, image, sizes
    }
}

public struct Size: Codable {
    let available: Bool
    let size, sku: String
}
