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

public class DisambiguationInstanceGenerator : InstanceGenerator{
    
    public func addAttributesForPreviousWords(current: Instance, sentence: Sentence, wordIndex: Int){
    }
    
    public func addAttributesForEmptyWords(current: Instance, emptyWord: String){
    }
    
    /// Generates a single classification instance of the morphological disambiguation problem for the given word of the
    /// given sentence. If the word does not have a morphological parse, the method throws InstanceNotGenerated.
    /// - Parameters:
    ///   - sentence: Input sentence.
    ///   - wordIndex: The index of the word in the sentence.
    /// - Returns: Classification instance.
    public override func generateInstanceFromSentence(sentence: Sentence, wordIndex: Int) -> Instance {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let current = Instance(classLabel: (word.getParse()?.getTransitionList())!)
        for i in 0..<windowSize{
            if wordIndex - windowSize + i >= 0{
                addAttributesForPreviousWords(current: current, sentence: sentence, wordIndex: wordIndex - windowSize + i)
            } else {
                addAttributesForEmptyWords(current: current, emptyWord: "<s>")
            }
        }
        addAttributesForPreviousWords(current: current, sentence: sentence, wordIndex: wordIndex)
        return current
    }
}
