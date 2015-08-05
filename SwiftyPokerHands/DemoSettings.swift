import Cocoa

class SPKSettings {
    static let sharedInstance = SPKSettings()
    
    var player1Card1Suit = ""
    var player1Card1Rank = ""
    var player1Card2Suit = ""
    var player1Card2Rank = ""
    var player1Random = false
    var player2Card1Suit = ""
    var player2Card1Rank = ""
    var player2Card2Suit = ""
    var player2Card2Rank = ""
    var player2Random = false
    
    var gameMode: GameMode = .Random
    
    func getPlayer1Cards() -> [Card] {
        if player1Random {
            return []
        } else {
            return getPlayerCards(.Player1)
        }
    }
    
    func getPlayer2Cards() -> [Card] {
        if player2Random {
            return []
        } else {
            return getPlayerCards(.Player2)
        }
    }
    
    private func getPlayerCards(type: PersonType) -> [Card] {
        switch type {
        case .Player1:
            let card1 = Card(suit: getSuit(player1Card1Suit), rank: getRank(player1Card1Rank))
            let card2 = Card(suit: getSuit(player1Card2Suit), rank: getRank(player1Card2Rank))
            return [card1, card2]
        case .Player2:
            let card1 = Card(suit: getSuit(player2Card1Suit), rank: getRank(player2Card1Rank))
            let card2 = Card(suit: getSuit(player2Card2Suit), rank: getRank(player2Card2Rank))
            return [card1, card2]
        default:
            return []
        }
    }
    
    private func getSuit(label: String) -> String {
        // forced because label will be checked by the caller for not being empty
        return String(label.characters.first!)
    }
    
    private func getRank(rank: String) -> String {
        switch rank {
            case "Ace":
            return "A"
            case "King":
            return "K"
            case "Queen":
            return "Q"
            case "Jack":
            return "J"
            case "10":
            return "T"
            default:
            return rank
        }
    }
    
}