//
//  main.swift
//  Lesson1
//
//  Created by  max on 09.03.2021.
//

import Foundation

// Задание 1
func checkEvenNumber(num: Int) -> Bool {
    num % 2 == 0
}

// Задание 2
func isMultipleOfThree(num: Int) -> Bool {
    num % 3 == 0
}

// Задание 3
var newArr: [Int] = []

for i in 1...100 {
    newArr.append(i)
}

// Задание 4
for value in newArr {
    if checkEvenNumber(num: value) || isMultipleOfThree(num: value) {
        if let key = newArr.lastIndex(of: value) {
            newArr.remove(at: key)
        }
    }
}
print("Массив после удаления чисел, делящихся на 2 и на 3 без остатка:")
print(newArr)

// Задание 5
var fibonachiArr: [Int] = [0]

func addItem(_ localArr: inout [Int]) {
    if localArr.count == 0 {
        localArr.append(0)
    } else if localArr.count == 1 {
        localArr.append(1)
    } else {
        let newValue = localArr[localArr.count - 1] + localArr[localArr.count - 2]
        localArr.append(newValue)
    }
    
}

for _ in 1...49 {
    addItem(&fibonachiArr)
}
print("\nМассив с числами Фибоначчи:")
print(fibonachiArr)


// Задание 6

