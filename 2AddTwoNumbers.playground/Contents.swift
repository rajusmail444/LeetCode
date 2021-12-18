import UIKit

/*
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

Example 1:
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807

Example 2:
Input: l1 = [0], l2 = [0]
Output: [0]

Example 3:
Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else { return nil}
        var reminder = (l1.val + l2.val) / 10
        let l3: ListNode? = ListNode((l1.val + l2.val) % 10)
        var l1next = l1.next
        var l2next = l2.next
        var current = l3
        while l1next != nil || l2next != nil || reminder > 0 {
            var l3Val = reminder
            if let first = l1next {
                l3Val += first.val
            }
            if let second = l2next {
                l3Val += second.val
            }
            current?.next = ListNode(l3Val % 10)
            reminder = l3Val / 10
            l1next = l1next?.next
            l2next = l2next?.next
            current = current?.next
        }
        return l3
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let l3 = Solution().addTwoNumbers(l1, l2)

print("l3: \(l3?.val)")
print("l3.next: \(l3?.next?.val)")
print("l3.next.next: \(l3?.next?.next?.val)")
