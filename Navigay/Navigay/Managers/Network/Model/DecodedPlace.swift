//
//  DecodedPlace.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import Foundation

enum DecodedPlaceType {
    case bar, club, resotant
}

struct DecodedPlace {
    let id: Int
    let lastUpdate: String
    
    let name: String
    
    let city: String?
    let region: String?
    let country: String
    
    let address: String
    let lat: Double
    let lon: Double
    
    let type: DecodedPlaceType
    
    let about: String?
    
    let img: String?
    let images: [String]?
    
    let tel: String?
    let www: String?
    let facebook: String?
    let instagram: String?
    
    let workingHours: [DecodedWorkingHour]?
    let workingHoursDescription: String?
    
    //comments
    
    let events: [DecodedEvent]?
}


struct DecodedWorkingHour: Codable {
    let day: DecodedWeekDay
    let startTime: String
    let finishTime: String
}

enum DecodedWeekDay: String, Codable, CaseIterable {
    case mo, tu, we, th, fr, sa, so
}
