import Foundation

let (W,S) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let (X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var workpieces = [[Int]]()
var steps = Array(repeating: Y, count: X)

for _ in 0..<W{
    let workpiece = readLine()!.split(separator: " ").map{Int($0)!}
    workpieces.append(workpiece)
}

for _ in 0..<S{
    let step = readLine()!.split(separator: " ").map{Int($0)!}
    for i in 0..<X{
        steps[i] = min(steps[i], Y-step[i])
    }
}

for i in 0..<W{
    var workpiece = workpieces[i]
    for k in 0..<X{
        workpiece[k] = min(workpiece[k], steps[k])
        print(workpiece[k], terminator: " ")
    }
    print()
}