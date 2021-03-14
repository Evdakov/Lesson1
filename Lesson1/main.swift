//
//  main.swift
//  Lesson1
//
//  Created by  max on 09.03.2021.
//

import Foundation

// Задание - комплексные типы данных
enum EngineStatus {
    case started, stoped
}

enum WindowsStatus {
    case opened, closed
}

struct SportCar {
    let brandName: String
    let modelName: String
    let year: Int
    let baggageVolume: Double
    var engineStatus: EngineStatus
    var windowStatus: WindowsStatus
    var filledVolume: Double
    var trunkIsFull: Bool
    
    mutating func changeEngineStatus(to value: EngineStatus) {
        self.engineStatus = value
    }
    
    mutating func addBaggageToTrunk(adding value: Double) {
        let newValue = self.filledVolume + value
        
        if newValue <= self.baggageVolume {
            self.filledVolume = newValue
        } else {
            print("Такой объем не влезет в машину")
        }
        
        self.trunkIsFull = self.filledVolume == self.baggageVolume
    }
    
    func printInfo() {
        print("_____________")
        print("Автомобиль \(self.brandName) \(self.modelName)")
        print("Год выпуска \(self.year)")
        print("Двигатель \(self.engineStatus == .started ? "запущен" : "выключен")")
        print("Окна \(self.windowStatus == .opened ? "открыты" : "закрыты")")
        print("Объем багажника \(self.baggageVolume) литров")
        
        if (self.filledVolume > 0) {
            let filledPercents = Double(round(self.filledVolume * 100 / self.baggageVolume * 100) / 100)
            print("Багажник заполнен на \(filledPercents)%")
        } else {
            print("Багажник пуст")
        }
        
    }
}

struct TrunkCar {
    let brandName: String
    let modelName: String
    let year: Int
    let baggageVolume: Double
    var engineStatus: EngineStatus
    var windowStatus: WindowsStatus
    var filledVolume: Double
    var trunkIsFull: Bool
    
    mutating func changeEngineStatus(to value: EngineStatus) {
        self.engineStatus = value
    }
    
    mutating func addBaggageToTrunk(adding value: Double) {
        let newValue = self.filledVolume + value
        
        if newValue <= self.baggageVolume {
            self.filledVolume = newValue
        } else {
            print("Такой объем не влезет в кузов")
        }
        
        self.trunkIsFull = self.filledVolume == self.baggageVolume
    }
    
    func printInfo() {
        print("_____________")
        print("Грузовой автомобиль \(self.brandName) \(self.modelName)")
        print("Год выпуска \(self.year)")
        print("Двигатель \(self.engineStatus == .started ? "запущен" : "выключен")")
        print("Окна \(self.windowStatus == .opened ? "открыты" : "закрыты")")
        print("Объем кузова \(self.baggageVolume) литров")
        
        if (self.filledVolume > 0) {
            let filledPercents = Double(round(self.filledVolume * 100 / self.baggageVolume * 100) / 100)
            print("Кузов заполнен на \(filledPercents)%")
        } else {
            print("Кузов пуст")
        }
        
    }
}


var sportCar = SportCar(brandName: "Porsche", modelName: "Panamera", year: 2019, baggageVolume: 335, engineStatus: .stoped, windowStatus: .closed, filledVolume: 0, trunkIsFull: false)
var sportCarF = SportCar(brandName: "Ferrari", modelName: "488", year: 2020, baggageVolume: 230, engineStatus: .stoped, windowStatus: .opened, filledVolume: 0, trunkIsFull: false)

var trunkCar = TrunkCar(brandName: "Volvo", modelName: "FH16", year: 2020, baggageVolume: 60000, engineStatus: .stoped, windowStatus: .closed, filledVolume: 0, trunkIsFull: false)
var trunkCar2 = TrunkCar(brandName: "MAN", modelName: "TGX", year: 2018, baggageVolume: 58000, engineStatus: .stoped, windowStatus: .closed, filledVolume: 0, trunkIsFull: false)

sportCar.addBaggageToTrunk(adding: 100)
sportCarF.changeEngineStatus(to: .started)
sportCar.printInfo()
sportCarF.printInfo()

trunkCar2.windowStatus = .opened
trunkCar2.addBaggageToTrunk(adding: 8000)
trunkCar.printInfo()
trunkCar2.printInfo()
