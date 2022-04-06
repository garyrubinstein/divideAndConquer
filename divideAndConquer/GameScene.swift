//
//  GameScene.swift
//  divideAndConquer
//
//  Created by Gary Old Mac on 3/26/22.
//

import SpriteKit
// import GameplayKit

class GameScene: SKScene {
    var blockNum: Int = 0
    var buttonWidth: CGFloat = 50.0
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

        // scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        scene!.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -375, y: -1334/2+100), to: CGPoint(x: 375, y: -1334/2+100))
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        makeButtons()
        // var i = 0
        
        //createBall()
        //run(SKAction.repeat(SKAction.sequence())
        // run(SKAction.repeat(SKAction.sequence([SKAction.run(createBall), SKAction.wait(forDuration: 0.05)]), count: 200))
    }
    func makeButtons() {
        let plusOne = SKShapeNode(circleOfRadius: buttonWidth)
        let plusTen = SKShapeNode(circleOfRadius: buttonWidth)
        let minusOne = SKShapeNode(circleOfRadius: buttonWidth)
        let minusTen = SKShapeNode(circleOfRadius: buttonWidth)
        plusOne.fillColor = UIColor.red
        plusTen.fillColor = UIColor.blue
        minusOne.fillColor = UIColor.green
        minusTen.fillColor = UIColor.yellow
        plusOne.name = "plusOne"
        plusTen.name = "plusTen"
        minusOne.name = "minusOne"
        minusTen.name = "minusTen"
        plusOne.position = CGPoint(x: -300, y: 600)
        plusTen.position = CGPoint(x: -300, y: 500)
        minusOne.position = CGPoint(x: 300, y: 600)
        minusTen.position = CGPoint(x: 300, y: 500)
        plusOne.zPosition = 5
        plusTen.zPosition = 5
        minusOne.zPosition = 5
        minusTen.zPosition = 5
        self.addChild(plusOne)
        self.addChild(plusTen)
        self.addChild(minusOne)
        self.addChild(minusTen)
    }
    func createBall() {
        //let ball = SKSpriteNode(imageNamed: "ball")
        let ball = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 100.0))
        let ballLabel = SKLabelNode(text: "hello")
        ballLabel.fontSize = 64.0
        ballLabel.fontName = "AvenirNext-Bold"
        var xPos = CGFloat.random(in: -300...300)
        ball.position = CGPoint(x: xPos, y: 650.0)
        // ball.position = CGPoint(x: CGFloat(Int(arc4random()) & Int(size.width)), y: size.height - ball.size.height)
        ball.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200.0, height: 100.0))
        // ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.addChild(ballLabel)
        addChild(ball)
    }
    
    func createBlock () {
        let testBlock = gameBlock(color: UIColor.red, size: CGSize(width: 300.0, height: 100.0))
        testBlock.initializeGameBlock()
        testBlock.getLabel().text = String(blockNum)
        testBlock.setName(s: String(blockNum))
        blockNum += 1
        self.addChild(testBlock)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            // touchNothing = true
            for node in touchedNode {
                print("nodename")
                print(node.name)
            }
        }
        createBlock()
    }
}
