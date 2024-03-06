import Foundation

let (N,G,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = [(S:Int, L:Int, O:Int)]()

for _ in 0..<N{
    let (S,L,O) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    arr.append((S,L,O))
}

var lo = 0
var hi = 10000000000
var ans = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    var germ = 0
    arr.sort(by: { $0.S*max(1,mid-$0.L) > $1.S*max(1,mid-$1.L)})
    
    for food in arr{
        if food.O == 0{
            germ += food.S * max(1,mid-food.L)
        }else{
            if cnt<K{
                cnt += 1
                continue
            }else{
                germ += food.S * max(1,mid-food.L)
            }
        }
    }
    
    if germ<=G{
        ans = mid
        lo = mid+1
    }else{
        hi = mid-1
    }
}
print(ans)