//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import NamedEntityRecognition

public class IsLocationGazetteer : BinaryAttribute{
    
    public static var gazetteer : Gazetteer = Gazetteer(name: "LOCATION", fileName: "gazetteer-location.txt")
    
    /**
     * Binary attribute for a given word. If the word is listed in the Location Gazetteer file, the attribute will
     * have the value "true", otherwise "false".
     - Parameters:
        - surfaceForm Surface form of the word.
     */
    public init(surfaceForm: String){
        super.init(value: IsLocationGazetteer.gazetteer.contains(word: surfaceForm))
    }
    
}
