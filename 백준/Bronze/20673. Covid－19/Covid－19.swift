import Foundation

let P = Int(readLine()!)!
let Q = Int(readLine()!)!

if Q > 30{
    print("Red")
}else if P<=50 && Q <= 10{
    print("White")
}else{
    print("Yellow")
}