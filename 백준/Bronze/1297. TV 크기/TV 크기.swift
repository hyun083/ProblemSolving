import Foundation

let DHW = readLine()!.split(separator: " ").map{Double(String($0))!}
let D = DHW[0]
let H = DHW[1]
let W = DHW[2]

let temp = sqrt(pow(D, 2) / (pow(H/(H+W), 2) + pow(W/(H+W), 2)))
print(Int(temp*(H/(H+W))), Int(temp*(W/(H+W))))