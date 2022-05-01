//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class CaseAttribute : DiscreteAttribute{
    
    /**
     * Discrete attribute for a given word. If the last inflectional group of the word contains case information, the
     * attribute will have that case value. Otherwise the attribute will have the value null.
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(value: parse.lastIGContainsCase())
    }
}
