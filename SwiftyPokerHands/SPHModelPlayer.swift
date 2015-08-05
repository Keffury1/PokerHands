struct Player: CanTakeCard {

    init() {}

    init(name: String) {
        self.name = name
    }

    var name: String?

    var historyOfDealtHoldemCards = [(Card, Card)]()
    
    var frequentHands = [String:Int]()

    var holdemHand: (HandRank, [String])?

    var cardsHistory: String { get {
        return ", ".join(historyOfDealtHoldemCards.map({ $0.0.description + " " + $0.1.description })) }
    }

    var cards = [Card]() {
        didSet {
            let tu = (self.cards[0], self.cards[1])
            historyOfDealtHoldemCards.append(tu)
            let fqname = "\(tu.0.description),\(tu.1.description)"
            if frequentHands[fqname] == nil {
                frequentHands[fqname] = 1
            } else {
                frequentHands[fqname]!++
            }
        }
    }

    var cardsNames: String { get { return ", ".join(cards.map({ $0.name })) } }

    var count: Int { get { return cards.count } }

    var holeCards: String { get { return cards.spacedDescriptions() } }
}
