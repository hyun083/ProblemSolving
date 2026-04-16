import Foundation

let N = Int(readLine()!)!
var dishes:Array = [Int](1...N).reversed()
var stk0 = [Int]()
var res = [Int]()

while let line = readLine(){
    let input = line.split(separator: " ").map{Int($0)!}
    let cmd = input[0]
    let num = input[1]
    
    if cmd == 1{
        for _ in 0..<num{
            stk0.append(dishes.removeLast())
        }
    } else {
        for _ in 0..<num{
            res.append(stk0.removeLast())
        }
    }
}

for num in res.reversed() {
    print(num)
}