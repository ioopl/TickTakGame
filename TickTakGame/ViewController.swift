import UIKit

class ViewController: UIViewController {

    var game: Game?
    var isPlayerOne: Bool = true

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!

    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGameNew(_ sender: UIButton) {
        guard let playerOne = playerOneTextField.text, let playerTwo = playerTwoTextField.text else{
            return
        }
        start(playerOne: playerOne, playerTwo: playerTwo)
        [self.view .endEditing(true)]
    }
    
    @IBAction func startGame(sender: UIButton?) {
        guard let playerOne = playerOneTextField.text, let playerTwo = playerTwoTextField.text else{
            return
        }
        start(playerOne: playerOne, playerTwo: playerTwo)
        [self.view .endEditing(true)]
    }
    
    func start(playerOne: String, playerTwo: String){
        game = Game(playerOne: playerOne, playerTwo: playerTwo)
        cleanup()
    }
    
    private func cleanup() {
        buttonOne.setTitle("", for: .normal)
        buttonTwo.setTitle("", for: .normal)
        buttonThree.setTitle("", for: .normal)
        buttonFour.setTitle("", for: .normal)
        buttonFive.setTitle("", for: .normal)
        buttonSix.setTitle("", for: .normal)
        buttonSeven.setTitle("", for: .normal)
        buttonEight.setTitle("", for: .normal)
        buttonNine.setTitle("", for: .normal)
        
        for layer: CALayer in self.view.layer.sublayers! {
            if(layer.name == "Line"){
                layer.removeFromSuperlayer()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        let coordinate =  getCoordinates(value: sender.tag)
        let playResult = play(coordinate: coordinate)
        
        if(playResult.moved){
            let symbol = (playResult.state == State.X) ? "X" : "O"
            sender.setTitle(symbol, for: .normal)
            
            if(playResult.boxes != nil) {
                showGameOverMessage(boxes: playResult.boxes!)
            }
        }
    }
    
    private func showGameOverMessage(boxes: Array<Coordinate>) {
        let coordOne = getCoordinatesOnUI(tag: boxes[0].x * 10 + boxes[0].y)
        let coordTwo = getCoordinatesOnUI(tag: boxes[2].x * 10 + boxes[2].y)
        
        let pointOne = CGPoint(x: coordOne.x + 37, y: coordOne.y + 37)
        let pointTwo = CGPoint(x: coordTwo.x + 37, y: coordTwo.y + 37)
        drawLineFromPoint(start: pointOne, toPoint: pointTwo, ofColor: UIColor.white, inView: self.view)
        
        let title = isPlayerOne ? "Player Two Wins!" : "Player One Wins!"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in self.startGame(sender: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getCoordinatesOnUI(tag: Int) ->(x: CGFloat, y: CGFloat){
        let button = (tag == 0) ? buttonOne : self.view.viewWithTag(tag) as? UIButton
        if (button != nil) {
            return (button!.frame.origin.x, button!.frame.origin.y)
        }
        return(-1, -1)
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 8.0
        shapeLayer.name = "Line"
        
        view.layer.addSublayer(shapeLayer)
    }
    
    private func getCoordinates(value: Int) -> Coordinate{
        if value < 10 {
            return Coordinate(0, value)
        }
        
        return Coordinate(value/10, value % 10)
    }
    
    func play(coordinate: Coordinate) -> (moved: Bool, state: State?, boxes: Array<Coordinate>?) {
        guard let unwrappedGame = game else {
            print("Game is nil")
            return (false, nil, nil)
        }
        
        let state = (isPlayerOne) ? State.X : State.O
        let (moved, _, boxes) = unwrappedGame.move(state: state, coordinate: coordinate)
        if(moved){
            self.isPlayerOne = !self.isPlayerOne
            return (true, state, boxes)
        }
        return (moved, state, boxes)
    }

}

