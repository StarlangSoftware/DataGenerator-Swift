//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import Dictionary

public class IsHonorificAttribute : BinaryAttribute{
    
    public init(surfaceForm: String){
        super.init(value: Word.isHonorific(surfaceForm: surfaceForm))
    }
    
}
