///A Game of Bingo

class Bingo {
    
    let players:[Player]!
    let gameType:GameType!
    let announcer:Announcer!
    
    init(withPlayers players:[Player], gameType:GameType, announcer:Announcer){
        self.players = players
        self.gameType = gameType
        self.announcer = announcer
        
    }
    
}


enum GameType {
    
    case Standard
    case FullHouse
    case FourCorners
    case BigX
    
}

class BingoCard {
    
    init() {
        
    }
    
}

typealias Name = String

class Person {
    
    let name:Name!
    init(withName name:Name) {
        self.name = name
    }
    
}

class Announcer {
    
    init() {
        
    }
    
}

class Player:Person {
    
    let card:BingoCard!
    
    init(withName name: Name, andCard card: BingoCard) {
        self.card = card
        super.init(withName: name)
    }

}

let card:BingoCard = BingoCard()

let joe = Player(withName: "Joe", andCard: card)

print(joe.name)