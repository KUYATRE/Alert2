//
//  ViewController.swift
//  Alert2
//
//  Created by 이병곤 on 7/9/24.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp_on.jpeg")
    let imgOff = UIImage(named: "lamp_off.jpeg")
    let imgRemove = UIImage(named: "lamp_remove.jpeg")
    
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if !isLampOn {
            lampImg.image = imgOn
            isLampOn = true
        } else {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancleAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancleAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 Off 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let onAction = UIAlertAction(title: "켜기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let offAction = UIAlertAction(title: "끄기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let removeAction = UIAlertAction(title: "제거", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

