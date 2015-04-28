//
//  TrieNode.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

class TrieDictionaryNode {
    var key: String!
    var children: Array<TrieDictionaryNode>
    var isWord: Bool
    var length: Int {
        return count(key)
    }
    
    init(key: String) {
        self.key = key
        self.children = Array<TrieDictionaryNode>()
        self.isWord = false
    }
}
