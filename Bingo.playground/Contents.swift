///A Game of Bingo

import Foundation

class Bingo {
    
    let players:[Player]!
    let gameType:GameType!
    let announcer:Announcer!
    let ballPit:BallPit!
    
    init(withPlayers players:[Player], gameType:GameType, announcer:Announcer, ballPit: BallPit!){
        self.players = players
        self.gameType = gameType
        self.announcer = announcer
        self.ballPit = ballPit
        
    }
    
}


enum GameType {
    
    case Standard
    case FourCorners
    case FullHouse
    
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
    
    func declareBingo() {
        
    }
    
}

class Announcer {
    
    
    init() {
        
    }
    
}

class Ball {
    
    typealias Number = Int
    
    let number:Number!
    
    enum Letter {
        case B, I, N, G, O
    }
    
    let value:(Letter,Number)!
    
    init(WithNumber number: Number) {
        
        self.number = number
        
        var letter:Letter! = .B
        
        switch number {
            
        case 1...15:
            letter = .B
        case 16...30:
            letter = .I
        case 31...45:
            letter = .N
        case 46...60:
            letter = .G
        case 61...75:
            letter = .O
        default:
            letter = .B
            
        }
        
        value = (letter, number)
        
    }
    
}

class BallPit {
    
    var pit:[Ball]! = []
    
    init () {
        
        for i in 1...75 {
            
            let ball = Ball(WithNumber: i)
            pit.append(ball)
            
        }
        
    }
    
    func spitOutBall() -> Ball {
        
        let randomIndex = Int(arc4random_uniform(UInt32(pit.count)))
        
        let randomBall = pit[randomIndex]
        
        pit.removeAtIndex(randomIndex)
        
        return randomBall
        
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

joe.declareBingo()
let ballPit = BallPit()
let ball = ballPit.spitOutBall()




