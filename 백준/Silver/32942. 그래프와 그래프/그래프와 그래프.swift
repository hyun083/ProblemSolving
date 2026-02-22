import Foundation

let ABC = readLine()!.split(separator: " ").map{Int($0)!}
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]
var map = Array(repeating: [Int](), count: 11)

for u in 1...10{
    for v in 1...10{
        if (u*A)+(v*B) == C{
            map[u].append(v)
        }
    }
}

for u in 1...10 {
    if map[u].isEmpty {
        print(0)
    } else {
        for v in map[u].sorted(by: <) {
            print(v, terminator: " ")
        }
        print()
    }
}