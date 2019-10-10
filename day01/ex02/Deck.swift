import Foundation

class Deck: NSObject {
    static let allSpades:[Card] = Value.allValues.map({(val) -> Card in
        return Card(Color: Color.spade, Value: val)
    })
    
    static let allDiamonds:[Card] = Value.allValues.map({(val) -> Card in
        return Card(Color: Color.diamond, Value: val)
    })
    
    static let allHearts:[Card] = Value.allValues.map({(val) -> Card in
        return Card(Color: Color.heart, Value: val)
    })
    
    static let allClubs:[Card] = Value.allValues.map({(val) -> Card in
        return Card(Color: Color.club, Value: val)
    })
    
    static let allCards:[Card] = Deck.allHearts + Deck.allDiamonds + Deck.allSpades + Deck.allClubs
}