//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import MorphologicalAnalysis

public class LastIGContainsTagAttribute : BinaryAttribute{
    
    /**
     * Binary attribute for a given word. If the last inflectional group of the word contains tag,
     * the attribute will be "true", otherwise "false".
     - Parameters:
        - parse Morphological parse of the word.
        - tag Tag that is checked in the last inflectional group.
     */
    public init(parse: MorphologicalParse, tag: MorphologicalTag){
        super.init(value: parse.lastIGContainsTag(tag: tag))
    }
}
