///A Game of Bingo

import Foundation

class GameOfBingo {
    
    let players:[Player]!
    let gameType:GameType!
    let announcer:Announcer!
    let ballPit:BallPit!
    
    var selectedBalls:[Ball] = []
    var round:Int!
    
    init(withPlayers players:[Player], gameType:GameType, announcer:Announcer, ballPit: BallPit!){
        self.players = players
        self.gameType = gameType
        self.announcer = announcer
        self.ballPit = ballPit
        
        round = 0
        
    }
    
}


enum GameType {
    
    case Standard
    case FourCorners
    case FullHouse
    
}

class BingoCard {
    
    enum Letter {
        case B, I, N, G, O
    }
    
    struct Square {
        var number:Int!
        var marked:Bool = false
    }
    
    var grid:[Column] = []
    
    typealias Column = (Letter,[Square])
    
    var b:Column!
    var i:Column!
    var n:Column!
    var g:Column!
    var o:Column!
    
    init() {
        
        let freeSquare = Square(number: 0, marked:true)
        
        self.b = (Letter.B, [])
        self.i = (Letter.I, [])
        self.n = (Letter.N, [freeSquare])
        self.g = (Letter.G, [])
        self.o = (Letter.O, [])
        
        var _b = Array(1...15)
        var _i = Array(16...30)
        var _n = Array(31...45)
        var _g = Array(45...60)
        var _o = Array(61...75)
        
        for _ in 1...5 {
            
            let ib = Int(arc4random_uniform(UInt32(_b.count)))
            let ii = Int(arc4random_uniform(UInt32(_i.count)))
            
            let ig = Int(arc4random_uniform(UInt32(_g.count)))
            let io = Int(arc4random_uniform(UInt32(_o.count)))
            
            let bSquare:Square = Square(number: _b[ib], marked: false)
            let iSquare:Square = Square(number: _i[ii], marked: false)
            let gSquare:Square = Square(number: _g[ig], marked: false)
            let oSquare:Square = Square(number: _o[io], marked: false)
            
            _b.removeAtIndex(ib)
            _i.removeAtIndex(ii)
            _g.removeAtIndex(ig)
            _o.removeAtIndex(io)
            
            self.b.1.append(bSquare)
            self.i.1.append(iSquare)
            self.g.1.append(gSquare)
            self.o.1.append(oSquare)
            
            self.b.1.sortInPlace() {
                $0.number < $1.number
            }
            
            self.i.1.sortInPlace() {
                $0.number < $1.number
            }
            
            self.g.1.sortInPlace() {
                $0.number < $1.number
            }
            
            
            self.o.1.sortInPlace() {
                $0.number < $1.number
            }
        
            
        }
        
        for _ in 1...4 {
            
            let iN = Int(arc4random_uniform(UInt32(_n.count)))
            
            let nSquare:Square = Square(number: _n[iN], marked: false)
            _n.removeAtIndex(iN)
            
            self.n.1.append(nSquare)
            
            self.n.1.sortInPlace() {
                $0.number < $1.number
            }
            
        }
        
        grid.append(b)
        grid.append(i)
        grid.append(n)
        grid.append(g)
        grid.append(o)l
        
    }
    
}

class Ball {
    
    typealias Number = Int
    
    let number:Number!
    
    enum Letter { case B, I, N, G, O }
    
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

typealias Name = String

class Person {
    
    let name:Name!
    init(withName name:Name) {
        self.name = name
    }
    
    func declareBingo() {
        
    }
    
}

class Announcer: Person {
    
    typealias Announcement = String
    
    func pickBallFrom(ballPit ballPit: BallPit, inout AddToSelectedBalls selectedBalls: [Ball]) -> Announcement {
        
        let pickedBall = ballPit.spitOutBall()
        
        let announcement:Announcement! = Announcement(pickedBall.value)
        
        selectedBalls.append(pickedBall)
        
        return announcement
        
    }
    
}

let leCard = BingoCard()
print(leCard.grid)
