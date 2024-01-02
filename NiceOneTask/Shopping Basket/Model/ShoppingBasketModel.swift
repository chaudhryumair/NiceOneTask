//
//  ShoppingBasketModel.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 02/01/2024.
//

import Foundation

// MARK: - ShoppingBasketModel
struct ShoppingBasketModel: Codable {
    var success: Int?
    var error: [JSONAny]?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var cart: Cart?
    var recommendedProducts: RecommendedProducts?

    enum CodingKeys: String, CodingKey {
        case cart
        case recommendedProducts = "recommended_products"
    }
}

// MARK: - Cart
struct Cart: Codable {
    var products: [CartProduct]?
    var vouchers: [JSONAny]?
    var couponStatus, coupon: String?
    var voucherStatus: JSONNull?
    var voucher: String?
    var rewardStatus: Int?
    var reward: String?
    var totals: [Total]?
    var offer: String?
    var offerAverage: Int?
    var total: String?
    var totalRaw: Double?
    var totalProductCount: Int?

    enum CodingKeys: String, CodingKey {
        case products, vouchers
        case couponStatus = "coupon_status"
        case coupon
        case voucherStatus = "voucher_status"
        case voucher
        case rewardStatus = "reward_status"
        case reward, totals, offer
        case offerAverage = "offer_average"
        case total
        case totalRaw = "total_raw"
        case totalProductCount = "total_product_count"
    }
}

// MARK: - CartProduct
struct CartProduct: Codable {
    var key: String?
    var thumb: String?
    var name, productID, categoryID, manufacturerName: String?
    var model: JSONNull?
    var option: [JSONAny]?
    var quantity, minimum, maximum: String?
    var stock: Bool?
    var reward: String?
    var priceNoTax: Int?
    var priceNoTaxFormatted, price, priceFormatted, total: String?
    var totalFormatted: String?
    var avaialbleQuantity: Int?
    var crossDiscount: JSONNull?
    var enName, eventPrice: String?
    var special: [PurpleSpecial]?
    var categoryHierarchy: [PurpleCategoryHierarchy]?

    enum CodingKeys: String, CodingKey {
        case key, thumb, name
        case productID = "product_id"
        case categoryID = "category_id"
        case manufacturerName = "manufacturer_name"
        case model, option, quantity, minimum, maximum, stock, reward
        case priceNoTax = "price_no_tax"
        case priceNoTaxFormatted = "price_no_tax_formatted"
        case price
        case priceFormatted = "price_formatted"
        case total
        case totalFormatted = "total_formatted"
        case avaialbleQuantity = "avaialble_quantity"
        case crossDiscount = "cross_discount"
        case enName = "en_name"
        case eventPrice = "event_price"
        case special
        case categoryHierarchy = "category_hierarchy"
    }
}

// MARK: - PurpleCategoryHierarchy
struct PurpleCategoryHierarchy: Codable {
    var categoryID, name, enName: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case enName = "en_name"
    }
}

// MARK: - PurpleSpecial
struct PurpleSpecial: Codable {
    var discountRatio, originalPrice, priceFormated: String?
    var originalPriceWithoutCurrency, priceWithoutCurrency: Double?

    enum CodingKeys: String, CodingKey {
        case discountRatio = "discount_ratio"
        case originalPrice = "original_price"
        case priceFormated = "price_formated"
        case originalPriceWithoutCurrency, priceWithoutCurrency
    }
}

// MARK: - Total
struct Total: Codable {
    var title, text, value, code: String?
}

// MARK: - RecommendedProducts
struct RecommendedProducts: Codable {
    var products: [RecommendedProductsProduct]?
    var ad: Ad?

    enum CodingKeys: String, CodingKey {
        case products
        case ad = "Ad"
    }
}

// MARK: - Ad
struct Ad: Codable {
    var filters: [JSONAny]?
}

// MARK: - RecommendedProductsProduct
struct RecommendedProductsProduct: Codable {
    var id: String?
    var thumb: String?
    var priceFormated, priceWithoutCurrency: String?
    var price: Double?
    var name, enName, description, sku: String?
    var isbn: Isbn?
    var hasOption: Bool?
    var categoryID, quantity: Int?
    var special: [FluffySpecial]?
    var manufacturer: String?
    var isNew, isExclusive: Bool?
    var order: Int?
    var score: JSONNull?
    var eventPrice: String?
    var rating: Double?
    var totalReviews: String?
    var seoURLAr, seoURLEn: String?
    var shareURL: String?
    var options: [Option]?
    var categoryHierarchy: [FluffyCategoryHierarchy]?
    var tag: Tag?

    enum CodingKeys: String, CodingKey {
        case id, thumb
        case priceFormated = "price_formated"
        case priceWithoutCurrency, price, name
        case enName = "en_name"
        case description, sku, isbn
        case hasOption = "has_option"
        case categoryID = "category_id"
        case quantity, special, manufacturer
        case isNew = "is_new"
        case isExclusive = "is_exclusive"
        case order, score
        case eventPrice = "event_price"
        case rating
        case totalReviews = "total_reviews"
        case seoURLAr = "seo_url_ar"
        case seoURLEn = "seo_url_en"
        case shareURL = "share_url"
        case options
        case categoryHierarchy = "category_hierarchy"
        case tag
    }
}

// MARK: - FluffyCategoryHierarchy
struct FluffyCategoryHierarchy: Codable {
    var categoryID: Int?
    var name, enName: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case enName = "en_name"
    }
}

enum Isbn: String, Codable {
    case empty = ""
    case the607845012375 = "607845012375"
    case the8681217213173 = "8681217213173"
}

// MARK: - Option
struct Option: Codable {
    var optionID, productOptionID: Int?
    var type: String?
    var optionRequired: Int?
    var name, enName: String?
    var optionValue: [OptionValue]?

    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case productOptionID = "product_option_id"
        case type
        case optionRequired = "required"
        case name
        case enName = "en_name"
        case optionValue = "option_value"
    }
}

// MARK: - OptionValue
struct OptionValue: Codable {
    var productOptionVariantID, quantity: Int?
    var image: String?
    var hexColor, sku, price: String?
    var priceFormated: PriceFormated?
    var eventPrice, name, enName: String?

    enum CodingKeys: String, CodingKey {
        case productOptionVariantID = "product_option_variant_id"
        case quantity, image
        case hexColor = "hex_color"
        case sku, price
        case priceFormated = "price_formated"
        case eventPrice = "event_price"
        case name
        case enName = "en_name"
    }
}

enum PriceFormated: String, Codable {
    case sar0 = "SAR 0"
    case sar17825 = "SAR 178.25"
    case sar5520 = "SAR 55.20"
}

// MARK: - FluffySpecial
struct FluffySpecial: Codable {
    var discountRatio, originalPrice, priceFormated: String?
    var originalPriceWithoutCurrency: Double?
    var priceWithoutCurrency, dateStart, dateEnd: Int?
    var tagName, tagColor: String?

    enum CodingKeys: String, CodingKey {
        case discountRatio = "discount_ratio"
        case originalPrice = "original_price"
        case priceFormated = "price_formated"
        case originalPriceWithoutCurrency, priceWithoutCurrency
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case tagName = "tag_name"
        case tagColor = "tag_color"
    }
}

// MARK: - Tag
struct Tag: Codable {
    var text, backgroundColor: String?

    enum CodingKeys: String, CodingKey {
        case text
        case backgroundColor = "background_color"
    }
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
