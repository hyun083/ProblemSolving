import Foundation
while let input = readLine(){
    let numbers = input.split(separator: " ").map{Int(String($0))!}
    print(max(numbers[1]-numbers[0]-1, numbers[2]-numbers[1]-1))
}