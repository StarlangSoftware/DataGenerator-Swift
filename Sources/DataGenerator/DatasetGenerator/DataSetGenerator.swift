//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import AnnotatedTree
import Classification

public class DataSetGenerator{
    
    private var treeBank: TreeBankDrawable
    var instanceGenerator: InstanceGenerator
    
    /**
     * Constructor for the DataSetGenerator which takes input the data directory, the pattern for the training files
     * included, includepunctuation, and an instanceGenerator. The constructor loads the treebank from the given directory
     * including the given files having the given pattern. If punctuations are not included, they are removed from
     * the data.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
        - includePunctuation If true, punctuation symbols are also included in the dataset, false otherwise.
        - instanceGenerator The instance generator used to generate the dataset.
     */
    public init(directory: String, pattern: String, includePunctuation: Bool, instanceGenerator: InstanceGenerator){
        treeBank = TreeBankDrawable(folder: directory, pattern: pattern)
        self.instanceGenerator = instanceGenerator
        if !includePunctuation{
            treeBank.stripPunctuation()
        }
    }
    
    /**
     * The method generates a set of instances (an instance from each word in the tree) from a single tree. The method
     * calls the instanceGenerator for each word in the sentence.
     - Parameters:
        - parseTree Parsetree for which a set of instances will be created
     - Returns: An array of instances.
     */
    func generateInstanceListFromTree(parseTree: ParseTreeDrawable)-> [Instance]{
        var instanceList : [Instance] = []
        let annotatedSentence = parseTree.generateAnnotatedSentence()
        for i in 0..<annotatedSentence.wordCount(){
            let generatedInstance = instanceGenerator.generateInstanceFromSentence(sentence: annotatedSentence, wordIndex: i)
            instanceList.append(generatedInstance)
        }
        return instanceList
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
     * Creates a dataset from the treeBank. Calls generateInstanceListFromTree for each parse tree in the treebank.
     - Returns: Created dataset.
     */
    public func generate() -> DataSet{
        let dataSet = DataSet()
        for i in 0..<treeBank.size(){
            let parseTree = treeBank.get(index: i) as! ParseTreeDrawable
            dataSet.addInstanceList(instanceList: generateInstanceListFromTree(parseTree: parseTree))
        }
        return dataSet
    }
}
