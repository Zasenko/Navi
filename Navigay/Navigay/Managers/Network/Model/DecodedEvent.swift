//
//  DecodedEvent.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import Foundation

//enum DecodedEventType: String, Codable {
//    case standart, premium
//}

struct DecodedEvent: Identifiable {
    let id: Int
    let lastUpdate: String
    
    let name: String
    let cover: String
    
    let start: String
    let finish: String
    
    let city: String?
    let region: String?
    let country: String
    
    let latitude: Double
    let longitude: Double
    let address: String
    
    var placeId: String? // todo???
    
    //let type: EventType
    //let tags: [String] = [] //sex, poolparty, ...
    
    let tel: String?
    let www: String?
    let facebook: String?
    let instagram: String?
    
    var about: String?
    var lineUp: String?
    var tickets: String?
    //comments
}
