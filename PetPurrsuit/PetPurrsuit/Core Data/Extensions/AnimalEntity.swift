//
//  AnimalEntity.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/22/24.
//

import CoreData

extension AnimalEntity {

    var age: AnimalAge {
        get {
            guard let ageValue = ageValue, let age = AnimalAge(rawValue: ageValue) else { return AnimalAge.unknown }
            return age
        }
        set {
            self.ageValue = newValue.rawValue
        }
    }

    var coat: AnimalCoat {
        get {
            guard let coatValue = coatValue, let coat = AnimalCoat(rawValue: coatValue) else { return AnimalCoat.unknown }
            return coat
        }
        set {
            self.coatValue = newValue.rawValue
        }
    }

    var gender: AnimalGender {
        get {
            guard let genderValue = genderValue, let gender = AnimalGender(rawValue: genderValue) else { return AnimalGender.unknown }
            return gender
        }
        set {
            self.genderValue = newValue.rawValue
        }
    }

    var size: AnimalSize {
        get {
            guard let sizeValue = sizeValue, let size = AnimalSize(rawValue: sizeValue) else { return AnimalSize.unknown }
            return size
        }
        set {
            self.sizeValue = newValue.rawValue
        }
    }

    var status: AnimalAdoptionStatus {
        get {
            guard let statusValue = statusValue, let status = AnimalAdoptionStatus(rawValue: statusValue) else { return AnimalAdoptionStatus.unknown }
            return status
        }
        set {
            self.statusValue = newValue.rawValue
        }
    }
}
