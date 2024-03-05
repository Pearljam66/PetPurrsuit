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
            guard let coatValue = coatValue,
                  let coat = AnimalCoat(rawValue: coatValue) else { return AnimalCoat.unknown }
            return coat
        }
        set {
            self.coatValue = newValue.rawValue
        }
    }

    var gender: AnimalGender {
        get {
            guard let genderValue = genderValue,
                  let gender = AnimalGender(rawValue: genderValue) else { return AnimalGender.unknown }
            return gender
        }
        set {
            self.genderValue = newValue.rawValue
        }
    }

    var size: AnimalSize {
        get {
            guard let sizeValue = sizeValue,
                  let size = AnimalSize(rawValue: sizeValue) else { return AnimalSize.unknown }
            return size
        }
        set {
            self.sizeValue = newValue.rawValue
        }
    }

    var status: AnimalAdoptionStatus {
        get {
            guard let statusValue = statusValue,
                  let status = AnimalAdoptionStatus(rawValue: statusValue) else { return AnimalAdoptionStatus.unknown }
            return status
        }
        set {
            self.statusValue = newValue.rawValue
        }
    }

    @objc var breed: String {
        return breeds?.primary ?? breeds?.secondary ?? ""
    }

    var picture: URL? {
        guard let photos = photos, !photos.allObjects.isEmpty else { return nil }
        let photosArray = photos.allObjects as? [PhotoSizesEntity]
        guard let pArray = photosArray, let firstPhoto = pArray.first else { return nil }
        let pic = firstPhoto.medium ?? firstPhoto.full
        return pic
    }

    var phoneLink: URL? {
        guard let phoneNumber = contactInfo?.phone else { return nil }
        let formattedPhoneNumber = phoneNumber.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
        return URL(string: "tel:\(formattedPhoneNumber)")
    }

    var emailLink: URL? {
        guard let emailAddress = contactInfo?.email else { return nil }
        return URL(string: "mailto:\(emailAddress)")
    }

    var address: String {
        guard let address = contactInfo?.address else { return "No address" }
        return [
            address.address1,
            address.address2,
            address.city,
            address.state,
            address.postcode,
            address.country
        ]
            .compactMap { $0 }
            .joined(separator: ", ")
    }

    @objc var animalSpecies: String {
        return species ?? "None"
    }
}

extension Animal: UUIDIdentifiable {

    init(managedObject: AnimalEntity) {
        self.age = managedObject.age
        self.coat = managedObject.coat
        self.description = managedObject.animalDescription
        self.distance = managedObject.distance
        self.gender = managedObject.gender
        self.id = Int(managedObject.id)
        self.name = managedObject.name ?? "No name"
        self.organizationId = managedObject.organizationId
        self.publishedAt = managedObject.publishedAt?.description
        self.size = managedObject.size
        self.species = managedObject.species
        self.status = managedObject.status
        self.tags = []
        self.type = managedObject.type ?? "No type"
        self.url = managedObject.url
        self.attributes = AnimalBehaviorAttributes(managedObject: managedObject.behaviorAttributes)
        self.colors = AnimalColor(managedObject: managedObject.animalColors)
        self.contact = ContactInfo(managedObject: managedObject.contactInfo)
        self.environment = AnimalEnvironment(managedObject: managedObject.environment)
        let pics = managedObject.photos?.allObjects as? [PhotoSizesEntity]
        self.photos = pics?.map { AnimalPhotoSizes(managedObject: $0) } ?? []
        let videos = managedObject.videos?.allObjects as? [VideoEntity]
        self.videos = videos?.map { AnimalVideo(managedObject: $0) } ?? []
        self.breeds = AnimalBreed(managedObject: managedObject.breeds)
    }

    private func checkForExistingAnimal(id: Int,
                                        context: 
                                        NSManagedObjectContext = PersistenceController.shared.container.viewContext) -> Bool {
        let fetchRequest = AnimalEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)

        if let results = try? context.fetch(fetchRequest), results.first != nil {
            return true
        }
        return false
    }

    mutating func convertToManagedCoreObject(context:
                                             NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        guard let id = self.id else { return }
        guard checkForExistingAnimal(id: id, context: context) == false else { return }
        let persistedValue = AnimalEntity.init(context: context)
        persistedValue.timestamp = Date()
        persistedValue.age = self.age
        persistedValue.coat = self.coat ?? .short
        persistedValue.animalDescription = self.description
        persistedValue.distance = self.distance ?? 0
        persistedValue.gender = self.gender
        persistedValue.id = Int64(id)
        persistedValue.name = self.name
        persistedValue.organizationId = self.organizationId
        persistedValue.publishedAt = self.publishedAt
        persistedValue.size = self.size
        persistedValue.species = self.species
        persistedValue.status = self.status
        persistedValue.type = self.type
        persistedValue.url = self.url
        persistedValue.behaviorAttributes = self.attributes.convertToManagedCoreObject(context: context)
        persistedValue.animalColors = self.colors.convertToManagedCoreObject(context: context)
        persistedValue.contactInfo = self.contact.convertToManagedCoreObject(context: context)
        persistedValue.environment = self.environment?.convertToManagedCoreObject(context: context)
        persistedValue.addToPhotos(NSSet(array: self.photos.map { (photo: AnimalPhotoSizes) -> PhotoSizesEntity in
            var mutablePhoto = photo
            return mutablePhoto.convertToManagedCoreObject(context: context)
        }))
        persistedValue.addToVideos(NSSet(array: self.videos.map { (video: AnimalVideo) -> VideoEntity in
            var mutableVideo = video
            return mutableVideo.convertToManagedCoreObject(context: context)
        }))
        persistedValue.breeds = self.breeds.convertToManagedCoreObject(context: context)
    }
}
