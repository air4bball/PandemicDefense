//
//  MasksViewController.swift
//  PandemicDefense
//
//  Created by Pranav Kumar Soma on 4/23/22.
//

import Foundation

import UIKit

class MasksViewController : UIViewController {
    
    var ind = 1;
    
    @IBOutlet weak var MaskImageView: UIImageView!
    
    @IBOutlet weak var MaskAttributeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var riskIndex = RiskMapViewController.GlobalVariable.riskIndex;
        print(riskIndex)
        
        if (riskIndex >= 0 && riskIndex <= 2.5 ){
            let clothMaskImage = UIImage(named: "Cloth Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "Cloth Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
            
           
        } else if(riskIndex > 2.5 && riskIndex <= 5){
            let clothMaskImage = UIImage(named: "Surgical Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "Surgical Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
            
        } else if(riskIndex > 5 && riskIndex <= 7.5){
            let clothMaskImage = UIImage(named: "KN95-Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "KN95 Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        
        } else if (riskIndex > 7.5){
            let clothMaskImage = UIImage(named: "N95 Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "N95 Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        }
    }

    @IBAction func SwitchImage(_ sender: Any) {
        if(MaskImageView.image == UIImage(named: "N95 Mask")){
            let clothMaskImage = UIImage(named: "Cloth Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "Cloth Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        } else if(MaskImageView.image == UIImage(named: "Cloth Mask")){
            let clothMaskImage = UIImage(named: "Surgical Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "Surgical Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        } else if(MaskImageView.image == UIImage(named: "Surgical Mask")){
            let clothMaskImage = UIImage(named: "KN95-Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "KN95 Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        } else if(MaskImageView.image == UIImage(named: "KN95-Mask")){
            let clothMaskImage = UIImage(named: "N95 Mask");
            MaskImageView.image = clothMaskImage;

            let clothMaskRate = UIImage(named: "N95 Mask Rate");
            MaskAttributeImageView.image = clothMaskRate;
        }
        
    }
    
}
