import Foundation

let input = readLine()!.map{String($0)}
var arr = ["S","X","X","L"]

for cmd in input{
    switch cmd{
    case "A":
        arr.swapAt(0, 1)
        break
    case "B":
        arr.swapAt(0, 2)
        break
    case "C":
        arr.swapAt(0, 3)
        break
    case "D":
        arr.swapAt(1, 2)
        break
    case "E":
        arr.swapAt(1, 3)
        break
    case "F":
        arr.swapAt(2, 3)
        break
    default:
        break
    }
}
for i in 0..<4{
    if arr[i]=="S"{
        print(i+1)
    }
}
for i in 0..<4{
    if arr[i]=="L"{
        print(i+1)
    }
}