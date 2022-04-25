//
//  SympViewController.swift
//  PandemicDefense
//
//  Created by Pranav Kumar Soma on 4/24/22.
//

import Foundation
import UIKit

class SympViewController: UIViewController {
    
    @IBOutlet weak var finalDiag: UILabel!
    
    @IBOutlet weak var SympSpeak: UILabel!
    @IBOutlet weak var SympRep: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var sicknessCount = 0
    var general = true
    
    @IBAction func btnPressed(_ sender: Any) {
        if(sicknessCount > 5){
            general = true;
        }
        
        var txt = SympRep.text as? String ?? ""
        
        SympRep.text = ""
        
        txt = txt.lowercased()
        
       
        
        
        if(general){
            finalDiag.text = "Symp is thinking ..."
            
            if(txt.contains("hi")){
                SympSpeak.text = "Hi!"
            }else if(txt.contains("bye")){
                SympSpeak.text = "Bye! <3"
                sicknessCount = 0
            }else if(txt.contains("love")){
                SympSpeak.text = "Love you too!"
            }else if (txt.contains("diag")){
                SympSpeak.text = "Let's proceed. Say \"yes\" to start!"
                general = false
            }else{
                SympSpeak.text = "Cool!"
            }
        }else{
            
            if(txt.contains("y")){
                sicknessCount = sicknessCount + 1;
            }
            
            if(sicknessCount > 5){
                SympSpeak.text = "Oh noes ..."
                
                finalDiag.text = "You have COVID."
            }
            
            var rand = Int.random(in: 1..<10)
            
            switch(rand){
                case 1:
                    SympSpeak.text = "Are you sick?"
                    break
                case 2:
                    SympSpeak.text = "Are you coughing?"
                case 3:
                    SympSpeak.text = "Do you have a runny nose?"
                case 4:
                    SympSpeak.text = "Do you have a tight chest?"
                case 5:
                    SympSpeak.text = "Are you fatigued?"
                case 6:
                    SympSpeak.text = "Do you have a fever?"
                case 7:
                    SympSpeak.text = "Are you sneezing?"
                case 8:
                    SympSpeak.text = "Have you lost the sense of taste?"
                case 9:
                    SympSpeak.text = "Have you lost the sense of smell?"
                default:
                    SympSpeak.text = "Do you think you have COVID?"
            }
            
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
    }
}
