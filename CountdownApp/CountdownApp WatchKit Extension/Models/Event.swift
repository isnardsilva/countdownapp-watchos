//
//  Event.swift
//  CountdownApp WatchKit Extension
//
//  Created by Isnard Silva on 15/06/20.
//  Copyright © 2020 Isnard Silva. All rights reserved.
//

import Foundation
import UIKit

enum Category: String {
    case study = "Study"
    case vacation = "Vacation"
    case birthday = "Birthday"
    case event = "Event"
    
    var eventImage: UIImage? {
        switch self {
        case .study:
            return UIImage(named: "studyWhite")
        case .vacation:
            return UIImage(named: "dayWhite")
        case .birthday:
            return UIImage(named: "giftWhite")
        case .event:
            return UIImage(named: "loudWhite")
        }
    }
    
    var eventColor: UIColor {
        switch self {
        case .study:
            return UIColor.lightGray
        case .vacation:
            return UIColor.yellow
        case .birthday:
            return UIColor.green
        case .event:
            return UIColor.purple
        }
    }
}

class Event {
    
    var name: String = ""
    var categoryRaw: String = ""
    var endDateString: String = ""
    
    var category: Category? {
        return Category(rawValue: categoryRaw)
    }
    
    var endDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy."
        return dateFormatter.date(from: endDateString)
    }
    
    class func allEvents() -> [Event] {
      var events: [Event] = []
      let formatter = DateFormatter()
      formatter.dateFormat = "HH:mm"

      guard let path = Bundle.main.path(forResource: "Events", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
          return events
      }

      do {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String: String]]
        json.forEach({ (dict: [String: String]) in
          events.append(Event(dictionary: dict, formatter: formatter))
        })
      } catch let error as NSError {
        print(error)
      }

      return events
    }
    
    init(name: String, category: String, endDate: String) {
        self.name = name
        self.categoryRaw = category
        self.endDateString = endDate
    }

    convenience init(dictionary: [String: String], formatter: DateFormatter) {
        let name = dictionary["name"]!
        let categoryRaw = dictionary["category"]!
        let endDateString = dictionary["endDate"]!
        self.init(name: name, category: categoryRaw, endDate: endDateString)
    }
    
}

