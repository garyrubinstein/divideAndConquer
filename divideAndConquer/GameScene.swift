//
//  GameScene.swift
//  divideAndConquer
//
//  Created by Gary Old Mac on 3/26/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    /*
    override func didMove(to view: SKView) {
        let testBlock = gameBlock(color: UIColor.white, size: CGSize(width: 300.0, height: 100.0))
        // testBlock.color = UIColor.white
        testBlock.position.x = 0
        testBlock.position.y = 0
        print(testBlock.getDivisor())
        print(testBlock.getDivisor())
        print(testBlock.getQuotient())
        self.addChild(testBlock)
    }
 */
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white

        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        // var i = 0
        
        //createBall()
        //run(SKAction.repeat(SKAction.sequence())
        // run(SKAction.repeat(SKAction.sequence([SKAction.run(createBall), SKAction.wait(forDuration: 0.05)]), count: 200))
    }
    func createBall() {
        //let ball = SKSpriteNode(imageNamed: "ball")
        let ball = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 100.0))
        var xPos = CGFloat.random(in: 0...50)
        ball.position = CGPoint(x: xPos, y: 0.0)
        // ball.position = CGPoint(x: CGFloat(Int(arc4random()) & Int(size.width)), y: size.height - ball.size.height)
        ball.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200.0, height: 100.0))
        // ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        addChild(ball)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        createBall()
    }
}
