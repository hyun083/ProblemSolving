import Foundation

var arr = Array(repeating: false, count: 30)

for _ in 0..<28{
    arr[Int(readLine()!)!-1] = true
}

for i in 0..<30{
    if !arr[i]{
        print(i+1)
    }
}