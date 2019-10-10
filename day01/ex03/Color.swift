enum Color: String {
    case heart = "Heart"
    case diamond = "Diamond"
    case spade = "Spade"
    case club = "Club"
    static let allColors:[Color] = [Color.init(rawValue: "Heart")!, Color.spade, Color.diamond, Color.club]
}
