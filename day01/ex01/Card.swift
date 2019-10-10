import Foundation

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
