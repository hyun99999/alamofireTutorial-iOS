//
//  Network.swift
//  alamofireTutorial-iOS
//
//  Created by kimhyungyu on 2021/02/07.
//

import Foundation
import Alamofire

class Network {
    let apiKey = "4bf88fc3-f88a-4cfa-8a1d-790692eb1f38"
    
    static let shared = Network()
    
    class var baseURL : String {
        return "https://api.thecatapi.com"
    }
    
    static var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [:]
        configuration.httpAdditionalHeaders?["Accept"] = "application/json"
        return Alamofire.Session(configuration: configuration)
    }()
    

    func getRandomCatPicture(parameters : Parameters, completion : @escaping(_ result : Data) -> (Void)){
        let url = "/v1/images/search"
        let parameters : Parameters = parameters
        Network.sessionManager.request(Network.baseURL + url, method: .get, parameters:  parameters).responseJSON { (response) in
            switch response.result{
            case .success(_):
                completion(response.data!)
                break
            case .failure(let error):
                print(error)
                print(response.data!)
                break
            }
        }
    }
}
