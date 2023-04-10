import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()

var blue = 0
var white = 0

for _ in 1...N{
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func dfs(x:Int, y:Int, size:Int){
    var zero = true
    var one = true
    
    for i in x..<x+size{
        for k in y..<y+size{
            if map[i][k] == 0{
                one = false
            }else{
                zero = false
            }
        }
    }
    
    if zero == true{white+=1; return}
    if one == true{blue+=1; return}
    
    dfs(x: x, y: y, size: size/2)
    dfs(x: x, y: y+size/2, size: size/2)
    dfs(x: x+size/2, y: y, size: size/2)
    dfs(x: x+size/2, y: y+size/2, size: size/2)
}
dfs(x: 0, y: 0, size: N)
print(white)
print(blue)