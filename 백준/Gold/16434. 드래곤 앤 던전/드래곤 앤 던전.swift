import Foundation

let (N,H) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var room = [(t:Int, a:Int, h:Int)]()

for _ in 0..<N{
    let (t,a,h) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    room.append((t,a,h))
}

var lo = 1
var hi = Int.max/2
var res = 0

while lo <= hi{
    let mid = (lo+hi)/2
    var hp = mid
    var atk = H
    
    for info in room{
        if info.t == 1{
            let turn = info.h%atk==0 ? info.h/atk:(info.h/atk)+1
            hp -= (turn-1)*info.a
            if hp<=0{ break }
        }else{
            atk += info.a
            hp = hp+info.h >= mid ? mid:hp+info.h
        }
    }
    if hp<=0{
        lo = mid+1
    }else{
        res = mid
        hi = mid-1
    }
}
print(res)