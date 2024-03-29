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
    var chosenBlock: Int = 0
    var currentBlock: gameBlock = gameBlock()
    var blockActive: Bool = false
    var activeBlockName: String = ""
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
        let makeBlock = SKShapeNode(circleOfRadius: buttonWidth)
        plusOne.fillColor = UIColor.red
        plusTen.fillColor = UIColor.blue
        minusOne.fillColor = UIColor.green
        minusTen.fillColor = UIColor.yellow
        makeBlock.fillColor = UIColor.purple
        plusOne.name = "plusOne"
        plusTen.name = "plusTen"
        minusOne.name = "minusOne"
        minusTen.name = "minusTen"
        makeBlock.name="makeBlock"
        plusOne.position = CGPoint(x: 300, y: 600)
        plusTen.position = CGPoint(x: -300, y: 600)
        minusOne.position = CGPoint(x: 300, y: 500)
        minusTen.position = CGPoint(x: -300, y: 500)
        makeBlock.position = CGPoint(x: 0, y: 550)
        plusOne.zPosition = 5
        plusTen.zPosition = 5
        minusOne.zPosition = 5
        minusTen.zPosition = 5
        makeBlock.zPosition = 5
        
        self.addChild(plusOne)
        self.addChild(plusTen)
        self.addChild(minusOne)
        self.addChild(minusTen)
        self.addChild(makeBlock)
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
        var testBlock = gameBlock()
        if (blockNum>0) {
            testBlock = gameBlock(color: UIColor.red, size: CGSize(width: 300.0, height: 100.0))
        }
        testBlock.initializeGameBlock()
        testBlock.getLabel().text = String(blockNum)
        print("making block with name")
        print(String(blockNum))
        testBlock.setName(s: "b"+String(blockNum))
        blockNum += 1
        self.addChild(testBlock)
    }
    
    func updateQuotient(amount: Int) {
        currentBlock = childNode(withName: activeBlockName) as! gameBlock
        print("comparing")
        print(currentBlock.getQuotient()+amount)
        print(currentBlock.getAnswer())
        if (currentBlock.getQuotient()+amount == currentBlock.getAnswer()) {
            blockActive = false
            print("removing block")
        }
        currentBlock.setQuotient(n: currentBlock.getQuotient()+amount)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        if (blockActive && blockNum>0) {
            print("blockActive is True")
            currentBlock = childNode(withName: activeBlockName) as! gameBlock
            // currentBlock.color = UIColor.red
        }
        for touch in touches {
            
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            // touchNothing = true
            for node in touchedNode {
                print("nodename")
                print(node.name)
                if(node.name=="makeBlock") {
                    createBlock()
                }
                if(blockActive && node.name=="plusOne") {
                    updateQuotient(amount: 1)
                    /* currentBlock.setQuotient(n: currentBlock.getQuotient()+1)
                    if (currentBlock.getQuotient()+1 == currentBlock.getAnswer()) {
                        blockActive = false
                    }
                    */
                }
                if(blockActive && node.name=="plusTen") {
                    updateQuotient(amount: 10)
/*                    currentBlock.setQuotient(n: currentBlock.getQuotient()+10)
                    if (currentBlock.getQuotient()+10 == currentBlock.getAnswer()) {
                        blockActive = false
                    }*/
                }
                if(blockActive && node.name=="minusOne") {
                    updateQuotient(amount: -1)
/*                    currentBlock.setQuotient(n: currentBlock.getQuotient()-1)
                    if (currentBlock.getQuotient()-1 == currentBlock.getAnswer()) {
                        blockActive = false
                    }*/
                }
                if(blockActive && node.name=="minusTen") {
                    updateQuotient(amount: -10)
/*                    currentBlock.setQuotient(n: currentBlock.getQuotient()-10)
                    if (currentBlock.getQuotient()-10 == currentBlock.getAnswer()) {
                        blockActive = false
                    }*/
                }
                if(node.name?.first == "b") {
                    print("touching a gameBlock")
                    activeBlockName = node.name ?? ""
                    blockActive = true
                    currentBlock.color = UIColor.blue
                    currentBlock = childNode(withName: activeBlockName) as! gameBlock
                    currentBlock.color = UIColor.red
                }
            }
        }
        // createBlock()
    }
}
