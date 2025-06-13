//
//  CheckoutView.swift
//  MerchantSdkDemo
//
//  Created by Lokesh Joshi on 29/02/24.
//

import SwiftUI
import SnapmintMerchantSdk

struct CheckoutView: View {
    @StateObject private  var viewModel = CheckoutViewModel()
    @State private var result: SnapmintOrderResult? = nil
    @State private var baseUrl: String = ""
    @State private var mobile: String = ""
    @State private var merchantId: String = ""
    @State private var merchantPassword: String = ""
    @State private var orderId: String = "MELORRAL-\(arc4random())"
    @State private var orderValue: String = "2000"
    @State private var sucUrl = ""
    @State private var failUrl = ""
    @State private var email: String = ""
    @State private var sku: String = "abdx123"
    @State private var price: String = "1000"
    @State private var quantity: String = "2"
    @State private var imageUrl: String = "https://d2zjkrkqbjijvy.cloudfront.net/product_assets/images/000/014/448/large/81wA58_qBAL._SL1500_.jpg?1609923474"
    @State private var url: URL?
    @State private var isOn = true
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading, spacing:2){
                    Text("Base Url*")
                    TextField("Enter Base url", text: $baseUrl)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Mobile*")
                    TextField("Enter Phone Number", text: $mobile)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding(.bottom, 10)
                    
                    Text("Merchant Id*")
                    TextField("Enter Merchant ID", text: $merchantId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding(.bottom, 10)
                    
                    Text("Merchant Password*")
                    TextField("Enter Merchant Password", text: $merchantPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding(.bottom, 10)
                    
                    Text("Order Id*")
                    TextField("Enter Order ID", text: $orderId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Order Value*")
                    TextField("Enter Order Value", text: $orderValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Order Value*")
                    TextField("Enter Order Value", text: $orderValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Merchant Confirmation URL*")
                    TextField("Enter Merchant Confirmation URL", text: $sucUrl)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Merchant Failure URL*")
                    TextField("Enter Merchant Failure URL", text: $failUrl)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Email*")
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("SKU*")
                    TextField("Enter SKU", text: $sku)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Unit Price*")
                    TextField("Enter Unit Price", text: $price)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Quantity*")
                    TextField("Enter Quantity", text: $quantity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("Image Url*")
                    TextField("Enter Image url", text: $imageUrl)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    Toggle("Enable OTP Bypass", isOn: $isOn)
                                    .padding()
                    HStack{
                        Spacer()
                        // "Check Out" Button
                        Button(action: {
                            print("Proceed to checkout")
                            viewModel.getCheckoutLink(baseUrl: baseUrl, checkoutJson: getCheckoutJson())
                        }) {
                            Text("Check Out")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Result: \(result?.status ?? "None")")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Message: \(result?.message ?? "None")")
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            
            if viewModel.isLoading {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                    Text("Please wait...")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(20)
                .background(Color.black.opacity(0.8))
                .cornerRadius(12)
            }
            
            NavigationLink(
                destination: checkoutView,
                isActive: Binding(
                    get: { url != nil },
                    set: { isActive in
                        if !isActive {
                            url = nil
                        }
                    }
                )
            ) {
                EmptyView()
            }
        }
        .onChange(of: viewModel.checkoutResponseModel) { newValue in
            if let response = newValue {
                if let stringUrl = response.url {
                    self.url = URL(string: stringUrl)
                }
            }
        }
    }
    
    @ViewBuilder
    private var checkoutView: some View {
        if let url = url {
            SnapmintCheckoutView(url: url,result: $result)
        } else {
            // fallback to prevent crash
            EmptyView()
        }
    }
    
    func getCheckoutJson() -> [String: Any] {
        let jsonObject: [String: Any] = [
            "merchantOrderId": "\(orderId)",
            "orderValue": "\(orderValue)",
            "ip": "0.0.0.0",
            "products": [
                [
                    "sku": "\(sku)",
                    "name": "Bold Show Diamond Earrings",
                    "unitPrice": "\(price)",
                    "quantity": "\(quantity)",
                    "itemUrl": "https://example.com/product1",
                    "imageUrl": "\(imageUrl)",
                    "udf1": "1.910 g",
                    "udf2": "7147",
                    "udf3": "",
                ]
            ],
            "merchantId": "\(merchantId)",
            "merchantConfirmationUrl": "\(sucUrl)",
            "merchantFailureUrl": "\(failUrl)",
            "mobile": "\(mobile)",
            "email": "\(email)",
            "merchantPassword": "\(merchantPassword)",
            "otpBypass": isOn
        ]
        return jsonObject
    }
}
