//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class LastIGContainsPossessiveAttribute : BinaryAttribute{
    
    /**
     * Binary attribute for a given word. If the last inflectional group of the word contains POSSESSIVE tag,
     * the attribute will be "true", otherwise "false".
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(value: parse.lastIGContainsPossessive())
    }
}
