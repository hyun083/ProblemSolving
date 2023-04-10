import Foundation

while let line = readLine(){
    if line == "0 0"{
        break
    }
    let ab = line.split(separator: " ").map{Int(String($0))!}
    print(ab[0] > ab[1] ? "Yes":"No")
}