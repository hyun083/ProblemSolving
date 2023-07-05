import Foundation

var arr = [Int]()
for _ in 0..<3{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)
print(arr[1])