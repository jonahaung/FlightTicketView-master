# FlightTicketView

Simple UIViewController containing a UITableView with custom Cells that resemble a flight ticket with holes and separator.

## Screenshots

<img src="Screenshots/portrait.png" height="600"> 

## Requirements

- iOS 10.2+
- Xcode 9

## Integration

#### CocoaPods (iOS 8+)

You can use [CocoaPods](http://cocoapods.org/) to install `FlightTicketView` by adding it to your `Podfile`:

```ruby
target 'MyApp' do
    pod 'FlightTicketView'
end
```

## Deployment

Start by importing the framework to your project
```swift
import FlightTicketView
```

Subclass UITicketViewController and set the FlightTicketView container frame
```swift
class ViewController: UITicketViewController {
    override func viewDidLoad() {
    super.viewDidLoad()
    ticketViewContainer = self.view
    addTickets()
    }
}
```

Create addTickets() method and fill the tickets array
```swift
func addTickets() {
    // Create a stop over
    let stopOver = StopOver(id: 1,
    airlineName: "Aeromexico",
    airlineLogo: UIImage(named: "airlineExample1") ?? UIImage(),
    departureTime: Date(),
    arrivalTime: Date(),
    departureCity: "MEXICO",
    arrivalCity: "MADRID")

    // Create a flight ticket with the stop over
    // previously created
    let flightTicket = Ticket(id: 1,
    departureCityShort: "MEX",
    departureCityLong: "Cd. México",
    arrivalCityShort: "AMS",
    arrivalCityLong: "Amsterdam",
    stopOvers: [stopOver])

    // Fill array of tickets
    tickets = [flightTicket]
    ticketsTableView.reloadData()
}
```

That's it! you can add as many stop overs and tickets as you want.
Don't forget to check out the demo project for more ideas.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
