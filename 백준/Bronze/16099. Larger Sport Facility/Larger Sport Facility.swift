import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let lt = info[0]
    let wt = info[1]
    let le = info[2]
    let we = info[3]
    
    let squareOfTelecomParisTech = lt * wt
    let squareOfEurecom = le * we
    print(squareOfEurecom == squareOfTelecomParisTech ? "Tie" :
            squareOfEurecom > squareOfTelecomParisTech ? "Eurecom" : "TelecomParisTech")
}