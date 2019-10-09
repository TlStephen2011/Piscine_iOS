import Foundation

enum Color: String {
    case heart = "Heart"
    case diamond = "Diamond"
    case spade = "Spade"
    case club = "Club"
    static let allColors:[Color] = [Color.init(rawValue: "Heart")!, Color.spade, Color.diamond, Color.club]
}

enum Value: Int {
    case Ace = 1
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
    static let allValues:[Value] = [Value.Ace, Value.Two, Value.Three, Value.Four, Value.Five, Value.Six, Value.Seven, Value.Eight, Value.Nine, Value.Ten, Value.Jack, Value.Queen, Value.King]
}


var v: Value = Value.Jack
print(v.rawValue)

print(Value.init(rawValue: 13)!)

class Card: NSObject {
    
    var color: Color
    var value: Value
    
    init(Color color: Color, Value value: Value) {
        self.color = color
        self.value = value
        super.init()
    }
    
    override var description: String {
        return "(\(self.value), \(self.color))"
    }
    
    override func isEqual(_ obj: Any?) -> Bool {
        if let obj = obj as? Card {
            return color == obj.color && value == obj.value
        } else {
            return false
        }
    }
}

func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.isEqual(rhs)
}

let card1 = Card(Color: Color.diamond, Value: Value.Ten)
let card2 = Card(Color: Color.diamond, Value: Value.Ten)
let card3 = Card(Color: Color.heart, Value: Value.King)

print("IsEqual")
print(card1)
print(card1.isEqual(card2))
print(card1.isEqual(card3))
print()
print("== operator")
print(card1 == card2)
print(card1 == card3)

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

print()
print(Deck.allSpades)
print(Deck.allHearts)
print()
print("All Cards")
print(Deck.allCards)

extension Array {
    mutating func shuffle() -> Void {
        var swapPos = 0;
        for i:Int in 0..<self.count {
            swapPos = Int(arc4random_uniform(UInt32(self.count)))
            self.swapAt(i, swapPos)
        }
    }
}

print()
var cards = Deck.allSpades
print("Shuffling....")
cards.shuffle()
print(cards)
print()
