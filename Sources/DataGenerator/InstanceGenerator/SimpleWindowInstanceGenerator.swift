//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Corpus
import Classification

public class SimpleWindowInstanceGenerator : InstanceGenerator{
    
    func addAttributesForWords(current: Instance, sentence: Sentence, wordIndex: Int){
    }
    
    func addAttributesForEmptyWords(current: Instance, emptyWord: String){
    }
    
    /**
     * addAttributes adds all attributes of the previous words, the current wordn, and next words of the given word
     * to the given instance. If the previous or next words does not exists, the method calls
     * addAttributesForEmptyWords method. If the word does not exists in the dictionary or the required annotation layer
     * does not exists in the annotated word, the method throws InstanceNotGenerated. The window size determines the
     * number of previous and next words.
     - Parameters:
        - current Current classification instance to which attributes will be added.
        - sentence Input sentence.
        - wordIndex The index of the word in the sentence.
     */
    func addAttributes(current: Instance, sentence: Sentence, wordIndex: Int){
        for i in 0..<windowSize{
            if wordIndex - windowSize + i >= 0{
                addAttributesForWords(current: current, sentence: sentence, wordIndex: wordIndex - windowSize + i)
            } else {
                addAttributesForEmptyWords(current: current, emptyWord: "<s>")
            }
        }
        addAttributesForWords(current: current, sentence: sentence, wordIndex: wordIndex)
        for i in 0..<windowSize{
            if wordIndex + i + 1 < sentence.wordCount(){
                addAttributesForWords(current: current, sentence: sentence, wordIndex: wordIndex + i + 1)
            } else {
                addAttributesForEmptyWords(current: current, emptyWord: "</s>")
            }
        }
    }
}
