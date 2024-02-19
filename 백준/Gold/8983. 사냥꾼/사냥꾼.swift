import Foundation

let (M,N,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var animal = [(a:Int, b:Int)]()
var position = readLine()!.split(separator: " ").map({Int($0)!}).sorted(by: <)
var ans = 0

for _ in 0..<N{
    let (a,b) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    if b<=L { animal.append((a,b)) }
}

for target in animal.sorted(by: {$0.a<$1.a}){
    var lo = 0
    var hi = M-1
    
    while lo <= hi{
        let mid = (lo+hi)/2
        
        if abs(target.a-position[mid])+target.b <= L{
            ans += 1
            break
        }else if target.a < position[mid]{
            hi = mid-1
        }else{
            lo = mid+1
        }
    }
}
print(ans)