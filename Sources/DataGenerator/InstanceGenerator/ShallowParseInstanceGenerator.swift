//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Corpus
import AnnotatedSentence
import Classification

public class ShallowParseInstanceGenerator : SimpleWindowInstanceGenerator{
    
    /**
     * Generates a single classification instance of the Shallow Parse problem for the given word of the given sentence.
     * If the  word has not been labeled with shallow parse tag yet, the method returns null.
     - Parameters:
        - sentence Input sentence.
        - wordIndex The index of the word in the sentence.
     - Returns: Classification instance.
     */
    public override func generateInstanceFromSentence(sentence: Sentence, wordIndex: Int) -> Instance {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let classLabel = word.getShallowParse()
        let current = Instance(classLabel: classLabel!)
        addAttributes(current: current, sentence: sentence, wordIndex: wordIndex)
        return current
    }
}
