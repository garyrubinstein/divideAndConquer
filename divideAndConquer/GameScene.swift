//
//  GameScene.swift
//  divideAndConquer
//
//  Created by Gary Old Mac on 3/26/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let testBlock = gameBlock()
        print(testBlock.getDivisor())
    }
}
