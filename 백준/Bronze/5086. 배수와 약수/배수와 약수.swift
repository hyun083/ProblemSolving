import Foundation

while let input = readLine(){
    if input == "0 0"{ break }
    let AB = input.split(separator: " ").map{Int($0)!}
    let A = AB[0]
    let B = AB[1]

    if B%A == 0{
        print("factor")
    }else if A%B == 0{
        print("multiple")
    }else{
        print("neither")
    }
}