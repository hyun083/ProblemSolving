import Foundation

let N = Int(readLine()!)!
var arr = Dictionary<Int,Int>()

for _ in 0..<N{
    let num = Int(readLine()!)!
    if arr[num] == nil {
        arr[num] = 1
    }else{
        arr[num]! += 1
    }
}

var res = arr.sorted(by: {
    return $0.value == $1.value ? $0.key < $1.key:$0.value > $1.value
})

print(res[0].key)