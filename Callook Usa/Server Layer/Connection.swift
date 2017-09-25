//
//  Connection.swift
//  Callook Usa
//
//  Created by Сергей Митрофанов on 22/09/2017.
//  Copyright © 2017 Wipline. All rights reserved.
//

import Foundation

class Connection {
    private static let baseURL = "https://callook.info/" // /[Callsign]/json
    
    class func request(callsign: String, completion: @escaping ([Information]) -> ()) {
        guard let url = URL(string: baseURL + callsign + "/json") else { return }
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                var callsigns = [Information]()
                
                guard let data = data else { return }
                guard error == nil else { return }
                
                do {
                    let json = try JSONDecoder().decode(Information.self, from: data)
                    callsigns.append(json)
                } catch _ {
                    print("Decoding error")
                }
                completion(callsigns)
        }.resume()
}
}
}
