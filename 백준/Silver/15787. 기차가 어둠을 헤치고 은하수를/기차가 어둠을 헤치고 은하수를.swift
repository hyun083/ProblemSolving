import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr:[UInt] = Array(repeating: 0, count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let cmd = line[0]
    let i = line[1]-1
    let x = line.last!
    
    if cmd == 1{
        let seat:UInt = 1<<(x-1)
        arr[i] |= seat
    }else if cmd == 2{
        let seat:UInt = 1<<(x-1)
        arr[i] &= ~seat
    }else if cmd == 3{
        arr[i] = arr[i] << 1
        arr[i] &= (UInt.max >> 44)
    }else{
        arr[i] = arr[i] >> 1
    }
}
let ans = Set(arr)
print(ans.count)