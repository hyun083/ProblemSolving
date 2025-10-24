import Foundation

while let line = readLine(){
    let coord = line.split(separator: " ").map{Double($0)!}
    let X = coord[0]
    let Y = coord[1]
    if X==0 || Y==0{
        print("AXIS")
    }else if X>0 && Y>0{
        print("Q1")
    }else if X<0 && Y>0{
        print("Q2")
    }else if X<0 && Y<0{
        print("Q3")
    }else if X>0 && Y<0{
        print("Q4")
    }
    
    if X==0 && Y==0{ break }
}