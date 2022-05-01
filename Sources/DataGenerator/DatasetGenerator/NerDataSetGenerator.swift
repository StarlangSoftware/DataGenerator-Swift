//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation

public class NerDataSetGenerator : DataSetGenerator{
    
    /**
     * Constructor for the NerDataSetGenerator which takes input the data directory, the pattern for the training files
     * included, and an instanceGenerator. The constructor calls its super class with these inputs.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
        - nerInstanceGenerator The instance generator used to generate the dataset.
     */
    public init(directory: String, pattern: String, nerInstanceGenerator: NerInstanceGenerator) {
        super.init(directory: directory, pattern: pattern, includePunctuation: true, instanceGenerator: nerInstanceGenerator)
    }
}
