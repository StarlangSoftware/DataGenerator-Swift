//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import MorphologicalAnalysis
import WordNet
import AnnotatedSentence
import Classification
import Corpus

public class SemanticInstanceGenerator : SimpleWindowInstanceGenerator{
    
    private var fsm: FsmMorphologicalAnalyzer
    private var wordNet: WordNet
    
    /**
     * Constructor for the semantic instance generator. Takes morphological analyzer and wordnet as input to set the
     * corresponding variables.
     - Parameters:
        - fsm Morphological analyzer to be used.
        - wordNet Wordnet to be used.
     */
    public init(fsm: FsmMorphologicalAnalyzer, wordNet: WordNet){
        self.fsm = fsm
        self.wordNet = wordNet
    }
    
    public override func generateInstanceFromSentence(sentence: Sentence, wordIndex: Int) -> Instance {
        let possibleSynSets = (sentence as! AnnotatedSentence).constructSynSets(wordNet: wordNet, fsm: fsm, wordIndex: wordIndex)
        let word = sentence.getWord(index: wordIndex) as! AnnotatedWord
        let classLabel = word.getSemantic()
        let current = CompositeInstance(classLabel: classLabel!)
        var possibleClassLabels : [String] = []
        for synSet in possibleSynSets{
            possibleClassLabels.append(synSet.getId())
        }
        current.setPossibleClassLabels(possibleClassLabels: possibleClassLabels)
        addAttributes(current: current, sentence: sentence, wordIndex: wordIndex)
        return current
    }
}
