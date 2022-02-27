//
//  AddAddressView.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

struct AddAddressView: View {

    @ObservedObject var order: Order

    var body: some View {
            Form{

            Section{


                    TextField("Name ", text: $order.name)
                    TextField("Street address ", text: $order.streetAddress)
                    TextField("City ", text: $order.city)
                    TextField("State ", text: $order.state)
                    TextField("Zip Code ", text: $order.zip)


            }

            Section{
                NavigationLink{

                    CheckoutView(order: order)
                }
            label: {

                Text("Proceed to check-out")
            }
            }.disabled(order.hasValidAddress == false)

        }

            .navigationTitle("Delivery Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView(order: Order())
    }
}
