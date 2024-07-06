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
    
    /// Generates a single classification instance of the WSD problem for the given word of the given sentence. If the
    /// word has not been labeled with sense tag yet, the method returns null. In the WSD problem, the system also
    /// generates and stores all possible sense labels for the current instance. In this case, a classification
    /// instance will not have all labels in the dataset, but some subset of it.
    /// - Parameters:
    ///   - sentence: Input sentence.
    ///   - wordIndex: The index of the word in the sentence.
    /// - Returns: Classification instance.
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
