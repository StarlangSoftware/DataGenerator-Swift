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

public class RootWordInstanceGenerator : InstanceGenerator{
    
    public func addAttributesForPreviousWords(current: Instance, sentence: Sentence, wordIndex: Int){
    }
    
    public func addAttributesForEmptyWords(current: Instance, emptyWord: String){
    }

    public override func generateInstanceFromSentence(sentence: Sentence, wordIndex: Int) -> Instance {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let current = Instance(classLabel: (word.getParse()?.getWord().getName())!)
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
