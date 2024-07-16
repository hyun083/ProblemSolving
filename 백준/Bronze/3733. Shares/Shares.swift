import Foundation

while let line = readLine(){
    let (N,S) = [line.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1])}[0]
    print(S/(N+1))
}