//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import NamedEntityRecognition

public class IsOrganizationGazetteer : BinaryAttribute{
    
    public static var gazetteer : Gazetteer = Gazetteer(name: "ORGANIZATION", fileName: "gazetteer-organization.txt")

    /**
     * Binary attribute for a given word. If the word is listed in the Organization Gazetteer file, the attribute will
     * have the value "true", otherwise "false".
     - Parameters:
        - surfaceForm Surface form of the word.
     */
    public init(surfaceForm: String){
        super.init(value: IsOrganizationGazetteer.gazetteer.contains(word: surfaceForm))
    }
}
