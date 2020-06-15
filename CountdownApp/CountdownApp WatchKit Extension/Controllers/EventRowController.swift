//
//  EventRowController.swift
//  CountdownApp WatchKit Extension
//
//  Created by Isnard Silva on 15/06/20.
//  Copyright © 2020 Isnard Silva. All rights reserved.
//

import WatchKit

class EventRowController: NSObject {
    // MARK: - Outlets
    @IBOutlet weak var separator: WKInterfaceSeparator!
    @IBOutlet weak var dateLabel: WKInterfaceLabel!
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var eventImage: WKInterfaceImage!
    
    // MARK: - Properties
    static var reuseIdentifier: String = "EventRow"
    
    var event: Event? {
        didSet {
            guard let event = event else { return }
            
            self.separator.setColor(event.category?.eventColor)
            self.dateLabel.setText(event.endDateString)
            self.nameLabel.setText(event.name)
            self.eventImage.setImage(event.category?.eventImage)
            self.eventImage.setTintColor(event.category?.eventColor)
        }
    }
}
