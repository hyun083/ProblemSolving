import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    var point = [(x:Int, y:Int)]()
    for _ in 0..<4{
        let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
        point.append((x,y))
    }

    func line(from a:(x:Int,y:Int), to b:(x:Int,y:Int)) -> Int{
        return (abs(a.x-b.x)*abs(a.x-b.x)) + (abs(a.y-b.y)*abs(a.y-b.y))
    }
    
    var tmp = [Int]()
    var ans = 0
    for i in 0..<3{
        for k in i+1..<4{
            tmp.append(line(from: point[i], to: point[k]))
        }
    }
    tmp.sort()
    
    if tmp[0]==tmp[1] && tmp[1]==tmp[2] && tmp[2]==tmp[3] && tmp[4]==tmp[5]{
        ans = 1
    }
    
    print(ans)
}