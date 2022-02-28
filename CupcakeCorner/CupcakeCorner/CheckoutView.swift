//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order

    @State private var checkoutMessage = ""
    @State private var isCheckoutMessageShowing = false

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

                Button("Place Order"){
                    Task{
                        await placeOrder()
                    }
                }
                    .padding()


            }
        }

        .navigationTitle("Check-out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order status", isPresented: $isCheckoutMessageShowing){

            Button("OK"){}
        }message:{

            Text(checkoutMessage)
        }
    }

    func placeOrder() async {

        //1. Encoding data in jSON format
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("Failed to encode order")
            return
        }
        //2. Set up network call request to send over JSON encoded data
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        //3. Run the request and process the response
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            checkoutMessage = "Your order for \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            isCheckoutMessageShowing = true
        }
        catch {
            print("Checkout failed.")
            //Challenge 2
            checkoutMessage = "Your order failed, please try again."
            isCheckoutMessageShowing = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

