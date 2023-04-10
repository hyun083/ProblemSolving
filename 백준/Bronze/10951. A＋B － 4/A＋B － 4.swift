import Foundation

while let line = readLine(){
    if line == ""{ break }
    let sum = line.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(sum)
}