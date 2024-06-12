import SwiftUI

struct ContentView: View {
    @State private var mouseLocation: CGPoint = .zero
    @State private var isListeningForClick: Bool = false
    @State private var inputData = ""
    @State private var isSecure: Bool = true
    //@State private var eyeButtonIcon = "eye.slash.circle"
    @State private var eyeButtonIcon = "eye.circle"
    private let globalMouseListener = GlobalMouseListener()
    
    var body: some View {
        VStack{
            Text(self.isListeningForClick ? "Click on target" : "Target coordinates: \(Int(ceil(mouseLocation.x))), \(Int(ceil(mouseLocation.y)))")
            HStack {
                Button(action: {
                    if !self.isListeningForClick {
                        self.isListeningForClick = true
                        self.globalMouseListener.startListening { location in
                            self.mouseLocation = location
                            self.isListeningForClick = false
                            self.globalMouseListener.stopListening()
                        }
                    }
                }) {
                    Image(systemName: "scope")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                        .padding(3)
                }
                
                if isSecure {
                    SecureField("Enter Data", text: $inputData).frame(minWidth: 200)
                } else {
                    TextField("Enter Data", text: $inputData).frame(minWidth: 200)
                }
                
                Button(action: {
                    isSecure.toggle()
                }) {
                    Image(systemName: isSecure ? "eye.circle" : "eye.slash.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                        .padding(3)
                }
                
                Button(action:{
                    simulateMouseClick(at: mouseLocation)
                    simulateKeyPress(with: inputData)
                }) {
                    Text("Send keys")
                }
                
            }
            .padding(15)
            .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
