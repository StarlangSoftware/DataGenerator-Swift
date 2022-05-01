//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class IsProperNounAttribute : BinaryAttribute{
    
    /**
     * Binary attribute for a given word. If the word represents a date (if the morphological parse contains
     * tag PROPERNOUN), the attribute will have the value "true", otherwise "false".
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(value: parse.isProperNoun())
    }
}
