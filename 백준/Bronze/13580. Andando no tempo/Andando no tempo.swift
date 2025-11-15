import Foundation

let num = readLine()!.split(separator: " ").map{Int($0)!}
let A = num[0]
let B = num[1]
let C = num[2]

if A==B || B==C || A==C{
    print("S")
}else if A==B+C || B==A+C || C==A+B{
    print("S")
}else{
    print("N")
}