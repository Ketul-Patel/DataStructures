//
//  SinglyLinkedList.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
import Foundation
struct SinglyLinkedList<T: Equatable> {
    // set up the HeadNode (head is different from the rest because it only has a next no value)
    // Give it a type SinglyNode (so that next will be of the SinglyNode type)
    var head = HeadNode<SinglyNode<T>>()
    // method to find a node given a value of type T (equatable specified by struct)
    func findNodeWithValue(value: T) -> SinglyNode<T>? {
        // unpack the next of the HeadNode as currentNode (unpack as var b/c we will update currentNode)
        if var currentNode = head.next {
            while currentNode.value != value {
                // unpack the currentNode's next
                if let nextNode = currentNode.next {
                    // update currentNode
                    currentNode = nextNode
                } else {
                    // didn't find it!
                    return nil
                }
            }
            // found it!
            return currentNode
        } else {
            // didn't even have a list!
            return nil
        }
    }
    func insertNodeWithValue(newValue newVal: T, afterNodeWithValue afterVal: T) -> Bool {
        // find the Node that we want to add after
        if let prevNode = findNodeWithValue(afterVal) {
            // if that node has a next then we keep track of it
            if let nextNode = prevNode.next {
                // create the node with next = nextNode
                prevNode.next = SinglyNode<T>(value: newVal, nextNode: nextNode)
                return true
            } else {
                // the node is the last one so we don't need to add a Node with a next
                prevNode.next = SinglyNode<T>(value: newVal, nextNode: nil)
                return true
            }
        } else {
            // we didn't find the node to add after
            return false
        }
    }
    func insertNodeWithValue(newValue newVal: T) -> SinglyNode<T> {
        // unpack head.next to see if we have anything
        if var currentNode = head.next {
            // while loop with optional binding
            while let nextNode = currentNode.next {
                // while there is a next, keep going
                currentNode = nextNode
            }
            // set the last node's next to the new node
            currentNode.next = SinglyNode<T>(value: newVal, nextNode: nil)
            // force unwrap because we already know it's there
            return currentNode.next!
        } else {
            // add the first Node
            head.next = SinglyNode<T>(value: newVal, nextNode: nil)
            // force unwrap becasue we already know it's there
            return head.next!
        }
    }
    func displayNodes() {
        println("Printing Nodes!")
        // first set the currentNode if the list has at least 1 value
        if var currentNode = head.next {
            // print first value
            println("First Node's Value is \(currentNode.value!)")
            // keep looping until you hit the end and print each value
            while let nextNode = currentNode.next {
                currentNode = nextNode
                println("Next Node's Value is \(currentNode.value!)")
            }
        } else {
            // head.next is nil so the list is empty
            println("List is empty")
        }
    }
    // finds node before the node with value beforeVal
    func findNodeBeforeNodeWithValue(beforeVal: T) -> SinglyNode<T>? {
        // if there are nodes
        if var currentNode = head.next {
            // while there are more nodes
            while let nextNode = currentNode.next {
                // if the nextNode doesn't match keep going
                if nextNode.value != beforeVal {
                    currentNode = nextNode
                } else {
                    // else we found it!
                    return currentNode
                }
                
            }
            // didn't find it
            return nil
        } else {
            // no nodes at all
            return nil
        }
    }
    // remove a node with a given value
    func removeNodeWithValue(value: T) -> Bool {
        // first check the first node (uses optional chaining)
        if head.next?.value == value {
            // set next to next of next (ARC handles removing the node)
            head.next = head.next!.next
            return true
        } else {
            // find the node before
            if var previousNode = findNodeBeforeNodeWithValue(value) {
                // if we found it reassign next to next of next (let ARC deinitialize)
                previousNode.next = previousNode.next!.next
                return true
            } else {
                // else we didn't find it!
                return false
            }
        }
    }
    // MARK: Stack Methods
    // pop
    func pop() -> SinglyNode<T>? {
        // if there is a list
        if var currentNode = head.next {
            // initialize returnNode
            var returnNode: SinglyNode<T>? = nil
            // loop through until you hit 1 before the last
            while currentNode.next?.next != nil {
                currentNode = currentNode.next!
            }
            // if you are second to last
            if currentNode.next != nil {
                // set last as the return value
                returnNode = currentNode.next
                // set last to nil
                currentNode.next = nil
            } else {
                // this handles the case with only one node
                returnNode = currentNode
                // sets head.next to nil
                head.next = nil
            }
            // return returnNode
            return returnNode
        } else {
            // or nil if there is no list
            return nil
        }
    }
    // push
    func push(newNodeWithValue newVal: T) -> SinglyLinkedList<T> {
        // implemented push functionality in insertNodeWithValue
        insertNodeWithValue(newValue: newVal)
        return self
    }
    // MARK: Queue Methods
    func enqueue(newNodeWithValue newVal: T) -> SinglyLinkedList<T>? {
        // enqueue at the end of the list no matter what (same as push)
        insertNodeWithValue(newValue: newVal)
        return self
    }
    func dequeue() -> SinglyNode<T>? {
        if var currentNode = head.next {
            if var nextNode = currentNode.next {
                head.next = nextNode
            } else {
                head.next = nil
            }
            return currentNode
        } else {
            return nil
        }
    }
    
}