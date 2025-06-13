//
//  CheckoutViewModel.swift
//  SnapmintMerchantDemo
//
//  Created by Lokesh Joshi on 13/06/25.
//
import Foundation

class CheckoutViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var checkoutResponseModel: CheckoutResponseModel?
    
    func getCheckoutLink(baseUrl:String, checkoutJson: [String: Any]){
        isLoading = true
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: checkoutJson) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Print cURL command
        if let curlCommand = curlRequest(from: request) {
            print("cURL command:")
            print(curlCommand)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            do {
                let decoder = JSONDecoder()
                let checkoutResponseModel = try decoder.decode(CheckoutResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.checkoutResponseModel = checkoutResponseModel
                    self.isLoading = false
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }.resume()
    }
    
    func curlRequest(from request: URLRequest) -> String? {
        guard let url = request.url else { return nil }
        var command = "curl -X \(request.httpMethod ?? "GET") '\(url.absoluteString)'"
        
        if let headers = request.allHTTPHeaderFields {
            for (key, value) in headers {
                command += " -H '\(key): \(value)'"
            }
        }
        
        if let body = request.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            command += " -d '\(bodyString)'"
        }
        
        return command
    }
}
