//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import MorphologicalAnalysis

public class LastIGContainsTagGenitiveAttribute : LastIGContainsTagAttribute{
    
    /**
     * Binary attribute for a given word. If the last inflectional group of the word contains GENITIVE tag,
     * the attribute will be "true", otherwise "false".
     - Parameters:
        - parse Morphological parse of the word.
     */
    public init(parse: MorphologicalParse){
        super.init(parse: parse, tag: MorphologicalTag.GENITIVE)
    }
}
