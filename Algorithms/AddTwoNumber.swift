  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) { self.val = val; }
  }

  var root = ListNode(1)
  root.next = ListNode(2)
  root.next?.next = ListNode(3)

  var root2 = ListNode(2)
  root2.next = ListNode(5)
  root2.next?.next = ListNode(7)

  var currentFirst: ListNode? = root
  var currentSecond: ListNode? = root2

  var newList: ListNode? = ListNode(0)

  var dummy: ListNode? = newList

  while currentFirst != nil {
      let value = currentFirst!.val + currentSecond!.val
      currentFirst = currentFirst?.next
      currentSecond = currentSecond?.next
      dummy?.next = ListNode(value)
      dummy = dummy?.next

  }

  var current: ListNode? = newList?.next

  while current != nil {
      print(current?.val ?? 0)
      current = current?.next
  }
