//
//  InterfaceController.swift
//  CountdownApp WatchKit Extension
//
//  Created by Isnard Silva on 15/06/20.
//  Copyright © 2020 Isnard Silva. All rights reserved.
//

import WatchKit

class HomeInterfaceController: WKInterfaceController {
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var events = Event.allEvents()
}
