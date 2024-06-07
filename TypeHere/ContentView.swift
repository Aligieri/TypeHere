import SwiftUI

struct ContentView: View {
    @State private var mouseLocation: CGPoint = .zero
    @State private var isListeningForClick: Bool = false
    @State private var inputData = ""
    private let globalMouseListener = GlobalMouseListener()
    
    var body: some View {
        VStack{
            Text("Target coordinates: \(Int(ceil(mouseLocation.x))), \(Int(ceil(mouseLocation.y)))")
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
                .padding(20)
                
                TextField(text: $inputData){
                    
                }
                .frame(minWidth: 200)
                
                Button(action:{
                    simulateMouseClick(at: mouseLocation)
                    simulateKeyPress(with: inputData)
                }) {
                    Text("Send keys")
                }.padding(20)
                
            }
            .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
