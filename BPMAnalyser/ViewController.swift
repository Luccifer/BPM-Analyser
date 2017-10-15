
//
//  ViewController.swift
//  BPMAnalyser
//
//  Created by Gleb Karpushkin on 29/03/2017.
//  Copyright © 2017 Gleb Karpushkin. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    let mediaPicker: MPMediaPickerController = MPMediaPickerController(mediaTypes: .music)
    lazy var bpmLabel: UILabel = {
        let label = UILabel()
        label.frame.size.height = 300
        label.frame.size.width = UIScreen.main.bounds.width - 32
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaPicker.allowsPickingMultipleItems = false
        mediaPicker.delegate = self
        present(mediaPicker, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: MPMediaPickerControllerDelegate {

    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems
        mediaItemCollection: MPMediaItemCollection) {
        guard let asset = mediaItemCollection.items.first,
            let url = asset.assetURL else {return}
        _ = BPMAnalyzer.core.getBpmFrom(url, completion: {[weak self] (bpm) in
            self?.addLabelWith(bpm)
            self?.mediaPicker.dismiss(animated: true, completion: nil)
        })
    }
    
    func addLabelWith(_ bpm: String) {
        bpmLabel.text = String(describing:bpm)
        view.addSubview(bpmLabel)
        bpmLabel.center = view.center
        view.layoutIfNeeded()
    }
}

