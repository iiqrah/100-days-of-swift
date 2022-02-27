//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order

    var body: some View {
        ScrollView{

            VStack{

                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) {image in
                    image
                        .resizable()

                    .scaledToFit()

                }
            placeholder:{
                ProgressView()
            }
            .frame(height: 250)


                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order", action: {})
                    .padding()


            }
        }

        .navigationTitle("Check-out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

