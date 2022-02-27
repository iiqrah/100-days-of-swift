//
//  Order.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

class Order: ObservableObject {

    static let types = ["Vanilla", "Chocolate", "Strawberry", "Raibow"]

    @Published var type = 0
    @Published var quantity = 3

    @Published var hasSpecialRequest = false{
        didSet{
            if hasSpecialRequest == false {
                wantExtraFrosting = false
                wantExtraSprinkles =  false
            }
        }
    }


    @Published var wantExtraFrosting = false
    @Published var wantExtraSprinkles = false

    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zip = ""

    var hasValidAddress : Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || state.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }

    var cost : Double {

        // $2 per cake
        var cost = Double(quantity) * 2

        // $0.5 extra for complicated cakes
        cost += Double(quantity) / 2

        // $1/cake for extra frosting
        if wantExtraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if wantExtraSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
}
