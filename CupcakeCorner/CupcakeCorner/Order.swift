//
//  Order.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

class Order: ObservableObject, Codable {

    enum CodingKeys: CodingKey {

        case type, quantity, wantExtraFrosting, wantExtraSprinkles, name, streetaddress, city, state, zip

    }

    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]

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

    //Challenge 1
    var hasValidAddress : Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || state.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty {
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


    init(){}

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)


        try container.encode(wantExtraFrosting, forKey: .wantExtraFrosting)
        try container.encode(wantExtraSprinkles, forKey: .wantExtraSprinkles)


        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetaddress)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(zip, forKey: .zip)

        //try container.encode(cost, forKey: .cost)
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        wantExtraFrosting = try container.decode(Bool.self, forKey: .wantExtraFrosting)
        wantExtraSprinkles = try container.decode(Bool.self, forKey: .wantExtraSprinkles)


        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetaddress)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        zip = try container.decode(String.self, forKey: .zip)

        //cost = try container.decode(Double.self, forKey: .cost)

    }
}
