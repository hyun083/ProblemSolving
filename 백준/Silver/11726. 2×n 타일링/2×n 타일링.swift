import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: 1001)

func fibonacci(n:Int) -> Int{
    if n == 1{
        return 1
    }
    if n == 2{
        return 2
    }
    if arr[n] != 0{
        return arr[n]
    }else{
        arr[n] = (fibonacci(n: n-1) + fibonacci(n: n-2))%10007
        return arr[n]
    }
}
print(fibonacci(n: N))