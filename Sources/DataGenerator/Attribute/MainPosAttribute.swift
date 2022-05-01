//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class MainPosAttribute : DiscreteAttribute{
    
    /**
     * Discrete attribute for a given word. Returns the last part of speech (main part of speech) of the word
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(value: parse.getPos())
    }
}
