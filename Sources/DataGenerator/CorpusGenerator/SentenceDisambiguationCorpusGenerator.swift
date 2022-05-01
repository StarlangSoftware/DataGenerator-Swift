//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 1.05.2022.
//

import Foundation
import AnnotatedSentence
import MorphologicalAnalysis

public class SentenceDisambiguationCorpusGenerator{
    
    private var annotatedCorpus: AnnotatedCorpus
    
    /**
     * Constructor for the SentenceDisambiguationCorpusGenerator which takes input the data directory and the pattern for the
     * training files included. The constructor loads the corpus from the given directory including the given files
     * having the given pattern.
     - Parameters:
        - directory Directory where the sentence files reside.
        - pattern Pattern of the sentence files to be included in the corpus. Use "." for all files.
     */
    public init(directory: String, pattern: String){
        annotatedCorpus = AnnotatedCorpus(folder: directory, pattern: pattern)
    }
    
    /**
     * Creates a morphological disambiguation corpus from the corpus.
     *
        - Returns: Created disambiguation corpus.
     */
    public func generate() -> DisambiguationCorpus{
        let corpus = DisambiguationCorpus()
        for i in 0..<annotatedCorpus.sentenceCount(){
            let sentence = annotatedCorpus.getSentence(index: i) as! AnnotatedSentence
            let disambiguationSentence = AnnotatedSentence()
            for j in 0..<sentence.wordCount(){
                disambiguationSentence.addWord(word: DisambiguatedWord(name: sentence.getWord(index: j).getName(), parse: (sentence.getWord(index: j) as! AnnotatedWord).getParse()!))
            }
            corpus.addSentence(s: disambiguationSentence)
        }
        return corpus
    }
}
