// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var current = head
        while current != nil {
            let nextNode = current?.next
            if current?.val == nextNode?.val {
                current?.next = nextNode?.next
            } else {
                current = nextNode
            }
        }
        return head
    }
}

var head = ListNode(1, ListNode(1, ListNode(2, nil)))
Solution().deleteDuplicates(head)
