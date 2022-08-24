//
//  ViewController.swift
//  RPS
//
//  Created by MacMini4 on 23/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonRock: UIButton!
    @IBOutlet weak var buttonPaper: UIButton!
    @IBOutlet weak var buttonScissors: UIButton!
    
    @IBOutlet weak var labelComputerChoose: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelResult.text = ""
        labelComputerChoose.text = ""
        
        changeButtonView(buttonRock, 0)
        changeButtonView(buttonPaper, 1)
        changeButtonView(buttonScissors, 2)
    }
    
    enum Sign: String {
        case rock = "\u{1f44a}"
        case paper = "\u{270b}"
        case scissors = "\u{270c}"
    }
    
    enum Result: String {
        case win = "You win"
        case lose = "Computer win"
        case tie = "TIE"
    }
    
    func randomSign()->Sign {
        let sign = Int.random(in: 0...2)
        if sign == 0 {
            return .rock
        }
        else if sign == 1 {
            return .paper
        }
        else {
            return .scissors
        }
    }
    
    func changeButtonView(_ button: UIButton,_ index: Int){
        let font = UIFont.systemFont(ofSize: 70.0)
        let attributes = [NSAttributedString.Key.font: font]
        
        func changeIcon(_ icon: String) -> NSAttributedString {
            return NSAttributedString(string: icon, attributes: attributes)
        }
        
        let attributedQuote = [
            changeIcon(Sign.rock.rawValue),
            changeIcon(Sign.paper.rawValue),
            changeIcon(Sign.scissors.rawValue),
        ]
        button.setAttributedTitle(attributedQuote[index], for: .normal)
    }
    
    @IBAction func choiceRock(_ sender: UIButton) {
        let youChoose = sender.attributedTitle(for: .selected)?.string
        let computerChoose = randomSign().rawValue
        labelComputerChoose.text = randomSign().rawValue
        if (computerChoose == youChoose){
            labelResult.text = Result.tie.rawValue
        }
        else if (computerChoose == Sign.rock.rawValue && youChoose == Sign.scissors.rawValue) || (computerChoose == Sign.scissors.rawValue && youChoose == Sign.paper.rawValue) || (computerChoose == Sign.paper.rawValue && youChoose == Sign.rock.rawValue) {
            labelResult.text = Result.lose.rawValue
        }
        else{
            labelResult.text = Result.win.rawValue
        }
    }
}

