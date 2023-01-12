//
//  CipherBuilder.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import SwiftUI

struct CipherBuilder: View {
    
    @Environment(\.displayScale) var displayScale
    
    @State var number = 0
    @State var requestText: String = ""
    @State var trimAmount: CGFloat = 1.0
    @State var redrawing: Bool = false
    @State var rendered: Bool = false
    @State var renderedImage: Image = Image(systemName: "photo")
    @FocusState var numberIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                VStack {
                    CipherShape(numbers: number.digits())
                        .trim(from: .zero, to: trimAmount)
                        .stroke(redrawing ? .clear : .black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .frame(width: 200, height: 225, alignment: .center)
                        .padding(20)
                    
                    Text("\(number)")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                }
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 4)

                }

                
                
                
                TextField("Number", text: $requestText)
                    .keyboardType(.numberPad)
                    .focused($numberIsFocused)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(uiColor: .secondarySystemFill), lineWidth: 3)
                        
                    }
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                        if let textField = obj.object as? UITextField {
                            textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                        }
                    }
                
                Spacer()
                
            }
            .navigationTitle("Cipher Builder")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button {
                        guard requestText.isNumber else { return }
                        
                        redrawing = true
                        rendered = false
                        trimAmount = .zero
                        
                        number = Int(requestText) ?? 0
                        
                        render()
                        
                        redrawing = false
                        rendered = true
                        
                        numberIsFocused = false
                        
                        withAnimation(.linear(duration: 1.50)) {
                            trimAmount = 1.0
                        }
                        
                        
                        
                    } label: {
                        Text("Draw Cipher")
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    ShareLink(item: renderedImage, message: Text("Check out the chipher for \(number)"), preview: SharePreview(Text("Shared Cipher"), image: renderedImage))
                        .disabled(!rendered)
                    
                    
                }
            }
        }
    }
    
    @MainActor func render() {
        let renderer = ImageRenderer(content: CipherStack(number: number))
        
        
        // make sure and use the correct display scale for this device
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }

}

struct CipherBuilder_Previews: PreviewProvider {
    static var previews: some View {
        CipherBuilder()
    }
}
