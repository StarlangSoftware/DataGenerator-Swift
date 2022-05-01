//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation

public class DisambiguationDataSetGenerator : DataSetGenerator{
    
    /**
     * Constructor for the DisambiguationDataSetGenerator which takes input the data directory, the pattern for the training files
     * included, includepunctuation, and an instanceGenerator. The constructor calls its super class with these inputs.
     - Parameters:
        - directory Directory where the treebank files reside.
        - pattern Pattern of the tree files to be included in the treebank. Use "." for all files.
        - includePunctuation If true, punctuation symbols are also included in the dataset, false otherwise.
        - disambiguationInstanceGenerator The instance generator used to generate the dataset.
     */
    public init(directory: String, pattern: String, includePunctuation: Bool, disambiguationInstanceGenerator: DisambiguationInstanceGenerator){
        super.init(directory: directory, pattern: pattern, includePunctuation: includePunctuation, instanceGenerator: disambiguationInstanceGenerator)
    }
}
