import Foundation

while let input = readLine(){
    let N = Int(input)!
    var tmp = 0
    
    for i in 1...N{
        tmp = tmp*10+1
        tmp %= N
        if tmp == 0{
            print(i)
            break
        }
    }
}