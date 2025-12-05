import Foundation

struct Point: Hashable {
    var x: Int
    var y: Int
}

let L = Int(readLine()!)!
let line = readLine()!.map{String($0)}
var curr = Point(x: 0, y: 0)
var ans = Set<Point>()
ans.insert(curr)

for cmd in line{
    if cmd == "E"{
        curr.x += 1
    }else if cmd == "W"{
        curr.x -= 1
    }else if cmd == "N"{
        curr.y += 1
    }else if cmd == "S"{
        curr.y -= 1
    }else{
        continue
    }
    ans.insert(curr)
}
print(ans.count)