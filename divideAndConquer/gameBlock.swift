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
    private var theHeight: CGFloat = 100
    private var theWidth: CGFloat = 300
    
    func initializeGameBlock () {
        print("initializeGameBlock")
        // self.size =  = theWidth
        // self.height = theHeight
        // var barra = SKSpriteNode()
        self.name = "tester"
        self.size = CGSize(width: 200.0, height: 100.0)
        self.color = UIColor.blue
        
        // let ball = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 100.0))
        let ballLabel = SKLabelNode(text: "hello")
        ballLabel.fontSize = 64.0
        ballLabel.fontName = "AvenirNext-Bold"
        var xPos = CGFloat.random(in: -300...300)
        self.position = CGPoint(x: xPos, y: 650.0)
        // ball.position = CGPoint(x: CGFloat(Int(arc4random()) & Int(size.width)), y: size.height - ball.size.height)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200.0, height: 100.0))
        // ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        self.addChild(ballLabel)
        // self.color = SKColor.green
        // self.position = CGPoint(x: 100, y: 100)
        // self.addChild(barra)
        /*
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width-50, height: self.size.height-5))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0
        */
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
