import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [Int]()

for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)

func ans(target:Int) -> Int{
    var lo = 0
    var hi = N-1
    var ans = -1
    
    while lo <= hi{
        let mid = (lo+hi)/2
        if arr[mid]<target{
            lo = mid+1
        }else{
            ans = arr[mid]==target ? mid:ans
            hi = mid-1
        }
    }
    
    return ans
}

for _ in 0..<M{
    let t = Int(readLine()!)!
    print(ans(target: t))
}