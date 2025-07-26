//
//  peoplePage.swift
//  test
//
//  Created by Lydia Ostos on 7/23/25.
//

import SwiftUI
import PhotosUI // For PhotosPicker if you prefer gallery access, but UIImagePickerController for camera
struct PeopleHeaderView: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.0, green: 0.392, blue: 0.580).opacity(0.3),
                    Color(red: 0.0, green: 0.392, blue: 0.580)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .opacity(0.2)
            
            VStack {
                HStack {
                    Text("My People")
                        .font(.system(size: 35, weight: .bold))
                        .padding(.top, 43)
                        .padding(.leading, 20)
                        .padding(.top, 5)
                    Spacer()
                }
                Spacer()
                    .padding()
            }
        }
    }
}

// MARK: - Person Model
// Represents a person with an ID, name, and optional image data.--> controls the features of the pencil in the corner
struct Person: Identifiable {
    let id = UUID()
    var name: String
    var imageData: Data? // Stores image data for persistence
}

// MARK: - ImagePicker (UIImagePickerControllerRepresentable)
// This bridges UIKit's UIImagePickerController to SwiftUI to access the camera.
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

// MARK: - PersonCardView
// A reusable view to display an individual person's image and name.
struct PersonCardView: View {
    let person: Person
    var onEdit: () -> Void // Action for the edit button

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                // Person's Image
                if let imageData = person.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle()) // Make it circular
                        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                } else {
                    // Placeholder image if no image data
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(red: 0.0 , green: 0.392, blue: 0.580)).opacity(0.45)
                    
                }

                // Edit Button
                Button(action: onEdit) {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .foregroundColor(.black)
                        .background(Circle().fill(Color.white))
                        .offset(x: 15, y: -20) // Position outside the circle
                }
            }

            // Person's Name
            Text(person.name)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 5)
        }
        .padding()
        .frame(width: 175, height: 186) // Fixed size for the card
        .background(Color.white)
        .cornerRadius(26)
    }
}

// MARK: - PeopleView (Main Page)
// The main view for displaying and managing people.
struct PeopleView: View {
//    typealias Body = <#type#>
            @State private var people: [Person] = [
                Person(name: "Alice", imageData: UIImage(named: "placeholder_alice")?.pngData()),
                Person(name: "Bob", imageData: UIImage(named: "placeholder_bob")?.pngData()),
                Person(name: "Carol", imageData: UIImage(named: "placeholder_carol")?.pngData()),
                Person(name: "David", imageData: UIImage(named: "placeholder_david")?.pngData()),
                Person(name: "Sally", imageData: UIImage(named: "placeholder_sally")?.pngData()),
                Person(name: "Johnny", imageData: UIImage(named: "placeholder_johnny")?.pngData())
            ] // Example data
            
            @State private var showingImagePicker = false
            @State private var inputImage: UIImage?
            @State private var newPersonName: String = ""
            @State private var showingAddPersonAlert = false
            @State private var personToEdit: Person? = nil
            @State private var showingEditPersonAlert = false

            var body: some View {
                ZStack{
                    PeopleHeaderView()
                    VStack{
                VStack(alignment: .leading) { // Align content to leading
                    // Top Navigation Bar
                    HStack(alignment: .center) { // Explicitly set
                        Spacer() //SUPER NECESSARY
                        
                        Button(action: {
                            showingAddPersonAlert = true // Show alert to get name before camera
                        }) {
                            Label("Add Person", systemImage: "person.badge.plus")
                                .font(.headline)
                                .padding(.vertical, 12.0) // Adjusted padding to align better
                                .padding(.horizontal, 12)
                        .padding(.top, 5)
                                .background(Capsule().fill(Color(red: 0.0, green: 0.39215686274509803, blue: 0.5803921568627451, opacity: 0.5)))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal) // Apply horizontal padding to the HStack
                    .padding(.top, 40.0) // Apply top padding to the entire HStack
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(people) { person in
                                PersonCardView(person: person) {
                                    personToEdit = person
                                    newPersonName = person.name // Pre-fill with current name
                                    showingEditPersonAlert = true
                                }
                            }
                        }
                        .padding(.horizontal) // Apply horizontal padding to the grid
                        .padding(.top, 30)
                    }
                    
                    Spacer() // Pushes content to the top
                }
                        
                .navigationBarHidden(true) // Hide default navigation bar if this view is presented in a NavigationView
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(sourceType: .camera, selectedImage: $inputImage)
                }
                        
                .alert("Add New Person", isPresented: $showingAddPersonAlert) {
                    TextField("Enter name", text: $newPersonName)
                    Button("Add") {
                        if !newPersonName.isEmpty {
                            // Proceed to camera only if name is provided
                            showingImagePicker = true
                        }
                    }
                    Button("Cancel", role: .cancel) {
                        newPersonName = "" // Clear name on cancel
                    }
                } message: {
                    Text("Please enter the name of the new person.")
                }
                .alert("Edit Person", isPresented: $showingEditPersonAlert) {
                    TextField("Edit name", text: $newPersonName)
                    Button("Update Name") {
                        if let index = people.firstIndex(where: { $0.id == personToEdit?.id }) {
                            people[index].name = newPersonName
                        }
                        newPersonName = ""
                        personToEdit = nil
                    }
                    Button("Change Photo") {
                        showingImagePicker = true // Open camera to change photo
                    }
                    Button("Delete Person", role: .destructive) {
                        if let index = people.firstIndex(where: { $0.id == personToEdit?.id }) {
                            people.remove(at: index)
                        }
                        newPersonName = ""
                        personToEdit = nil
                    }
                    Button("Cancel", role: .cancel) {
                        newPersonName = ""
                        personToEdit = nil
                    }
                } message: {
                    Text("Edit the person's details.")
                }
            }
        }
    }
}

// MARK: - Preview Provider
struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}




 









 


