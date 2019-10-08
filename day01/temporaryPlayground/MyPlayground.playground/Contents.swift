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
    
}

let card1 = Card(Color: Color.diamond, Value: Value.Ten)

print(card1)
