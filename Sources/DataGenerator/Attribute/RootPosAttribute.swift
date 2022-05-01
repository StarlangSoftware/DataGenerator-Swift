//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class RootPosAttribute : DiscreteAttribute{
    
    /**
     * Discrete attribute for a given word. Returns the part of speech of the root word
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(value: parse.getRootPos())
    }
}
