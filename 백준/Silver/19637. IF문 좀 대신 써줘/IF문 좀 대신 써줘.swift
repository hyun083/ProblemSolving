import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [(t:String, l:Int)]()

for _ in 0..<N{
    let (target, level) = [readLine()!.split(separator: " ")].map{(String($0[0]), Int($0[1])!)}[0]
    arr.append((target,level))
}

for _ in 0..<M{
    let num = Int(readLine()!)!
    
    var lo = 0
    var hi = N-1
    
    while lo<hi{
        let mid = (lo+hi)/2
        
        if num <= arr[mid].l{
            hi = mid
        }else{
            lo = mid+1
        }
    }
    print(arr[lo].t)
}