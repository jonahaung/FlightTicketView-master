//
//  ViewController.swift
//  Demo
//
//  Created by Jose Manuel Solis Bulos on 5/12/18.
//  Copyright © 2018 ManuelBulos. All rights reserved.
//

import UIKit
import FlightTicketView

class ViewController: UITicketViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketViewContainer = self.view
        setAppearance()
        addTickets()
    }
    
    // We can change the look of the TicketView by accessing TicketViewAppearance.shared()
    func setAppearance() {
        TicketViewAppearance.shared().animated = true
        TicketViewAppearance.shared().ticketViewContainerMargin = 24
        TicketViewAppearance.shared().planeImage = UIImage(named: "FlightIcon")
    }
    
    // Fill array and reload TicketView
    func addTickets() {
        tickets = fillTicketsArray()
        ticketsTableView.reloadData()
    }
    
    // We can override the delegate methods for the TicketView
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < 1 {
            print(tickets[indexPath.section].departureCityLong)
        } else {
            let stopOversOnly = indexPath.row - 1 // ignore the first cell because it's not a stopOver
            print(tickets[indexPath.section].stopOvers![stopOversOnly].departureCity)
        }
    }
    
    func fillTicketsArray() -> [Ticket] {
        // Stop overs
        let stopOver1 = StopOver(id: 1,
                                 airlineName: "Golden Myanmar",
                                 airlineLogo: UIImage(named: "airlineExample1") ?? UIImage(),
                                 departureTime: Date(),
                                 arrivalTime: Date(),
                                 departureCity: "MEXICO",
                                 arrivalCity: "MADRID")
        
        let stopOver2 = StopOver(id: 2,
                                 airlineName: "Mann Yadanarpon",
                                 airlineLogo: UIImage(named: "airlineExample2") ?? UIImage(),
                                 departureTime: Date(),
                                 arrivalTime: Date(),
                                 departureCity: "MADRID",
                                 arrivalCity: "AMSTERDAM")
        
        let stopOver3 = StopOver(id: 3,
                                 airlineName: "Air KBZ",
                                 airlineLogo: UIImage(named: "airlineExample2") ?? UIImage(),
                                 departureTime: Date(),
                                 arrivalTime: Date(),
                                 departureCity: "AMSTERDAM",
                                 arrivalCity: "MEXICO")
        
        // Flight Ticket 1
        let flightTicket1 = Ticket(id: 1,
                                   departureCityShort: "YGN",
                                   departureCityLong: "Yangon",
                                   arrivalCityShort: "MDL",
                                   arrivalCityLong: "Mandalay",
                                   stopOvers: [stopOver1,stopOver2])
        
        
        //Flight Ticket 2
        let flightTicket2 = Ticket(id: 2,
                                   departureCityShort: "MNU",
                                   departureCityLong: "Mawlamyine",
                                   arrivalCityShort: "NYU",
                                   arrivalCityLong: "Naung U",
                                   stopOvers: [stopOver3, stopOver1,stopOver2])
        
        
        let flightTicket3 = Ticket(id: 3,
        departureCityShort: "YGN",
        departureCityLong: "Yangon",
        arrivalCityShort: "MDL",
        arrivalCityLong: "Mandalay",
        stopOvers: [stopOver1])
        
        return [flightTicket1,flightTicket2, flightTicket3]
    }
    
}
