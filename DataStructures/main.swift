//
//  main.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
//println("Testing out Singly Linked List")
//var ssl = SinglyLinkedList<Int>()
//println("*** testing queue ***")
//ssl.enqueue(newNodeWithValue: 1)
//ssl.enqueue(newNodeWithValue: 2)
//ssl.enqueue(newNodeWithValue: 3)
//ssl.dequeue()
//ssl.dequeue()
//ssl.dequeue()
//println("*** testing stack ***")
//ssl.push(newNodeWithValue: 1)
//ssl.push(newNodeWithValue: 2)
//ssl.push(newNodeWithValue: 3)
//ssl.pop()
//ssl.pop()
//ssl.pop()
//println("*** testing basic SLL methods ***")
//ssl.insertNodeWithValue(newValue: 0)
//ssl.insertNodeWithValue(newValue: 1, afterNodeWithValue: 0)
//ssl.insertNodeWithValue(newValue: 2, afterNodeWithValue: 1)
//ssl.removeNodeWithValue(5)
//ssl.displayNodes()
//
//
//println("Testing out Binary Search Tree")
//var bst = BinarySearchTree<Int>()
//bst.insertNodeWithValue(9)
//bst.insertNodeWithValue(12)
//bst.insertNodeWithValue(15)
//bst.insertNodeWithValue(17)
//bst.insertNodeWithValue(16)
//bst.insertNodeWithValue(4)
//bst.inOrder(bst.root)

println("Testing out Trie")
var trie = TrieDictionary()
trie.addWord("ball")
trie.addWord("bat")
trie.addWord("hat")
trie.addWord("ham")
trie.addWord("bats")
var words = trie.findWordsStartingWith("")
for word in words {
    println(word)
}