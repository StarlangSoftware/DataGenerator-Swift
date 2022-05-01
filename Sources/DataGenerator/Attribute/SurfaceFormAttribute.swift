//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification

public class SurfaceFormAttribute : DiscreteAttribute{
    
    /**
     * Discrete attribute for a given word. Returns the surface form.
     - Parameters:
        - surfaceForm Surface form of the word.
     */
    public init(surfaceForm: String){
        super.init(value: surfaceForm)
    }
}
