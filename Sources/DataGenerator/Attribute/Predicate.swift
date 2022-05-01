//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import Classification
import Corpus
import AnnotatedSentence

public class Predicate : DiscreteAttribute{
    
    /**
     * Discrete attribute for a given word. Returns the nearest predicate word to the given word
     - Parameters:
        - sentence Sentence where current word is in.
        - index Position of the current word in the sentence
     */
    public init(sentence: Sentence, index: Int){
        super.init(value: (sentence as! AnnotatedSentence).getPredicate(index: index))
    }
}
