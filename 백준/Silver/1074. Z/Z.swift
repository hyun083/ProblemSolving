import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let r = inputs[1]
let c = inputs[2]

var map = Array(repeating: Array(repeating: -1, count: 1<<N), count: 1<<N)
var cnt = 0

func z(x:Int, y:Int, size:Int){
    if x==r && c==y{
        print(cnt)
        return
    }
    
    if x<=r && r<x+size && y<=c && c<y+size{
        z(x: x, y: y, size: size/2)
        z(x: x, y: y+size/2, size: size/2)
        z(x: x+size/2, y: y, size: size/2)
        z(x: x+size/2, y: y+size/2, size: size/2)
    }else{
        cnt += size*size
    }
}
z(x: 0, y: 0, size: 1<<N)