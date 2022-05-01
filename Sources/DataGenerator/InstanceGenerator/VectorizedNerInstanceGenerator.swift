//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Dictionary
import Corpus
import AnnotatedSentence
import Classification

public class VectorizedNerInstanceGenerator : NerInstanceGenerator{
    
    private var dictionary: VectorizedDictionary
    
    /**
     * Constructor of VectorizedNerInstanceGenerator which takes input a {@link VectorizedDictionary}, a window size
     * and a word format and sets corresponding attributes with these inputs.
     - Parameters:
        - dictionary Dictionary in the vector form. Each word is stored in vector form in this dictionary.
        - windowSize Number of previous (next) words to be considered in adding attributes.
     */
    public init(dictionary: VectorizedDictionary, windowSize: Int){
        self.dictionary = dictionary
        super.init()
        self.windowSize = windowSize
    }
    
    /**
     * Abstract function for adding vectorized attributes to the named entity recognition problem. The number of
     * attributes in this function should be equal to the number of attributes in the function addAttributesForEmptyWords.
     - Parameters:
        - current Current classification instance
        - sentence Input sentence.
        - wordIndex The index of the word in the sentence.
     */
    public override func addAttributesForWords(current: Instance, sentence: Sentence, wordIndex: Int) {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let vectorizedWord = dictionary.getWord(name: word.getName()) as! VectorizedWord
        current.addVectorAttribute(vector: vectorizedWord.getVector())
    }
    
    /**
     * Abstract function for adding attributes for empty words to the named entity recognition problem. The number of
     * attributes in this function should be equal to the number of attributes in the function
     * addAttributesForWords.
     - Parameters:
        - current Current classification instance
        - emptyWord String form to place for empty words.
     */
    public override func addAttributesForEmptyWords(current: Instance, emptyWord: String) {
        let vectorizedWord = dictionary.getWord(name: emptyWord) as! VectorizedWord
        current.addVectorAttribute(vector: vectorizedWord.getVector())
    }
}
