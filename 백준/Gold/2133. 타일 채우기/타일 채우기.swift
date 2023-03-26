import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: 0, count: 31)
map[0] = 1
map[2] = 3

for n in stride(from: 4, through: 30, by: +2){
    map[n] = map[n-2] * map[2]
    for k in stride(from: n-4, through: 0, by: -2){
        map[n] += map[k]*2
    }
}

print(map[N])