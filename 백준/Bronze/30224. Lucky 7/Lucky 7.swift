import Foundation

let N = readLine()!
let I = Int(N)!
let arr = N.map{String($0)}
if arr.contains("7") && I%7 == 0{
    print(3)
}else if arr.contains("7") && I%7 != 0{
    print(2)
}else if !arr.contains("7") && I%7 == 0{
    print(1)
}else{
    print(0)
}