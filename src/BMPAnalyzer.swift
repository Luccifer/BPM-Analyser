//
//  BPMAnalyzer.swift
//  BPMAnalyzer
//
//  Created by Gleb Karpushkin on 29/03/2017.
//  Copyright © 2017 Gleb Karpushkin. All rights reserved.
//

public final class BPMAnalyzer {
    
    public static let core = BPMAnalyzer()
    
    public func getBpmFrom(_ url: URL, completion: ((String) -> ())?) -> String {
        guard let bpmString: String = Superpowered().offlineAnalyze(url) else {return "Error analizing BPM"}
        if completion != nil {
            completion!(bpmString)
        }
        return Superpowered().offlineAnalyze(url)
    }
    
}

