import Foundation

func readInt() -> Int{ return Int(readLine()!)! }
let N = readInt()
var arr = Array(repeating: false, count: 2000001)

for _ in 0..<N{
    let num = readInt() + 1000000
    arr[num] = true
}

for num in (0..<2000001).reversed(){
    if arr[num]{
        print(num-1000000)
    }
}