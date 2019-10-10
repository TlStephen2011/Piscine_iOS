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

    var cards: [Card] = Deck.allCards
    
    var disards: [Card] = []
    
    var outs: [Card] = []
    
    init(shuffled: Bool) {
        if (shuffled == true) {
            self.cards.shuffle()
        }
        super.init()
    }
    
    override var description: String {
        return "\(self.cards)"
    }
    
    func draw() -> Card? {
        let drawnCard: Card? = cards.first
        
        if (drawnCard != nil) {
            outs.append(drawnCard!)
            cards.removeFirst()
        }
        return drawnCard
    }
    
    func fold(c: Card) {
        if (outs.contains(c)) {
            outs = outs.filter{$0 != c}
            disards.append(c)
        }
    }
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