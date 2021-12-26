import UIKit

/*
 Given the head of a singly linked list, return true if it is a palindrome.
 Example 1:
 Input: head = [1,2,2,1]
 Output: true
 
 Example 2:
 Input: head = [1,2]
 Output: false
  
 Constraints:
 The number of nodes in the list is in the range [1, 105].
 0 <= Node.val <= 9

 Follow up: Could you do it in O(n) time and O(1) space?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var head = head
        var slow = head
        var fast = head
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var reversed = reverse(slow)
        
        while head != nil {
            if let reversedVal = reversed?.val, reversedVal != head?.val {
                return false
            }
            
            head = head?.next
            reversed = reversed?.next
        }
        return true
    }
    
    func reverse(_ node: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current: ListNode? = node // 1234
        while current != nil {
            let nextNode = current?.next
            current?.next = previous
            previous = current
            current = nextNode
        }
        return previous
    }
}

class MySolution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var head = head
        
        var arrayHead = [Int]()
        
        while head != nil {
            arrayHead.append(head!.val)
            head = head?.next
        }
        print("arrayHead: \(arrayHead)")
        let count = arrayHead.count - 1
        for i in 0...count {
            if arrayHead[i] != arrayHead[count-i] {
                return false
            }
        }
        return true
    }
}

var head = ListNode(1, ListNode(2, ListNode(2, ListNode(3, ListNode(3, ListNode(2, ListNode(2, ListNode(1))))))))
Solution().isPalindrome(head)
//Solution().reverse(ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))


