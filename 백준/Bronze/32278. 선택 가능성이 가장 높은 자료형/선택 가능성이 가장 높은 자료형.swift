import Foundation

let N = Int(readLine()!)!

if -32769 < N && N < 32768 {
    print("short")
}else if -2147483649 < N && N < 2147483648 {
    print("int")
}else{
    print("long long")
}