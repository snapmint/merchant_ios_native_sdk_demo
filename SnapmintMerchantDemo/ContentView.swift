//
//  ContentView.swift
//  MerchantSdkDemo
//
//  Created by Lokesh Joshi on 20/02/24.
//

import SwiftUI
import SnapmintMerchantSdk

struct ContentView: View {
    let merchant = "1616/snap_ketch.json"
    //    let merchant = "2435/snap_nnow.json"
    @State private var orderValue: Double = 1571.0
    @State private var inputOrderValue: String = "1571"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Order Value", text: $inputOrderValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Button(action: {
                    if let number = Int(inputOrderValue), number >= 200 {
                        orderValue = Double(number)
                    } else {
                        print("order Value is less than to 200")
                    }
                    
                }) {
                    Text("Chnage order Value")
                        .frame(height: 36)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                SnapmintEmiInfoView(orderValue: orderValue, merchantLink: merchant, isEnable: true,environment: SnapmintEnvironment.qa)
                Spacer()

                NavigationLink(destination: CheckoutView()) {
                    Text("Check Out")
                        .frame(width: 200,height: 36)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
    }
}



#Preview {
    ContentView()
}
