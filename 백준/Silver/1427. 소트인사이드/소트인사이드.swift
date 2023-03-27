import Foundation

let input = readLine()!
var arr = [Int]()

for i in input{
    arr.append(Int(String(i))!)
}

for a in arr.sorted(by: >){
    print(a,terminator: "")
}