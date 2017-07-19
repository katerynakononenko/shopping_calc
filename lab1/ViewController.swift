//
//  ViewController.swift
//  lab1
//
//  Created by Kateryna Kononenko on 1/26/17.
//  Copyright © 2017 Kateryna Kononenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        validorno.text = ""
        displayfinal.text = "Final price"
        shopaholic.alpha = 0
        final.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var original: UITextField!
    var orignum : Double = 0
    @IBOutlet weak var discount: UITextField!
    var discnum : Double = 0
    @IBOutlet weak var sales: UITextField!
    var salesnum : Double = 0
    var finalPrice: Double = 0
    @IBAction func originalchange(_ sender: UITextField) {
        //let orig = sender.text
       validorno.text = ""
        if let orig = sender.text{
            if let orignumtemp = Double(orig){
               if (orignumtemp>0){
                orignum=Double(orignumtemp)
                  finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
               final.text =  "$\(String(format: "%.2f", finalPrice))"
                validorno.text = ""
                if (finalPrice>50){
                    shopaholic.alpha = 1
                } else {shopaholic.alpha = 0}
               } else {
                validorno.text = "Invalid original price!"
               }
            }
            else{
                validorno.text = "Type in numbers!"
                final.text = "0"
            }
            if (orig == "")
            {orignum = 0
                finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
                final.text = "$\(String(format: "%.2f", finalPrice))"}
        }
    }


    @IBAction func discountchange(_ sender: UITextField) {
        if let disc = sender.text{
            if let discnumtemp = Double(disc){
        if (discnumtemp>0 && discnumtemp<100 ){
            discnum = Double(discnumtemp)
            finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
        validorno.text = ""
             final.text =  "$\(String(format: "%.2f", finalPrice))"
            if (finalPrice>50){
                shopaholic.alpha = 1
            }else {shopaholic.alpha = 0}
        }else { validorno.text = "Invalid discount!"}
            } else {
                validorno.text = "Type in numbers!"
                final.text = "0"
            }
            if (disc == "")
            {discnum = 0
                finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
                final.text = "$\(String(format: "%.2f", finalPrice))"}
           
}
}
    @IBAction func saleschange(_ sender: UITextField) {
        
        if let sales = sender.text{
            if let salesnumtemp = Double(sales){
        if (salesnumtemp>0 && salesnumtemp<100){
            salesnum = Double(salesnumtemp)
            finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
             final.text = "$\(String(format: "%.2f", finalPrice))"
            validorno.text = ""
            if (finalPrice>50){
                shopaholic.alpha = 1
            }else {shopaholic.alpha = 0}
        } else {validorno.text = "Invalid sales tax!"
                }
            } else {
                validorno.text = "Type in numbers!"
                final.text = "0"
            }
            if (sales == "")
            {salesnum = 0
                finalPrice = orignum - (orignum*discnum/100)+(orignum*(salesnum/100))
                final.text = "$\(String(format: "%.2f", finalPrice))"}
        }

    }
    
    @IBOutlet weak var shopaholic: UIImageView!

    @IBOutlet weak var displayfinal: UILabel!
    @IBOutlet weak var final: UILabel!
    @IBOutlet weak var validorno: UILabel!
    
}

