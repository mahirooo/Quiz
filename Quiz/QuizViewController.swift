//
//  QuizViewController.swift
//  Quiz
//
//  Created by 長崎茉優 on 2022/08/31.
//

import UIKit
import Foundation

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizImageView: UIImageView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        quizArray.append(["isseki","花より団子","一石二鳥","猫に小判",2])
        quizArray.append(["mario","マリオ","ルイージ","ポパイ",1])
        quizArray.append(["makan","マカンコウサッポウ","マカンポウサッポウ","マカントウサッポウ",1])
        quizArray.append(["sippai","飛び蹴り","プロポーズ失敗","スーパーヒーロー",2])
        
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz(){
        let tmpArray = quizArray[0] as! [Any]
        
        quizImageView.image = UIImage(named: tmpArray[0] as! String)
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        let tmpArray = quizArray[0] as? [Any]
        if tmpArray?[4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
