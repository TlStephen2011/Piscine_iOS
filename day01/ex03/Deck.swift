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

// Maybe implement a more real shuffling algorithm
extension Array {
    mutating func shuffle() -> Void {
        var swapPos = 0;
        for i:Int in 0..<self.count {
            swapPos = Int(arc4random_uniform(UInt32(self.count)))
            self.swapAt(i, swapPos)
        }
    }
}