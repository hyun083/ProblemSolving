import Foundation

let n = Int(readLine()!)!
var candidate = Dictionary<Int,[Int]>()
candidate[1] = Array(repeating: 0, count: 4)
candidate[2] = Array(repeating: 0, count: 4)
candidate[3] = Array(repeating: 0, count: 4)

for _ in 0..<n{
    let scores = readLine()!.split(separator: " ").map{Int($0)!}
    for idx in 0..<3{
        let score = scores[idx]
        candidate[idx+1]![score] += 1
        candidate[idx+1]![0] += score
    }
}

let ans = candidate.sorted {
    ($0.value[0], $0.value[3], $0.value[2], $0.value[1])
    >
    ($1.value[0], $1.value[3], $1.value[2], $1.value[1])
}

let equal = (ans[0].value==ans[1].value || ans[0].value==ans[2].value)
print(equal ? 0:ans[0].key, ans[0].value[0])