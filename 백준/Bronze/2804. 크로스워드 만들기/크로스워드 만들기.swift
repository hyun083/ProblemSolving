import Foundation

let AB = readLine()!.split(separator: " ").map{String($0)}
let A = AB[0].map{String($0)}
let B = AB[1].map{String($0)}

var target = ""
var flag = false
var I = 0
var K = 0

var map = Array(repeating: Array(repeating: ".", count: A.count), count: B.count)
for k in 0..<A.count {
    for i in 0..<B.count {
        if B[i] == A[k] {
            target.append(B[i])
            I = i
            K = k
            flag = true
            break
        }
    }
    if flag { break }
}

map[I] = A
for i in 0..<B.count {
    map[i][K] = B[i]
}

for ans in map{
    print(ans.joined())
}