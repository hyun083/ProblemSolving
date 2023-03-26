import Foundation

let NL = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NL[0]
let L = NL[1]
var pipe = Array(repeating: false, count: 1001)
var cnt = 0
let idx = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in idx{
    pipe[i] = true
}
for hole in 1...1000{
    if pipe[hole]{
        cnt += 1
        for tape in hole..<hole+L{
            if tape > 1000{
                break
            }
            pipe[tape] = false
        }
    }
}
print(cnt)