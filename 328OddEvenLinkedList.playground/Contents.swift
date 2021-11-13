// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var oddTail = head
        let evenHead = head?.next
        var evenTail = evenHead
        
        while evenTail != nil && evenTail?.next != nil {
            oddTail?.next = evenTail?.next
            oddTail = oddTail?.next
            
            evenTail?.next = oddTail?.next
            evenTail = evenTail?.next
        }
        
        oddTail?.next = evenHead
        return head
    }
}

var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
Solution().oddEvenList(head)
