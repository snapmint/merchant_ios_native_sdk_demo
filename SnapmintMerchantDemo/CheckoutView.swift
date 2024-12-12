//
//  CheckoutView.swift
//  MerchantSdkDemo
//
//  Created by Lokesh Joshi on 29/02/24.
//

import SwiftUI
import SnapmintMerchantSdk

struct CheckoutView: View {
    @State private var result: SnapmintOrderResult? = nil
    
    //add checkout url here
    @State private var baseUrl: String = ""
    @State private var mobile: String = "9012345678"
    @State private var merchantId: String = "351"
    @State private var merchantKey: String = "CqBnaVCm"
    @State private var merchantToken: String = "C84NNfuS"
    @State private var storeId: String = "1"
    @State private var orderId: String = "MELORRAL-\(arc4random())"
    @State private var orderValue: String = "7000"
    @State private var sucUrl = "http://www.vijaysales.com/success"
    @State private var failUrl = "http://www.vijaysales.com/failed"
    @State private var fullName: String = "GIRIDHAR Crawley"
    @State private var email: String = "qwerty@gmail.com"
    @State private var billingFullName: String = "GIRIDHAR Crawley"
    @State private var billingAddressLine1: String = "GIRIDHAR EVENT ORGANRING"
    @State private var billingCity: String = "Mumbai"
    @State private var billingZip: String = "400076"
    @State private var shippingFullName: String = "GIRIDHAR Crawley"
    @State private var shippingAddressLine1: String = "GIRIDHAR EVENT ORGANRING"
    @State private var shippingCity: String = "Mumbai"
    @State private var shippingZip: String = "400076"
    @State private var sku: String = "abdx123"
    @State private var price: String = "1000"
    @State private var quantity: String = "5"
    @State private var imageUrl: String = "https://d2zjkrkqbjijvy.cloudfront.net/product_assets/images/000/014/448/large/81wA58_qBAL._SL1500_.jpg?1609923474"
    
    var body: some View {
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
                
                Text("Merchant Key*")
                TextField("Enter Merchant Key", text: $merchantKey)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.alphabet)
                    .padding(.bottom, 10)
                
                Text("Merchant Token*")
                TextField("Enter Merchant Token", text: $merchantToken)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.alphabet)
                    .padding(.bottom, 10)
                
                Text("Store Id*")
                TextField("Enter Store ID", text: $storeId)
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
                
                Text("Full Name*")
                TextField("Enter Full Name", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Email*")
                TextField("Enter Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Billing Full Name*")
                TextField("Enter Billing Full Name", text: $billingFullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Billing Address Line1*")
                TextField("Enter Billing Address Line1", text: $billingAddressLine1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Billing City*")
                TextField("Enter Billing City", text: $billingCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Billing Zip*")
                TextField("Enter Billing Zip", text: $billingZip)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Shipping Full Name*")
                TextField("Enter Shipping Full Name", text: $shippingFullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Shipping Address Line1*")
                TextField("Enter Shipping Address Line1", text: $shippingAddressLine1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Shipping City*")
                TextField("Enter Shipping City", text: $shippingCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Shipping Zip*")
                TextField("Enter Shipping Zip", text: $shippingZip)
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
                
                HStack{
                    Spacer()
                    let checkoutModel: [String: Any] = getCheckoutJson()
                    NavigationLink(destination: SnapmintCheckoutView(checkoutJson: checkoutModel, baseUrl: baseUrl,result: $result)) {
                        Text("Check Out")
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
    }
    
    func getCheckoutJson() -> [String: Any] {
        let jsonObject: [String: Any] = [
            //            "merchant_key": "cQ_kvgB0",
            "merchant_key": "\(merchantKey)",
            //            "merchant_token": "UOYY0R_n",
            "merchant_token": "\(merchantToken)",
            //            "merchant_id": "1456",
            "merchant_id": "\(merchantId)",
            "merchant_confirmation_url": "\(sucUrl)",
            "merchant_failure_url": "\(failUrl)",
            "mobile": "\(mobile)",
//            "mobile": "9910008259",
            "store_id": "\(storeId)",
            "order_id": "\(orderId)",
            "order_value": "\(orderValue)",
            "udf1": "1.91",
            "udf2": "7147",
            "full_name": "\(fullName)",
            "email": "\(email)",
            "billing_full_name": "\(billingFullName)",
            "billing_address_line1": "\(billingAddressLine1)",
            "billing_city": "\(billingCity)",
            "billing_zip": "\(billingZip)",
            "shipping_full_name": "\(shippingFullName)",
            "shipping_address_line1": "\(shippingAddressLine1)",
            "shipping_city": "\(shippingCity)",
            "shipping_zip": "\(shippingZip)",
            "deviceType": "ios",
            "products": [
                [
                    "sku": "\(sku)",
                    "name": "Bold Show Diamond Earrings",
                    "quantity": "\(quantity)",
                    "unit_price": "\(price)",
                    "udf1": "1.910 g",
                    "udf2": "7147",
                    "udf3": "",
                    "image_url": "\(imageUrl)"
                ]
            ]
        ]
        
        return jsonObject
    }
}

#Preview {
    CheckoutView()
}
