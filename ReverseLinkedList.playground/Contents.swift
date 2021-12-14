import UIKit

/*
    Question: Reverse Linked list
    Reverse a single linked list.
 
    Input: 1->2->3->4->5->nil
    Output: 5->4->3->2->1->nil
 */

final class LinkedNode {
    var val: Int
    var next: LinkedNode?
    
    init(val: Int) {
        self.val = val
    }
}

final class ReverseLinkedList {
    static func reverse(_ node: LinkedNode?) -> LinkedNode? {
        // if it's empty we can safely return nil
        guard let node = node else { return nil }
        
        // get hold of the next node
        var nextNode = node.next
        
        // get hold of the current node val, we'll use it to act as previous value
        var currentNode = LinkedNode(val: node.val)
        
        // Loop through the LinkedNode and reverse them
        while nextNode != nil {
            let newNode = LinkedNode(val: nextNode!.val)
            newNode.next = currentNode
            
            // So that the next loop cycle, it'll act like a previous value
            currentNode = newNode
            
            // to ensure we can safely exit while loop
            nextNode = nextNode?.next
        }
        return currentNode
    }
}

var linkedNode = LinkedNode(val: 1)
linkedNode.next = LinkedNode(val: 2)
linkedNode.next?.next = LinkedNode(val: 3)
linkedNode.next?.next?.next = LinkedNode(val: 4)
linkedNode.next?.next?.next?.next = LinkedNode(val: 5)
let answer = ReverseLinkedList.reverse(linkedNode)

print("rootNode \(answer?.val)")
print("node1 \(answer?.next?.val)")
print("node2 \(answer?.next?.next?.val)")
print("node3 \(answer?.next?.next?.next?.val)")
print("node4 \(answer?.next?.next?.next?.next?.val)")
print("node5 \(answer?.next?.next?.next?.next?.next?.val)")
