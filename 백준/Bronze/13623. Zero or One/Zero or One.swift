import Foundation

let ABC = readLine()!.split(separator: " ").map{Int($0)!}
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]

if A==B && B==C{
    print("*")
}else if A==B {
    print("C")
}else if B==C{
    print("A")
}else{
    print("B")
}