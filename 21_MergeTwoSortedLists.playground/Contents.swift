import UIKit

/*
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:
 Input: list1 = [], list2 = []
 Output: []
 
 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil { return nil }
        if list1 != nil && list2 == nil { return list1 }
        if list1 == nil && list2 != nil { return list2 }
        var list1 = list1, list2 = list2
        let dummy = ListNode(-1)
        var mergedList: ListNode = dummy
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                mergedList.next = list1
                list1 = list1!.next
            } else {
                mergedList.next = list2
                list2 = list2!.next
            }
            mergedList = mergedList.next!
        }
        
        if list1 != nil {
            mergedList.next = list1
        }
        if list2 != nil {
            mergedList.next = list2
        }
        return dummy.next
    }
}

let list1 = ListNode(1, ListNode(2, ListNode(4, ListNode(6))))
let list2 = ListNode(1, ListNode(3, ListNode(4, ListNode(7, ListNode(9)))))
var mergedList = Solution().mergeTwoLists(list1, list2)
while mergedList != nil {
    print(mergedList!.val, terminator: " -> ")
    mergedList = mergedList?.next
}
