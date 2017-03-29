# BPM-Analyser
Analyser BPM in Swift for your music/sounds/records, whatever..

# How To:
## Add theese frameworks to your Linked Frameworks and Libraries
- Add AudioToolbox.framework
- CoreMedia.framework
- AVFoundation
- libSuperpoweredAudioIOS.a
## Also copy theese files to your project:
- BMPAnalyzer.swift
- Superpower directory

## In your code implementation you can call Singleton method by:
```swift
 public func getBpmFrom(_ url: URL, completion: (String?) -> ()) -> String
```
Example:
```swift
  guard let filePath = Bundle.main.path(forResource: "TestMusic", ofType: "m4a"),
            let url = URL(string: filePath) else {return "error occured, check fileURL"}
        return BPMAnalyzer.core.getBpmFrom(url, completion: { (bpm) in })

```

You can stuck it with MPMediaPicker in delegate like this:
```swift
import UIKit
import MediaPlayer

class YourClass: UIViewController {

    let mediaPicker: MPMediaPickerController = MPMediaPickerController(mediaTypes: .music)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaPicker.allowsPickingMultipleItems = false
        mediaPicker.delegate = self
        present(mediaPicker, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

extension YourClass: MPMediaPickerControllerDelegate{

optional func mediaPicker(_ mediaPicker: MPMediaPickerController, 
        didPickMediaItems mediaItemCollection: MPMediaItemCollection)
        
        guard let asset = mediaItemCollection.items.first,
            let url = asset.assetURL else {return}
        _ = BPMAnalyzer.core.getBpmFrom(url) { [weak self] (bpm) in
            self?.mediaPicker.dismiss(animated: true, completion: nil)
            print(String(describing: bpm))
        }
}
```

## WHY?
Cause I can :D But in fact, I did't find any libs/frameworks to get BPM from media files...
