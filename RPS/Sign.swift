//
//  Sign.swift
//  RPS
//
//  Created by Brian Nejand on 10/20/21.
//

import Foundation

func randomSign () -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case paper
    case rock
    case scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋"
            
        case .rock:
            return "👊"
        
        case .scissors:
            return "✌️"
        }
    }
    
    func gameState(computerSign: Sign) -> GameState {
        if self == computerSign {
            return .draw
        }
        switch computerSign {
        case .rock:
            if self == .paper {
                return .win
            }
        case .paper:
            if self == .scissors {
                return .win
            }
        case .scissors:
            if self == .rock {
                return .win
            }
        }
        return .lose
    }

}
