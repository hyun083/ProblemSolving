import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N+1)

func fibonacci(num:Int) -> Int{
    if num == 0{
        return 0
    }
    if num == 1{
        return 1
    }
    if arr[num] != -1{
        return arr[num]
    }
    arr[num] = fibonacci(num: num-1) + fibonacci(num: num-2)
    return arr[num]
}
print(fibonacci(num: N))