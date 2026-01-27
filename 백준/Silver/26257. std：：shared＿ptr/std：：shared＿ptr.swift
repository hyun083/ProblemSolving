import Foundation

let NMQ = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMQ[0]
let M = NMQ[1]
let Q = NMQ[2]
var ptr = Array(repeating: 0, count: M)

for idx in 0..<M{
    ptr[idx] = Int(readLine()!)!
}

for _ in 0..<Q{
    let line = readLine()!.split(separator: " ").map{String($0)}
    if line[0] == "assign"{
        let x = Int(line[1])!-1
        let y = Int(line[2])!-1
        ptr[x] = ptr[y]
    }else if line[0] == "swap"{
        let x = Int(line[1])!-1
        let y = Int(line[2])!-1
        ptr.swapAt(x, y)
    }else{
        let x = Int(line[1])!-1
        ptr[x] = 0
    }
}
var ans = Set<Int>()
for num in ptr{
    if num==0 { continue }
    ans.insert(num)
}
print(ans.count)
for num in ans.sorted(by: <){
    print(num)
}