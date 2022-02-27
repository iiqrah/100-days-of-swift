//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var order = Order()

    var body: some View {
        NavigationView{

            Form {

                Section{

                    VStack (alignment: .leading){
                        Text("Flavour:")
                        Picker("Flavour: ", selection: $order.type){
                            ForEach(Order.types.indices){
                                Text(Order.types[$0])
                            }
                        }.pickerStyle(.segmented)

                    }

                    Stepper("Quantity: \(order.quantity) cupcakes ", value: $order.quantity, in: 3...20)

                }

                Section{

                    Toggle("Any special requests? ", isOn: $order.hasSpecialRequest.animation())

                    if order.hasSpecialRequest {

                        Toggle("Extra Frostring ", isOn: $order.wantExtraFrosting)

                        Toggle("Extra Sprinkles ", isOn: $order.wantExtraSprinkles)

                    }
                }

                Section{
                    NavigationLink{

                        AddAddressView(order: order)
                    }
                label: {

                    Text("Deliver Details")
                }
                }


            }

            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
