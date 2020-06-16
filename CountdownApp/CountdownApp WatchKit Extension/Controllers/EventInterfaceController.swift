//
//  EventInterfaceController.swift
//  CountdownApp WatchKit Extension
//
//  Created by Isnard Silva on 15/06/20.
//  Copyright © 2020 Isnard Silva. All rights reserved.
//

import WatchKit

public class EventInterfaceController: WKInterfaceController {
    // MARK: - Outlets
    @IBOutlet weak var eventImage: WKInterfaceImage!
    @IBOutlet weak var categoryLabel: WKInterfaceLabel!
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    
    // MARK: - Properties
    private var event: Event? {
        didSet {
            guard let event = event else { return }
            
            self.eventImage.setImage(event.category?.eventImage)
            self.categoryLabel.setText(event.category?.rawValue)
            self.nameLabel.setText(event.name)
            self.setupTimer()
        }
    }
    
    
    // MARK: - Interface Lifecycle
    // Executed after the graphical interface elements are configured and before the interface is displayed
    public override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Setup Event
        if let event = context as? Event {
            self.event = event
        }
    }
    
    // Executed after the interface has already been displayed to the user
    public override func didAppear() {
        super.didAppear()
                
        self.animate(withDuration: 0.4, animations: {
            self.updateImageColor()
        })
    }
    
    
    // MARK: Private methods
    private func setupTimer() {
        self.timer.setDate(event?.endDate ?? Date())
        self.timer.start()
    }
    
    private func updateImageColor() {
        self.eventImage.setTintColor(event?.category?.eventColor)
        self.categoryLabel.setTextColor(event?.category?.eventColor)
    }
}
