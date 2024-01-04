//
//  FilePicker.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 04/01/2024.
//

import Foundation

class FilePicker {
    static let shared  = FilePicker()
    private init(){
    }
    private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
        let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
        return jsonData
            }
        } catch {
        print(error)
        }
        return nil
    }
    private func parse(jsonData: Data) -> [RecommendedProductsProduct] {
        do {
            let decodedData = try JSONDecoder().decode(ShoppingBasketModel.self, from: jsonData)
            return decodedData.data?.recommendedProducts?.products ?? []
        } catch {
            print("decode error")
        }
        return nil
    }
}
