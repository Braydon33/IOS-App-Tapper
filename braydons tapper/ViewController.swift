//
//  ViewController.swift
//  Braydon's Tapper
//
//  Created by Braydon Duprey on 2016-01-13.
//  Copyright © 2016 Braydon Duprey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.txtboxHowManyTaps.delegate = self
    }
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtboxHowManyTaps: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBOutlet weak var btnTap: UIButton!
    @IBOutlet weak var lblTaps: UILabel!
    
    @IBAction func onCoinTapped(sender: AnyObject)
    {
    currentTaps = (currentTaps + 1)
    updateTapsLbl()
        
        if IsGameOver()
        {
            restartGame()
        }
        
    }
   //Function Button Tap
    @IBAction func onPlayBtnPressed(sender: UIButton!)
    {

    if txtboxHowManyTaps.text != nil && txtboxHowManyTaps.text != ""
        {
            imgLogo.hidden = true
            txtboxHowManyTaps.hidden = true
            btnPlay.hidden = true
            
            btnTap.hidden = false
            lblTaps.hidden = false
            
            maxTaps = Int(txtboxHowManyTaps.text!)!
            currentTaps = 0
           
            updateTapsLbl()
            }
    
   
    }
    //function to check if the game is over
    func IsGameOver() -> Bool
    {
        if currentTaps >= maxTaps
        {
            return true
        }
        else
        {
            return false
            
        }
        
        
    }
    //resets the app once the game is over
    func restartGame()
    
    {
        maxTaps = 0
        txtboxHowManyTaps.text = ""
        
        imgLogo.hidden = false
        txtboxHowManyTaps.hidden = false
        btnPlay.hidden = false
        
        btnTap.hidden = true
        lblTaps.hidden = true
    }

 func updateTapsLbl()
    
        {
        lblTaps.text = "\(currentTaps) Taps"
        }
    func textFieldShouldReturn(userText: UITextField) -> Bool
    {
        userText.resignFirstResponder()
        return true;
    }
    
}

