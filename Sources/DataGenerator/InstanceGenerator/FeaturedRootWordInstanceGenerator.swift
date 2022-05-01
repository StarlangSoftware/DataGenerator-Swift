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

public class FeaturedRootWordInstanceGenerator : RootWordInstanceGenerator{
    
    /**
     * Constructor method. Gets input window size and sets the corresponding variable.
     - Parameters:
        - windowSize Number of previous (next) words to be considered in adding attributes.
     */
    public convenience init(windowSize: Int){
        self.init()
        self.windowSize = windowSize
    }
    
    /**
     * Abstract function for adding attributes to the root word determination problem. Depending on your design
     * you can add as many attributes as possible. The number of attributes in this function should be equal to the
     * number of attributes in the function addAttributesForEmptyWords.
     - Parameters:
        - current Current classification instance
        - sentence Input sentence.
        - wordIndex The index of the word in the sentence.
     */
    public override func addAttributesForPreviousWords(current: Instance, sentence: Sentence, wordIndex: Int) {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let parse = word.getParse()
        current.addAttribute(attribute: MainPosAttribute(parse: parse!))
        current.addAttribute(attribute: IsCapitalAttribute(surfaceForm: word.getName()))
    }
    
    /**
     * Abstract function for adding attributes for empty words to the root word determination problem. The number of
     * attributes in this function should be equal to the number of attributes in the function
     * addAttributesForPreviousWords.
     - Parameters:
        - current Current classification instance
        - emptyWord String form to place for empty words.
     */
    public override func addAttributesForEmptyWords(current: Instance, emptyWord: String) {
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
        current.addAttribute(attribute: BinaryAttribute(value: false))
    }
}
