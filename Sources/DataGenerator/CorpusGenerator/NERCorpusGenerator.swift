//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import AnnotatedTree
import NamedEntityRecognition
import AnnotatedSentence

public class NERCorpusGenerator {
    
    private var treeBank: TreeBankDrawable
    
    /**
     * Constructor for the NERCorpusGenerator which takes input the data directory and the pattern for the training files
     * included. The constructor loads the treebank from the given directory including the given files having the given
     * pattern.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
     */
    public init(directory: String, pattern: String){
        treeBank = TreeBankDrawable(folder: directory, pattern: pattern)
    }
    
    /**
     * Creates a named entity recognition corpus from the treeBank. Calls generateAnnotatedSentence for each parse tree
     * in the treebank.
     *
        - Returns: Created corpus.
     */
    public func generate()-> NERCorpus{
        let corpus = NERCorpus(fileName: "")
        for i in 0..<treeBank.size(){
            let parseTree = treeBank.get(index: i) as! ParseTreeDrawable
            if parseTree.layerAll(viewLayerType: ViewLayerType.NER){
                let sentence = parseTree.generateAnnotatedSentence()
                corpus.addSentence(s: sentence)
            }
        }
        return corpus
    }
}
