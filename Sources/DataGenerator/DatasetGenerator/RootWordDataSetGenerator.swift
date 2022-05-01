//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation

public class RootWordDataSetGenerator :DataSetGenerator{
    
    /**
     * Constructor for the RootWordDataSetGenerator which takes input the data directory, the pattern for the training files
     * included, includepunctuation, and an instanceGenerator. The constructor calls its super class with these inputs.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
        - includePunctuation If true, punctuation symbols are also included in the dataset, false otherwise.
        - rootWordInstanceGenerator The instance generator used to generate the dataset.
     */
   public init(directory: String, pattern: String, includePunctuation: Bool, rootWordInstanceGenerator: RootWordInstanceGenerator) {
        super.init(directory: directory, pattern: pattern, includePunctuation: includePunctuation, instanceGenerator: rootWordInstanceGenerator)
    }
}
