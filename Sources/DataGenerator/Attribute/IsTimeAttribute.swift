//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import Dictionary

public class IsTimeAttribute : BinaryAttribute{
    
    /**
     * Binary attribute for a given word. If the word represents a time form, the attribute will have the
     * value "true", otherwise "false".
     - Parameters:
        - surfaceForm Surface form of the word.
     */
    public init(surfaceForm: String){
        super.init(value: Word.isTime(surfaceForm: surfaceForm))
    }
}
