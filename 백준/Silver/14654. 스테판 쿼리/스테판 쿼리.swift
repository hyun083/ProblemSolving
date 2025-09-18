import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int($0)!}
let B = readLine()!.split(separator: " ").map{Int($0)!}

var aWin = false
var bWin = false
var aPoint = 0
var bPoint = 0

var ans = 0

func winnerIsA(){
    aWin = true
    bWin = false
    
    aPoint += 1
    bPoint = 0
}

func winnerIsB(){
    aWin = false
    bWin = true
    
    aPoint = 0
    bPoint += 1
}

func draw(){
    if aWin{
        winnerIsB()
    }else{
        winnerIsA()
    }
}

for i in 0..<N{
    let a = A[i]
    let b = B[i]
    
    if a==1{
        if b==1{
            draw()
        }else if b==2{
            winnerIsB()
        }else{
            winnerIsA()
        }
    }else if a==2{
        if b==1{
            winnerIsA()
        }else if b==2{
            draw()
        }else{
            winnerIsB()
        }
    }else{
        if b==1{
            winnerIsB()
        }else if b==2{
            winnerIsA()
        }else{
            draw()
        }
    }
    
    ans = max(ans,max(aPoint,bPoint))
}
print(ans)