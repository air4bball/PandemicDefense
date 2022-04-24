//
//  SocialDiViewController.swift
//  PandemicDefense
//
//  Created by pranavsoma on 4/23/22.
//

import UIKit

class SocialDistancingViewController: UIViewController {
    @IBOutlet weak var riskIndexView: UIProgressView!
    
    @IBOutlet weak var measures: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var riskIndex = RiskMapViewController.GlobalVariable.riskIndex;
        riskIndexView.setProgress(Float(riskIndex/10.0), animated: true);
        
        if (riskIndex >= 0 && riskIndex <= 3 ){
            measures.text = "CDC does not recognize the need for severe practices. However, CDC recommends the daily sanitation of frequently used items and places. The CDC does not mandate the use of face masks.";
        } else if(riskIndex > 3 && riskIndex <= 6){
            measures.text = "CDC might recommend selective school dismissals in facilities serving children at high risk. CDC also recommends for masks to be worn in high-risk sectors. The CDC recommends the use of face masks for ill persons, but not otherwise, unless mandated by private property.";
        } else if(riskIndex > 6 && riskIndex <= 9){
            measures.text = "CDC might recommend temporary preemptive, coordinated dismissals of child care facilities and schools. CDC might recommend social distancing measures. CDC might recommend modifications, postponements, or cancellations. CDC recommends voluntary home isolation of ill persons, respiratory etiquette, hand hygiene, and routine cleaning of frequently touched surfaces and objects.";
        } else if (riskIndex > 9){
            measures.text = "CDC recommends use of face masks by all persons in settings involving interactions with others. CDC recommends the long-term dismissal of schools and other institution. CDC recommends YOU to cancel events that involve excessive social interaction. CDC recommends the frequent screenings of person irrelevant to symptoms, and recommends ill persons to partake in isolation.";
        }
    }


}

