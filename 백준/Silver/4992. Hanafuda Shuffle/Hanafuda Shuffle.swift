import Foundation

while let line = readLine() {
    if line == "0 0" { break }
    
    let NR = line.split(separator: " ").map{Int($0)!}
    let N = NR[0]
    let R = NR[1]
    var arr = [Int](1...N)
    
    for _ in 0..<R {
        let PR = readLine()!.split(separator: " ").map{Int($0)!}
        let P = PR[0]
        let R = PR[1]
        var stk0 = [Int]()
        var stk1 = [Int]()
        
        for _ in 1..<P {
            let last = arr.removeLast()
            stk0.append(last)
        }
        for _ in 0..<R{
            let last = arr.removeLast()
            stk1.append(last)
        }
        arr += stk0.reversed()
        arr += stk1.reversed()
    }
    print(arr.last!)
}