import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int($0)!}
let B = readLine()!.split(separator: " ").map{Int($0)!}

var aWin = false
var bWin = false
var aCount = 0
var bCount = 0

var ans = 0

func winnerIsA(){
    aWin = true
    bWin = false
    
    aCount += 1
    bCount = 0
}

func winnerIsB(){
    aWin = false
    bWin = true
    
    aCount = 0
    bCount += 1
}

for i in 0..<N{
    let a = A[i]
    let b = B[i]
    
    if a==1{
        if b==1{
            if aWin{
                winnerIsB()
            }else{
                winnerIsA()
            }
        }else if b==2{
            winnerIsB()
        }else{
            winnerIsA()
        }
    }else if a==2{
        if b==1{
            winnerIsA()
        }else if b==2{
            if aWin{
                winnerIsB()
            }else{
                winnerIsA()
            }
        }else{
            winnerIsB()
        }
    }else{
        if b==1{
            winnerIsB()
        }else if b==2{
            winnerIsA()
        }else{
            if aWin{
                winnerIsB()
            }else{
                winnerIsA()
            }
        }
    }
    
    ans = max(ans, max(aCount,bCount))
}
print(ans)