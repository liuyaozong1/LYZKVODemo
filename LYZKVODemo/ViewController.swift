//
//  ViewController.swift
//  LYZKVODemo
//
//  Created by 刘耀宗 on 2021/6/20.
//

import UIKit

class ViewController: UIViewController {

    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        person.addObserver(self, forKeyPath: "name", options: [NSKeyValueObservingOptions.new,NSKeyValueObservingOptions.old], context: nil)
        print(person.name)
        
        let jumpBtn = UIButton()
        jumpBtn.setTitle("OC 版本", for: .normal)
        jumpBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(jumpBtn)
        jumpBtn.frame = .init(x: 200, y: 200, width: 200, height: 20)

    }
    
    @objc func click() {
        let vc = OCKvoViewController()
        present(vc, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(person.name)")
        person.name = "张三改"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("监听到了")
    }

    
    deinit {
        person.removeObserver(self, forKeyPath: "name", context: nil)
    }

}

class Person: NSObject {
    @objc dynamic var name = "张三"
    var age = 10
}

