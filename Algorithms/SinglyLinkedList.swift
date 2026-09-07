public class ListNode {
      public var val: Int
      public var next: ListNode?

      public init(_ val: Int) { self.val = val; }
}

var root = ListNode(1)
root.next = ListNode(2)
root.next?.next = ListNode(3)
root.next?.next?.next = ListNode(4)


func traverse(root: ListNode?) {
    var current: ListNode? = root
    var result: String = ""
    while let node = current {

        result.append(String(node.val))
        if node.next != nil {
            result.append(" -> ")
        }
        current = node.next
    }

    print(result)
}


class LinkedList {
    var array: [Int] = []
    var root: ListNode?


    func get(_ index: Int) -> Int {
        var indexCount: Int = 0
        var current: ListNode? = self.root
        while let node = current {
            if indexCount == index {
                if let val = current?.val {
                    return val
                }
            }
            indexCount += 1
            current = node.next
        }

        return -1
    }

    func insertHead(_ value: Int) {
        let temp = self.root
        let newRoot = ListNode(value)
        self.root = newRoot
        newRoot.next = temp
    }

    func insertTail(_ val: Int) {
        var current: ListNode? = self.root
        let newNode = ListNode(val)
        while let node = current {
            if node.next == nil {
                node.next = newNode
                return
            }
            current = node.next
        }
    }

    func getValues() -> [Int] {
        var array: [Int] = []
        var current: ListNode? = self.root
        while let node = current {
            array.append(node.val)
            current = node.next
        }
        return array
    }

    func delete(_ index: Int)  {
        var indexCount: Int = 0
        var current: ListNode? = self.root
        while let node = current {
            let nextIndex = indexCount + 1

            if nextIndex == index {
                node.next = current?.next?.next
            }
            indexCount += 1
            current = node.next
        }
    }
}


var obj = LinkedList()

obj.insertHead(1)
obj.insertHead(5)
obj.insertHead(7)
obj.insertTail(10)
traverse(root: obj.root)
obj.delete(1)

// print(obj.getValues())
// let val = obj.get(4)
// print(val)


// obj.insertHead(15)
traverse(root: obj.root)
