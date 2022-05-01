//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import AnnotatedTree
import MorphologicalAnalysis
import AnnotatedSentence

public class TreeDisambiguationCorpusGenerator {
    
    private var treeBank: TreeBankDrawable
    
    /**
     * Constructor for the DisambiguationCorpusGenerator which takes input the data directory and the pattern for the
     * training files included. The constructor loads the treebank from the given directory including the given files
     * having the given pattern.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
     */
    public init(directory: String, pattern: String){
        treeBank = TreeBankDrawable(folder: directory, pattern: pattern)
    }
    
    public func generate() -> DisambiguationCorpus{
        let corpus = DisambiguationCorpus()
        for i in 0..<treeBank.size(){
            let parseTree = treeBank.get(index: i) as! ParseTreeDrawable
            if parseTree.layerAll(viewLayerType: ViewLayerType.NER){
                let sentence = parseTree.generateAnnotatedSentence()
                let disambiguationSentence = AnnotatedSentence()
                for j in 0..<sentence.wordCount(){
                    disambiguationSentence.addWord(word: DisambiguatedWord(name: sentence.getWord(index: j).getName(), parse: (sentence.getWord(index: j) as! AnnotatedWord).getParse()!))
                }
                corpus.addSentence(s: disambiguationSentence)
            }
        }
        return corpus
    }
}
