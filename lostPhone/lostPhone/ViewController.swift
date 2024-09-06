//
//  ViewController.swift
//  lostPhone
//
//  Created by Dominik Penkava on 8/28/24.
//

// TODO Goal: button that you press if you lost your phone, if you press the button, you found your phone!
// maybe: have a timer that counts down and if the button is not pressed before it hits 0 the phone goes crazy and displays backup contact information

//    / goal: add large text in backround that pulsates red and white (or lower opacity if possibly to 0 and back to 100)

import UIKit

class ViewController: UIViewController {
    
    var time_remaining = 30
    var timer_ended = false
    var text = UILabel()
    let button = UIButton()
    
    var display_warning = false
    let warning_text = UILabel()
    let info_text = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        let screen_center = screen_width / 2
        
        text.frame = CGRect(x: screen_center - 150, y: 100, width: 300, height: 80)
        text.text = String(time_remaining)
        text.font = UIFont.systemFont(ofSize: 50)
        text.textAlignment = .center
        view.addSubview(text)
        
        button.frame = CGRect(x: screen_center - 100, y: screen_height * 0.75, width: 200, height: 100)
        button.setTitle("Add time", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: UIControl.Event.touchDown)
        view.addSubview(button)
        
        warning_text.frame = CGRect(x: screen_center - (screen_width * 0.40), y: screen_height * 0.4, width: screen_width * 0.80, height: 100)
        warning_text.text = "LOST PHONE"
        warning_text.textAlignment = UIKit.NSTextAlignment.center
        warning_text.textColor = UIColor.red
        warning_text.font = UIFont.boldSystemFont(ofSize: 50)
        warning_text.alpha = 0
        view.addSubview(warning_text)
        
        info_text.frame = CGRect(x: screen_center - 150, y: screen_height * 0.3, width: 300, height: 100)
        info_text.numberOfLines = 3
        info_text.alpha = 0
        info_text.text = """
Please call: 815 455 8457
Return to: McHenry County College
Owner name: Bob Didly
"""
        info_text.textAlignment = .center
        view.addSubview(info_text)
        
        let _ = Timer(timeInterval: 1, repeats: true, block: {timer in
            self.time_remaining -= 1
            self.text.text = String(self.time_remaining)
        })
        
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        self.time_remaining += 30

        UIView.animate(withDuration: 0.1, animations: {
            sender.backgroundColor = .darkGray
        }, completion: {_ in
            UIView.animate(withDuration: 0.1, animations: {
                sender.backgroundColor = .gray })})
    }


    
    @objc func UpdateTimer() {
        if self.time_remaining > 0 {
            info_text.alpha = 0
            self.time_remaining -= 1
            
            let totalMinutes = self.time_remaining / 60
            let seconds = self.time_remaining % 60
            let hours = totalMinutes / 60
            let minutes = totalMinutes % 60
            
            var timer_display: String = "\(self.time_remaining)s"
            
            if hours > 0 {
                timer_display = "\(hours)h \(minutes)m \(seconds)s"
            } else if minutes > 0 {
                timer_display = "\(minutes)m \(seconds)s"
            } else {
                timer_display = "\(seconds)s"
            }
            
            // timer low, better go in emergency red mode!
            if time_remaining < 11 {
                button.backgroundColor = UIColor.red
            }

            self.text.text = timer_display
        } else {
            if self.timer_ended == false {
                // do something, they lost their phone!
                display_warning.toggle()
                info_text.alpha = 1
                
                if display_warning {
                    self.warning_text.alpha = 0
                    
                    UIView.animateKeyframes(withDuration: 2, delay: 0, options: .autoreverse, animations: {
                        
                        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                            self.warning_text.alpha = 1
                        }
                        
                        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                            self.warning_text.alpha = 0
                        }
                    }, completion: nil)
                }
                
            }
        }
    }


}
