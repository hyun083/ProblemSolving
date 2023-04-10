import Foundation

var gears = [[Int]]()
for _  in 0..<4{
    gears.append(readLine()!.map{Int(String($0))!})
}

func rotate(dir:Int, idx:Int){
    if dir<0{
        let temp = gears[idx].first!
        for i in stride(from: 0, through: 6, by: +1){
            gears[idx][i] = gears[idx][i+1]
        }
        gears[idx][7] = temp
    }else if dir > 0{
        let temp = gears[idx].last!
        for i in stride(from: 7, through: 1, by: -1){
            gears[idx][i] = gears[idx][i-1]
        }
        gears[idx][0] = temp
    }
}

let k = Int(readLine()!)!
for _ in 0..<k{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let idx = line[0]-1
    var dir = line[1]
    var progress = Array(repeating: 0, count: 4)
    progress[idx] = dir
    
    for idx in stride(from: idx-1, through: 0, by: -1){
        if gears[idx][2] != gears[idx+1][6]{
            dir *= -1
        }else{
            break
        }
        progress[idx] = dir
    }
    
    dir = line[1]
    for idx in idx+1..<4{
        if gears[idx][6] != gears[idx-1][2]{
            dir *= -1
        }else{
            break
        }
        progress[idx] = dir
    }
    
    for i in 0..<4{
        rotate(dir: progress[i], idx: i)
    }
}
let ans = gears[0][0] + (gears[1][0]*2) + (gears[2][0]*4) + (gears[3][0]*8)
print(ans)