//
//  ViewController.swift
//  storyboard
//
//  Created by Dominik Penkava on 8/26/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenSize = UIScreen.main.bounds.size
        
        let label = UILabel()
        label.frame = CGRect(x: screenSize.width / 2 - 50, y: screenSize.height * 0.15, width: 100, height: 80)
        label.text = "Hello world!"
        view.addSubview(label)
        
        let button = UIButton()
        
        button.frame = CGRect(x: screenSize.width / 2 - 60, y: 300, width: 120, height: 80)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(clicked), for: .touchDown)
        
        button.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
//        button.
        view.addSubview(button)
        
        
    }

    @objc func clicked(_ sender: UIButton) {
        sender.backgroundColor = .darkGray
    }
    
    @objc func buttonUp(_ sender: UIButton) {
        sender.backgroundColor = .lightGray
    }

}

#Preview {
    ViewController()
}
