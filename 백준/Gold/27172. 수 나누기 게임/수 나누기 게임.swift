import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var able = Array(repeating: false, count: 1000001)
var ans = Array(repeating: 0, count: 1000001)

for card in arr{ able[card] = true }

for i in 0..<N{
    let num = arr[i]
    for k in stride(from: num*2, to: 1000001, by: +num){
        if able[k]{
            ans[k] -= 1
            ans[num] += 1
        }
    }
}

for card in arr{
    print(ans[card],terminator: " ")
}