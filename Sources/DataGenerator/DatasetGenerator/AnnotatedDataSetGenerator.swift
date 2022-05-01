//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import AnnotatedSentence
import Classification

public class AnnotatedDataSetGenerator{
    
    private var corpus: AnnotatedCorpus
    var instanceGenerator: InstanceGenerator
    
    /**
     * Constructor for the AnnotatedDataSetGenerator which takes input the data directory, the pattern for the
     * training files included, and an instanceGenerator. The constructor loads the sentence corpus from the given
     * directory including the given files having the given pattern.
     - Parameters:
        - directory Directory where the corpus files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
        - instanceGenerator The instance generator used to generate the dataset.
     */
    public init(directory: String, pattern: String, instanceGenerator: InstanceGenerator){
        corpus = AnnotatedCorpus(folder: directory, pattern: pattern)
        self.instanceGenerator = instanceGenerator
    }
    
    /**
     * Mutator for the instanceGenerator attribute.
     - Parameters:
        - instanceGenerator Input instanceGenerator
     */
    public func setInstanceGenerator(instanceGenerator: InstanceGenerator){
        self.instanceGenerator = instanceGenerator
    }
    
    /**
     * Creates a dataset from the corpus. Calls generateInstanceFromSentence for each parse sentence in the corpus.
     - Returns: Created dataset.
     */
    public func generate() -> DataSet{
        let dataSet = DataSet()
        for i in 0..<corpus.sentenceCount(){
            let sentence = corpus.getSentence(index: i) as! AnnotatedSentence
            for j in 0..<sentence.wordCount(){
                let generatedInstance = instanceGenerator.generateInstanceFromSentence(sentence: sentence, wordIndex: j)
                dataSet.addInstance(current: generatedInstance)
            }
        }
        return dataSet
    }
}
