# BPM-Analyser

![](https://img.shields.io/badge/swift-4.0-green.svg)
![](https://img.shields.io/badge/platform-ios-gray.svg)

Analyser BPM in Swift for your music/sounds/records, whatever..
Powered with [Superpowered](http://superpowered.com)

# Preview:
![](https://github.com/Luccifer/BPM-Analyser/blob/master/preview.gif)

# How To:

## Copy theese files to your project:
- BMPAnalyzer.swift
- Superpower directory

## Also add theese frameworks to your Linked Frameworks and Libraries
- Add AudioToolbox.framework
- CoreMedia.framework
- AVFoundation
- libSuperpoweredAudioIOS.a (From repo: /src/Superpowered, you added it to project in the previous step

## In your code implementation you can call Singleton method by:
```swift
 public func getBpmFrom(_ url: URL, completion: (String?) -> ()) -> String
```
Example:
```swift
guard let filePath = Bundle.main.path(forResource: "TestMusic", ofType: "m4a"),
let url = URL(string: filePath) else {return "error occured, check fileURL"}
BPMAnalyzer.core.getBpmFrom(url, completion: nil)

```

You can stuck it with MPMediaPicker in delegate like this:
```swift
import UIKit
import MediaPlayer

class YourClassViewController: UIViewController {

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

extension YourClassViewController: MPMediaPickerControllerDelegate {

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

```
### Look Example project in case of misunderstanding! :)

## WHY?
Cause I can :D But in fact, I did't find any libs/frameworks to get BPM from media files...

# WHY Superpowered?
Cause it is the [fastest lib I have found](http://superpowered.com)

# Feel FREE to PR or contribuctions/issues/remarks

## BUGS/Fixes Contributors:
@o1exij - for the advice and reseraching the bug in BPM counting

@MikaTck - for alerting fatal error + Swift4 migration
