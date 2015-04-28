//
//  Trie.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
import Foundation
struct TrieDictionary {
    var root: TrieDictionaryNode!
    init() {
        root = TrieDictionaryNode(key: "")
    }
    
    func addWord(keyword: String) {
        // if the word is an empty string don't do anything
        if count(keyword) == 0 {
            return
        }
        // start at the root node
        var current: TrieDictionaryNode = root
        // initialize the searchKey (the substring that will match the node's key)
        var searchKey: String!
        // while we still havn't gotten to the level that we should be at
        while count(keyword) != current.length {
            // next child to go on to
            var nextChild: TrieDictionaryNode? = nil
            // need to create String.Index for getting the actual substring up to the index
            var index: String.Index = advance(keyword.startIndex, current.length + 1)
            var searchKey = keyword.substringToIndex(index)
            
            // loop through and find the nextChild
            for child in current.children {
                if child.key == searchKey {
                    nextChild = child
                    break
                }
            }
            
            // if we didn't find a nextChild create one
            if nextChild == nil {
                nextChild = TrieDictionaryNode(key: searchKey)
                current.children.append(nextChild!)
            }
            // move on to the nextChild
            current = nextChild!
        }
        // once we've added the whole word (or gone through the whole word) we tell current that it is a full word!
        if count(keyword) == current.length {
            current.isWord = true
            return
        }
    }
    
    func findWordsStartingWith(keyword: String) -> Array<String>! {
        var current: TrieDictionaryNode = root
        var searchKey: String!
        var words: Array<String>! = Array<String>()
        if count(keyword) == 0 {
            listWordsBranchingFrom(root, collectThemIn: &words!)
        }
        
        while count(keyword) != current.length {
            var nextChild: TrieDictionaryNode? = nil
            var index: String.Index = advance(keyword.startIndex, current.length + 1)
            var searchKey = keyword.substringToIndex(index)
            
            for child in current.children {
                if child.key == searchKey {
                    nextChild = child
                    current = nextChild!
                    break
                }
            }
            
            if nextChild == nil {
                return words
            }
        }
        
        if current.key == keyword && count(keyword) != 0 {
            listWordsBranchingFrom(current, collectThemIn: &words!)
        }
        return words
    }
    private func listWordsBranchingFrom(node: TrieDictionaryNode, inout collectThemIn collector: Array<String>) {
        if node.isWord == true {
            collector.append(node.key)
        }
        if node.children.count == 0 {
            return
        } else {
            for child in node.children {
                listWordsBranchingFrom(child, collectThemIn: &collector)
            }
        }
    }
}
