import Foundation

var arr = ["A","B","C","D","E"]
while let line = readLine() {
    let B = Int(line)!
    let N = Int(readLine()!)!
    if B==1 {
        let n = N%5
        for _ in 0..<n {
            arr.append(arr.removeFirst())
        }
    } else if B==2 {
        let n = N%5
        for _ in 0..<n {
            arr.insert(arr.removeLast(), at: 0)
        }
    } else if B==3 {
        let n = N%2
        for _ in 0..<n {
            arr.swapAt(0, 1)
        }
    } else if B==4 {
        print(arr.joined(separator: " "))
    }
}