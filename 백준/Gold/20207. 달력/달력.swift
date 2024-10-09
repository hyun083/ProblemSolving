import Foundation

let N = Int(readLine()!)!
var arr = [(start:Int, end:Int)]()
var ans = 0
var cald = Array(repeating: 0, count: 367)

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let s = input[0]
    let e = input[1]
    for i in s...e{
        cald[i] += 1
    }
}
var tmp = 0
var length = 0
for i in 1...366{
    if cald[i] > 0{
        length += 1
        tmp = max(tmp, cald[i])
    }else{
        ans += length * tmp
        length = 0
        tmp = 0
    }
}
print(ans)