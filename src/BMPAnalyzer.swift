//
//  BMPAnalyzer.swift
//  BPMAnalyzer
//
//  Created by Gleb Karpushkin on 29/03/2017.
//  Copyright © 2017 Gleb Karpushkin. All rights reserved.
//

public final class BPMAlanyzer {
    
    public static let core = BPMAlanyzer()
    
    public func getBpmFrom(_ url: URL) -> String {
        return Superpowered().offlineAnalyze(url)
    }
    
}
