//
//  ViewController.swift
//  Lap API
//
//  Created by Abu FaisaL on 09/04/1443 AH.
//

import UIKit
class FactsResponse : Codable {
    var facts : [String]
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        facts()
    }

    func facts (){
        var factsDogURL = URLComponents()
        
        factsDogURL.scheme = "https"
        factsDogURL.host = "dog-api.kinduff.com"
        factsDogURL.path = "/api/facts?number=5"
        
//        let factsDogQuery = URLQueryItem(name: "facts", value: "")
//        factsDogURL.queryItems = [factsDogQuery]
//
        // Start of URL Request
      
           let factsDogRequestURL = factsDogURL.url!
        let factsDogRequest = URLRequest(url: factsDogRequestURL)
                 
            // End of URL Request
             
            // Start URL SESSION
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.allowsCellularAccess = false
            sessionConfig.httpShouldSetCookies = false
            let factsDogSession = URLSession(configuration: sessionConfig)
            // Trigger Session Data Task method (Response)
            let fetchDataTask = factsDogSession.dataTask(with: factsDogRequest) {
    (data:  Data?, response: URLResponse?, err: Error?) in
                    print(String(data: data!, encoding: .utf8))
                do {
                let jsonDecoder = JSONDecoder()
                let facts = try jsonDecoder.decode(FactsResponse.self, from: data!)
                    print(facts.facts)
                } catch {
                    print(err)
                }
        
        
        
    }
        fetchDataTask.resume()
}

}
