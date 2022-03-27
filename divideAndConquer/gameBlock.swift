//
//  gameBlock.swift
//  divideAndConquer
//
//  Created by Gary Old Mac on 3/26/22.
//
import SpriteKit

class gameBlock: SKSpriteNode {
    private var dividend: Int = 408
    private var divisor: Int = 17
    private var quotient: Int = 24
    
    func initializeGameBlock () {
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width-50, height: self.size.height-5))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0
        // self.physicsBody?.categoryBitMask = ColliderType.Player
        // self.physicsBody?.collisionBitMask = ColliderType.Cloud
        // self.physicsBody?.contactTestBitMask = ColliderType.DarkCloudAndCollectibles
    }
    
    func getDividend() -> Int {
        return dividend
    }
    func getDivisor() -> Int {
        return divisor
    }
    func getQuotient() -> Int {
        return quotient
    }
}
