import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}

if numbers[0] < numbers[1]{
    print("<")
}else if numbers[0] > numbers[1]{
    print(">")
}else{
    print("==")
}
