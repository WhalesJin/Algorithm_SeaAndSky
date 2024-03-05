// 연결리스트의 head가 주어지면 오름차순으로 정렬한 후 목록을 반환합니다.
// Input: head = [4,2,1,3] -> Output: [1,2,3,4]

// LeetCode에서 주는 연결리스트
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// 찾아본 풀이 응용(https://www.liuchuo.net/archives/5193)
// 연결리스트 넣고 빼는 자체가 계속 아리까리
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var arr = [Int](repeating: 0, count: 256*128) // 2^15을 이렇게...!
        var p = head, i = 0

        while let q = p { // 옵셔널 바인딩 굿
            arr[i] = q.val
            p = q.next
            i += 1
        }
        
        arr = arr[..<i].sorted() // 이러면 i 인덱스 전까지만 sort인가보다 오오
        
        p = head
        i = 0
        
        while let q = p {
            q.val = arr[i]
            p = q.next
            i += 1
        }
        
        return head
    }
}
