import Foundation

var arr = [Int](1...20).map{String($0)}
for _ in 0..<10 {
    let AB = readLine()!.split(separator: " ").map{Int($0)!-1}
    let A = AB[0]
    let B = AB[1]
    var temp = arr[A...B]
    for i in  A...B {
        arr[i] = temp.removeLast()
    }
}

print(arr.joined(separator: " "))