import Foundation

while let line = readLine(){
    if line == "0 0"{ break }
    let sum = line.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(sum)
}