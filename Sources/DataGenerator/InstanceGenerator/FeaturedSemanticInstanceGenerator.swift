//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import MorphologicalAnalysis
import WordNet
import Classification
import Corpus
import AnnotatedSentence

public class FeaturedSemanticInstanceGenerator : SemanticInstanceGenerator{
    
    /**
     * Constructor method. Gets input window size and sets the corresponding variable.
     - Parameters:
        - fsm Morphological analyzer to be used.
        - wordNet Wordnet to be used.
        - windowSize Number of previous (next) words to be considered in adding attributes.
     */
    public init(fsm: FsmMorphologicalAnalyzer, wordNet: WordNet, windowSize: Int){
        super.init(fsm: fsm, wordNet: wordNet)
        self.windowSize = windowSize
    }
    
    /**
     * Abstract function for adding attributes to the word sense disambiguation problem. Depending on your design
     * you can add as many attributes as possible. The number of attributes in this function should be equal to the
     * number of attributes in the function addAttributesForEmptyWords.
     - Parameters:
        - current Current classification instance
        - sentence Input sentence.
        - wordIndex The index of the word in the sentence.
     */
    public override func addAttributesForWords(current: Instance, sentence: Sentence, wordIndex: Int) {
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let parse = word.getParse()
        
        current.addAttribute(attribute: IsAdjectiveAttribute(parse: parse!))
        current.addAttribute(attribute: IsAuxiliaryVerbAttribute(parse: parse!))
        current.addAttribute(attribute: IsCapitalAttribute(surfaceForm: word.getName()))
        current.addAttribute(attribute: IsDateAttribute(parse: parse!))
        current.addAttribute(attribute: IsFractionAttribute(parse: parse!))
        
        current.addAttribute(attribute: IsHonorificAttribute(surfaceForm: word.getName()))
        current.addAttribute(attribute: IsMoneyAttribute(surfaceForm: word.getName()))
        current.addAttribute(attribute: IsNumberAttribute(parse: parse!))
        current.addAttribute(attribute: IsOrganizationAttribute(surfaceForm: word.getName()))
        
        current.addAttribute(attribute: IsProperNounAttribute(parse: parse!))
        current.addAttribute(attribute: IsRealAttribute(parse: parse!))
        current.addAttribute(attribute: IsTimeAttribute(surfaceForm: word.getName()))
        
        current.addAttribute(attribute: LastIGContainsPossessiveAttribute(parse: parse!))
        current.addAttribute(attribute: LastIGContainsTagAblativeAttribute(parse: parse!))
        current.addAttribute(attribute: LastIGContainsTagAccusativeAttribute(parse: parse!))
        current.addAttribute(attribute: LastIGContainsTagGenitiveAttribute(parse: parse!))
        current.addAttribute(attribute: LastIGContainsTagInstrumentalAttribute(parse: parse!))
        
        current.addAttribute(attribute: MainPosAttribute(parse: parse!))
        current.addAttribute(attribute: Predicate(sentence: sentence, index: wordIndex))
        current.addAttribute(attribute: RootPosAttribute(parse: parse!))
        current.addAttribute(attribute: RootFormAttribute(parse: parse!))
        current.addAttribute(attribute: CaseAttribute(parse: parse!))
    }
    
    /**
     * Abstract function for adding attributes for empty words to the word sense disambiguation problem. The number of
     * attributes in this function should be equal to the number of attributes in the function
     * addAttributesForWords.
     - Parameters:
        - current Current classification instance
        - emptyWord String form to place for empty words.
     */
    override func addAttributesForEmptyWords(current: Instance, emptyWord: String) {
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        current.addAttribute(attribute: BinaryAttribute(value: false))
        
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
        current.addAttribute(attribute: DiscreteAttribute(value: "NULL"))
    }
}
