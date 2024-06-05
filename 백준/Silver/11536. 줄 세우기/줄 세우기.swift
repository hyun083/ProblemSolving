import Foundation

let N = Int(readLine()!)!
var arr = [String]()
for _ in 0..<N{
    arr.append(readLine()!)
}

if arr == arr.sorted(by: <){
    print("INCREASING")
}else if arr==arr.sorted(by: >){
    print("DECREASING")
}else{
    print("NEITHER")
}