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
    private var quotient: Int = 21 // what they have for it, not the actual answer
    private var theAnswer: Int = 24
    private var theHeight: CGFloat = 100
    private var theWidth: CGFloat = 300
    private var ballLabel: SKLabelNode = SKLabelNode()
    private var sideLen: CGFloat = 300
    private var theNumbers: [Int] = []
    private var theTextNodes: [SKLabelNode] = []
    
    func initializeGameBlock () {
        self.theAnswer = Int.random(in: 10..<100)
        self.divisor = Int.random(in: 10..<100)
        self.dividend = self.theAnswer*self.divisor
        self.quotient = 55
        self.isUserInteractionEnabled = false
        print("initializeGameBlock")
        print("testing number to array 12,4")
        print(self.numberToArray(n: 12, p: 4))
        // self.size =  = theWidth
        // self.height = theHeight
        // var barra = SKSpriteNode()
        setNumbers()
        // self.theNumbers = setNumbers() //[0,0,9,9,9,9,9,8,0,1,8,9,1,0,8,9,1,0,8,9,1,0,0,0,0]
        let thePositions = [3,4,5,6,7,8,9,10,11,12,15,16,17,21,22,23,24,27,28,29,30,33,34,35,36]
        self.name = "tester"
        self.size = CGSize(width: sideLen, height: sideLen)
        self.color = UIColor.blue
        for i in 0...24 {
            let numLabel = SKLabelNode(text: "a") // String(theNumbers[i]))
            numLabel.fontName = "AvenirNext-Bold"
            numLabel.fontSize = 36.0
            numLabel.name = "n"+String(i)
            let (q,r) = (thePositions[i]-1).quotientAndRemainder(dividingBy: 6)
            numLabel.position = CGPoint(x: -125+50*r, y: 125-50*q)
            self.theTextNodes.append(numLabel)
            // numLabel.position = CGPoint(x: thePositions[i-1]%6*Int(self.theWidth), y: Int(thePositions[i-1]/6)*Int(self.theWidth))
            self.addChild(numLabel)
        }
        updateNumbers()
        // let ball = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 100.0))
        ballLabel.text = "hi there"
        // let ballLabel = SKLabelNode(text: "hello")
        ballLabel.fontSize = 64.0
        ballLabel.fontName = "AvenirNext-Bold"
        var xPos = CGFloat.random(in: -300...300)
        self.position = CGPoint(x: xPos, y: 650.0)
        // ball.position = CGPoint(x: CGFloat(Int(arc4random()) & Int(size.width)), y: size.height - ball.size.height)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sideLen, height: sideLen))
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
    func setQuotient(n: Int) {
        self.quotient = n
        self.setNumbers()
        self.updateNumbers()
    }
    func getLabel() -> SKLabelNode {
        return ballLabel
    }
    func getName() -> String {
        return self.name ?? "noname"
    }
    func setName(s: String) {
        self.name = s
    }
    func setNumbers() {
        // there will be 25 numbers in this
        let (tens,ones)=self.quotient.quotientAndRemainder(dividingBy: 10)
        self.theNumbers=[]
        self.theNumbers.append(contentsOf: numberToArray(n: self.quotient, p: 4))
        self.theNumbers.append(contentsOf: numberToArray(n: self.divisor, p: 2))
        self.theNumbers.append(contentsOf: numberToArray(n: self.dividend, p: 4))
        self.theNumbers.append(contentsOf: numberToArray(n: tens*self.divisor, p: 3))
        self.theNumbers.append(contentsOf: numberToArray(n: abs(self.dividend-10*tens*self.divisor), p: 4))
        self.theNumbers.append(contentsOf: numberToArray(n: ones*self.divisor, p: 4))
        self.theNumbers.append(contentsOf: numberToArray(n: abs(self.dividend-quotient*divisor), p: 4))
    }
    func numberToArray(n: Int, p: Int) -> [Int] {
        var n1 = n
        var retArray: [Int] = []
        var i = 0
        while (i<p) {
            retArray.insert(n1%10, at: 0)
            var (q,r)=n1.quotientAndRemainder(dividingBy: 10)
            n1 = q
            // retArray = [n%10]+retArray
            i=i+1
        }
        return retArray
    }
    func updateNumbers() {
        for i in 0...24 {
            self.theTextNodes[i].text = String(self.theNumbers[i])
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.name)
        self.position.y = self.position.y-2000 // moves up above the screen
    }
}
