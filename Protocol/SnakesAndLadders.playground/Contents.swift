import Foundation

//let tracker = DiceGameTracker()
//let game = SnakesAndLadders()
//game.delegate = tracker
//game.play()

protocol Locationable {
    var latitude: Double { get }
    var longitude: Double { get }
}

struct Location: Locationable, Hashable {
    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct Place: Locationable, Named {
    var name: String
    var latitude: Double
    var longitude: Double

    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}

protocol Named {
    var name: String { get }
}

//extension Named {
//    var description: String {
//        if let city = city {
//            return  "\(city)에 있는 \(name)"
//        }
//        return name
//    }
//}

var places: [Location: String] = [:]

func savePlace(in location: Locationable) {
    if let place = location as? Place {
        let location = Location(latitude: place.latitude, longitude: place.longitude)
        places[location] = place.name
    } else if let location = location as? Location {
        places[location] = "unknown"
    }
}

let cityHall = Place(name: "City hall", latitude: 47.6, longitude: -122.3)
let store = Place(name: "Store1", latitude: 47.6, longitude: -122.5)
let store2 = Place(name: "Store2", latitude: 47.6, longitude: -120.2)
let operaHouse = Place(name: "Opera House", latitude: 47.6, longitude: -120.5)
let museum = Place(name: "Museum", latitude: 47.6, longitude: -120.3)
savePlace(in: cityHall)
savePlace(in: store)
savePlace(in: store2)
savePlace(in: operaHouse)
savePlace(in: museum)
dump(places.keys.allEqual())

extension Collection where Element: Equatable & Locationable {
    func allEqual() -> Bool {
        if self is Dictionary<Location, String>.Keys {
            for element in self {
                if element.latitude != self.first?.latitude {
                    return false
                }
            }
            return true
        }

        return false
    }
}
