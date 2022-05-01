//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Corpus
import Classification

public class InstanceGenerator{
    
    var windowSize: Int = -1
    
    func generateInstanceFromSentence(sentence: Sentence, wordIndex: Int) -> Instance{
        return Instance(classLabel: "")
    }
}
