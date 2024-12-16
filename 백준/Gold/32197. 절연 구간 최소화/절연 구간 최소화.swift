import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T, T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0, !comparer(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }

    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        let result = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: <)
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var map = Array(repeating: [(node: Int, type: Int)](), count: N)
for _ in 0..<M {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let U = info[0] - 1
    let V = info[1] - 1
    let C = info[2]
    map[U].append((node: V, type: C))
    map[V].append((node: U, type: C))
}

let info = readLine()!.split(separator: " ").map { Int($0)! }
let DEP = info[0] - 1
let DES = info[1] - 1

var minCost = Array(repeating: [Int.max, Int.max], count: N)
minCost[DEP][0] = 0
minCost[DEP][1] = 0

var q = Heap<(node: Int, cost: Int, type: Int)>(comparer: { $0.cost > $1.cost })

for next in map[DEP] {
    minCost[next.node][next.type] = 0
    q.insert((next.node, 0, next.type))
}

while !q.isEmpty {
    let curr = q.delete()!

    if curr.cost > minCost[curr.node][curr.type] { continue }

    for next in map[curr.node] {
        let nextCost = curr.cost + (curr.type != next.type ? 1 : 0)
        if nextCost < minCost[next.node][next.type] {
            minCost[next.node][next.type] = nextCost
            q.insert((next.node, nextCost, next.type))
        }
    }
}

print(min(minCost[DES][0], minCost[DES][1]))