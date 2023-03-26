import Foundation

var location = ""
let x = ["1","2","3","4","5","6"]
let y = ["A","B","C","D","E","F"]
var ans = "Valid"
var temp = [String]()
var visited = Set<String>()
var target = ""

for i in 0..<36{
    let line = readLine()!.map{String($0)}
    temp = [String]()
    if location == ""{
        location = line.joined()
        target = line.joined()
        continue
    }
    let idx_y = y.firstIndex(of: String(location.first!))!
    let idx_x = x.firstIndex(of: String(location.last!))!
    let next = [[1,-2],[1,2],[2,1],[2,-1],[-1,-2],[-1,2],[-2,1],[-2,-1]]
    for next in next {
        let next_y = next[0] + idx_y
        let next_x = next[1] + idx_x
        if next_y >= 0 && next_y < 6 && next_x >= 0 && next_x < 6{
            temp.append(y[next_y]+x[next_x])
        }
    }
    if !temp.contains(line.joined()) || visited.contains(line.joined()){
        ans = "Invalid"
        break
    }
    location = line.joined()
    visited.insert(line.joined())
    if i==35{
        temp = [String]()
        let idx_y = y.firstIndex(of: line[0])!
        let idx_x = x.firstIndex(of: line[1])!
        let next = [[1,-2],[1,2],[2,1],[2,-1],[-1,-2],[-1,2],[-2,1],[-2,-1]]
        for next in next {
            let next_y = next[0] + idx_y
            let next_x = next[1] + idx_x
            if next_y >= 0 && next_y < 6 && next_x >= 0 && next_x < 6{
                temp.append(y[next_y]+x[next_x])
            }
        }
        if !temp.contains(target){
            ans = "Invalid"
        }
    }
}
print(ans)