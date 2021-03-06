//
//  HomeInterfaceController.swift
//  CountdownApp WatchKit Extension
//
//  Created by Isnard Silva on 15/06/20.
//  Copyright © 2020 Isnard Silva. All rights reserved.
//

import WatchKit

class HomeInterfaceController: WKInterfaceController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    // MARK: - Properties
    private var events = Event.allEvents()
    
    
    // MARK: - Interface Lifecycle
    // Executed after the graphical interface elements are configured and before the interface is displayed
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Setup number of lines
        self.tableView.setNumberOfRows(self.events.count, withRowType: EventRowController.reuseIdentifier)
        
        // Setup content of lines
        for index in 0..<self.tableView.numberOfRows {
            guard let controller = tableView.rowController(at: index) as? EventRowController else { continue }
            controller.event = events[index]
        }
    }
    
    
}


// MARK: - WKInterfaceTable
extension HomeInterfaceController {
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let event = events[rowIndex]
        self.pushController(withName: "Event", context: event)
    }
}
