import Foundation

let N = Int(readLine()!)!
var num = 1
while num <= N{
    print(num, terminator: num%6==0 || num==N ? " Go! ":" ")
    num += 1
}