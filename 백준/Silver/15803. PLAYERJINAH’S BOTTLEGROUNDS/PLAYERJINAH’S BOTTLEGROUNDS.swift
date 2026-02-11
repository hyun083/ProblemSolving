import Foundation

let WIN = "WINNER WINNER CHICKEN DINNER!"
let LOSE = "WHERE IS MY CHICKEN?"
let A = readLine()!.split(separator: " ").map{Int($0)!}
let B = readLine()!.split(separator: " ").map{Int($0)!}
let C = readLine()!.split(separator: " ").map{Int($0)!}

func inclination(x1:Int, y1:Int, x2:Int, y2:Int) -> Int{
    if y2-y1==0 || x2-x1 == 0 { return 0 }
    
    let res = (y2-y1)/(x2-x1)
    return res
}

if (A[0]==B[0] && B[0]==C[0]) || (A[1]==B[1] && B[1]==C[1]) {
    print(LOSE)
}else{
    print((A[0]-B[0])*(B[1]-C[1]) == (A[1]-B[1])*(B[0]-C[0]) ? LOSE : WIN)
}