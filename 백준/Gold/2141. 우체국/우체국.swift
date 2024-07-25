import Foundation

let N = Int(readLine()!)!
var arr = [(pos:Int, cnt:Int)]()
var sum = 0
var curr = 0
var ans = 0
for _ in 0..<N{
    let (X,A) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((X,A))
    sum += A
}
arr.sort(by: {$0.pos<$1.pos})

func result() -> Int{
    for i in 0..<N{
        curr += arr[i].cnt
        if curr >= (sum+1)/2{
            return i
        }
    }
    return -1
}

print(arr[result()].pos)