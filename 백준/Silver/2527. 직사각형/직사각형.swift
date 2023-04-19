import Foundation

for _ in 0..<4{
    let point = readLine()!.split(separator: " ").map{Int($0)!}
    
    let x1 = point[0]
    let y1 = point[1]
    let p1 = point[2]
    let q1 = point[3]
    
    let x2 = point[4]
    let y2 = point[5]
    let p2 = point[6]
    let q2 = point[7]
    
    if p1<x2 || q1<y2 || p2<x1 || q2<y1{
        print("d")
        continue
    }else if p1==x2 || x1==p2{
        if y1==q2 || q1==y2{
            print("c")
        }else{
            print("b")
        }
        continue
    }else if q1==y2 || y1==q2{
        print("b")
        continue
    }else{
        print("a")
        continue
    }
}