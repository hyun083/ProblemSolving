import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let cmd = readLine()!.map{String($0)}
    var x = 0
    var y = 0
    var d = 0
    
    var minX = 0
    var maxX = 0
    var minY = 0
    var maxY = 0
    
    for cmd in cmd{
        if cmd == "F"{
            if d == 0{
                y += 1
            }else if d == 1{
                x -= 1
            }else if d == 2{
                y -= 1
            }else if d == 3{
                x += 1
            }
        }else if cmd == "B"{
            if d == 0{
                y -= 1
            }else if d == 1{
                x += 1
            }else if d == 2{
                y += 1
            }else if d == 3{
                x -= 1
            }
        }else if cmd == "L"{
            d += 1
            d %= 4
        }else if cmd == "R"{
            d -= 1
            d = d<0 ? 3:d
        }
        
        minX = min(x,minX)
        maxX = max(x,maxX)
        minY = min(y,minY)
        maxY = max(y,maxY)
    }
    let width = maxX-minX
    let height = maxY-minY
    print(width*height)
}