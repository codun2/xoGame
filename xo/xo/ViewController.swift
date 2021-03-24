//
//  ViewController.swift
//  xo
//
//  Created by macbook on 2/18/21.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var out1: UIButton!
    @IBOutlet weak var out2: UIButton!
    @IBOutlet weak var out3: UIButton!
    @IBOutlet weak var out4: UIButton!
    @IBOutlet weak var out5: UIButton!
    @IBOutlet weak var out6: UIButton!
    @IBOutlet weak var out7: UIButton!
    @IBOutlet weak var out8: UIButton!
    @IBOutlet weak var out9: UIButton!
    @IBOutlet weak var outPlayer: UILabel!
    
    var player:Int=1
    var isActive = true
    var stat = [    0,0,0,
                    0,0,0,
                    0,0,0
               ]
    var winStat = [[0,1,2],[3,4,5],[6,7,8],[0,1,2],[3,4,5],[6,5,4]]
    func win(){
        for winner in winStat{
            if stat[winner[0]]==stat[winner[1]] &&
            stat[winner[1]]==stat[winner[2]] &&
            stat[winner[2]] != 0 {
                outPlayer.text="The winner  \(player)"
                print("winner")
                isActive = false
                break
            }
            
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func pressd(_ sender: UIButton) {
        pressdPlayerPossition(button: sender)
        
    }
    
    @IBAction func pressdAgain(_ sender: UIButton) {
        player = 1
        isActive=true
        setImage()
        for index in 0...8{
            stat[index]=0
        }
    }
    
    
    func setImage(){
        
        out1.setImage(nil, for: UIControl.State.normal)
        out2.setImage(nil, for: UIControl.State.normal)
        out3.setImage(nil, for: UIControl.State.normal)
        out4.setImage(nil, for: UIControl.State.normal)
        out5.setImage(nil, for: UIControl.State.normal)
        out6.setImage(nil, for: UIControl.State.normal)
        out7.setImage(nil, for: UIControl.State.normal)
        out8.setImage(nil, for: UIControl.State.normal)
        out9.setImage(nil, for: UIControl.State.normal)
        outPlayer.text=""

    }
    
    func pressdPlayerPossition(button :UIButton){
        if isActive{
            if button.image(for: UIControl.State.normal)==nil {
                if player==1{
                    button.setImage(#imageLiteral(resourceName: "X"), for: UIControl.State.normal)
                }
                else{
                    button.setImage(#imageLiteral(resourceName: "O"),for: UIControl.State.normal)
                }
                stat[button.tag]=player
                win()
                print(stat)
                if player==1{
                    player=2
                }
                else{
                    player=1
                }
                
              
            }
            }
    }
}

