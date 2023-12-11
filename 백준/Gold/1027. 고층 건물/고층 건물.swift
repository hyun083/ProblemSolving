import Foundation

let N = Int(readLine()!)!
var height = readLine()!.split(separator: " ").map{Int($0)!}
var lines = [[(x:Int,y:Int)]]()
var cnt = Array(repeating: 0, count: N)

func ccw(p1:(x:Int, y:Int), p2:(x:Int, y:Int), p3:(x:Int, y:Int)) -> Int{
    var s = (p1.x*p2.y) + (p2.x*p3.y) + (p3.x*p1.y)
    s -= ((p1.y*p2.x) + (p2.y*p3.x) + (p3.y*p1.x))
    
    if s>0 { return 1}  //anticlockwise
    else if s==0 { return 0} // horizon
    else { return -1 } //clockwise
}

for i in 0..<N{
    let p1 = (i,0)
    let p2 = (i,height[i])
    
    lines.append([p1,p2])
}

for i in 0..<N-1{
    let base = lines[i]
    for k in i+1..<N{
        let target = lines[k]
        let p1 = base[1]
        let p2 = target[1]
        var flag = true
        
        for p in 0..<N{
            if i==p || k==p { continue }
            let p3 = lines[p][0]
            let p4 = lines[p][1]
            
            let ccw1 = ccw(p1: p1, p2: p2, p3: p3) * ccw(p1: p1, p2: p2, p3: p4)
            let ccw2 = ccw(p1: p3, p2: p4, p3: p1) * ccw(p1: p3, p2: p4, p3: p2)
            
            if ccw1<=0 && ccw2<=0 {
                flag = false
            }
        }
        if flag{
            cnt[i]+=1
            cnt[k] += 1
        }
    }
}
print(cnt.max()!)