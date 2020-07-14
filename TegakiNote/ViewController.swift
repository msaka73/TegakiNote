//
//  ViewController.swift
//  TegakiNote
//
//  Created by 坂本充生 on 2020/07/14.
//  Copyright © 2020 Michio.Sakamoto. All rights reserved.
//

import UIKit

import PencilKit

class ViewController: UIViewController {
    // 拡大率
    var zoomNow:CGFloat=1.0
    let zoomMin:CGFloat=1.0
    let zoomMax:CGFloat=5.0
    let canvas = PKCanvasView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //canvasViewのサイズ設定
        
        let unitWidth = view.frame.width / 10         //幅の1/10
        let unitHeight = view.frame.height / 10       //高さの1/10
        let unitMultiple:CGFloat = 8.7        //何倍にするか
        
//        let canvas = PKCanvasView(frame: view.frame)
//        let canvas = PKCanvasView(frame: CGRect(x: unitWidth , y: unitHeight, width: unitWidth * unitMultiple, height: unitHeight * unitMultiple))
        canvas.frame = CGRect(x: unitWidth , y: unitHeight, width: unitWidth * unitMultiple, height: unitHeight * unitMultiple)
        canvas.isOpaque = false
        canvas.backgroundColor = UIColor.init(red: 1, green: 1, blue: 0.93, alpha: 1)      //canvas背景色
        canvas.layer.borderWidth = 5        //枠線幅
        canvas.layer.borderColor = CGColor.init(srgbRed: 1, green: 0, blue: 0, alpha: 1)    //枠線色
        view.addSubview(canvas)
        
        //
//        view.isOpaque = false
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)    //UIViewの背景色
        
        canvas.tool = PKInkingTool(.pencil, color: .blue ,width:  30)
        // PKToolPicker: ドラッグして移動できるツールパレット (ペンや色などを選択できるツール)
        if let window = UIApplication.shared.windows.first {
            if let toolPicker = PKToolPicker.shared(for: window) {
                toolPicker.addObserver(canvas)
                toolPicker.setVisible(true, forFirstResponder: canvas)
                
                canvas.becomeFirstResponder()
            }
        }
        
    }
    
}

