import Foundation

let PS1 = readLine()!.split(separator: " ").map{Int($0)!}
let P1 = PS1[0]
let S1 = PS1[1]//

let SP2 = readLine()!.split(separator: " ").map{Int($0)!}
let S2 = SP2[0]
let P2 = SP2[1]//

if P1+P2 > S1+S2{
    print("Persepolis")
}else if P1+P2 < S1+S2{
    print("Esteghlal")
}else if P2 > S1{
    print("Persepolis")
}else if P2 < S1{
    print("Esteghlal")
}else{
    print("Penalty")
}