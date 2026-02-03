import Foundation

while let line = readLine(){
    let num = Int(line)!
    if num < 0 { break }
    var arr = [Int]()
    
    for i in 1..<num{
        if num%i==0{
            arr.append(i)
        }else{
            continue
        }
    }
    
    if arr.reduce(0, +) == num{
        print("\(num) = ",terminator: "")
        print(arr.map{String($0)}.joined(separator: " + "))
    }else{
        print("\(num) is NOT perfect.")
    }
}