//
//  API.swift
//  MKB Test
//
//  Created by Константин Шмондрик on 20.04.2022.


//API:
//http request: POST
//url: https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44
//json body: {\"uid\":\"563B4852-6D4B-49D6-A86E-B273DD520FD2\",\"type\":\"ExchangeRates\",\"rid\":\"BEYkZbmV\"}
//Request headers:
//User-Agent=Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private);Content-Type=application/json;Accept=application/json


//

import Foundation
import Alamofire

final class RatesAPI {
    
    let url1 = "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44"
    
    let baseUrl = "https://alpha.as50464.net:29870"
    let rid = "BEYkZbmV"
    let uid = "563B4852-6D4B-49D6-A86E-B273DD520FD2"
    let type = "ExchangeRates"
    
    let headers: HTTPHeaders = [
        "User-Agent": "Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)",
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    
    
    func postRates( completion: @escaping([RateData])->()) {
 
        let parameters: [String : Any] = [
            "r": rid,
            "d": uid,
            "t": type,
            "v": "44",
        ]
        
        AF.request(url1, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON {response in
            
            print(response.data?.prettyJSON ?? "")
            
            guard let jsonData = response.data else { return }
            
            do {
                let rateData = try JSONDecoder().decode(RateData.self, from: jsonData)
                
                let rates = rateData
                
                completion([rates])
            } catch {
                print(error)
            }
        }
    }
    
}
