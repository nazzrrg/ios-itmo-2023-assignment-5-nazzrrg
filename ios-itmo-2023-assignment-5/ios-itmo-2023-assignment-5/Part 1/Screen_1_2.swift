import SwiftUI

struct Screen_1_2: View {
    @State var timestamp: TimeInterval = 67
    @State var duration: TimeInterval = 3*60-1
    @State var preload: Float = 200/360
    @State var imgName: String = "album cover 2"
    
    let formatter = DateComponentsFormatter()
    
    var body: some View {
        ZStack {
            getBackgroundColor().opacity(0.7).ignoresSafeArea()
            VStack {
                Image(imgName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 40)
                
                playback.padding(.horizontal, 40).padding(.vertical, 20)
                
                Text("Un trajet Berlin~Saint-Petersburg")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Arthur Elkeen")
                
                controls.padding()
            }
        }
    }

    var playback: some View {
        VStack {
            GeometryReader { geometry in
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 3)
                    .clipShape(.rect(cornerRadius: 1.5))
                    .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                    .foregroundColor(.black)
                    .opacity(0.3)
                    .overlay {
                        HStack(spacing: 0){
                            Rectangle()
                                .frame(width: geometry.size.width * CGFloat(self.preload), height: 3)
                                .clipShape(.rect(cornerRadius: 1.5))
                                .foregroundColor(.white)
                                .opacity(0.3)
                            Spacer(minLength: 0)
                        }
                    }
                    .overlay {
                        HStack(spacing: 0){
                            Rectangle()
                                .frame(width: geometry.size.width * CGFloat(self.timestamp/self.duration), height: 3)
                                .foregroundColor(.white)
                            Spacer(minLength: 0)
                        }
                    }
                
                Circle()
                    .frame(width: 11, height: 11)
                    .foregroundColor(.white)
                    .position(x: geometry.size.width * CGFloat(self.timestamp/self.duration), y: geometry.frame(in: .local).midY)
            }.frame(height: 12)
            HStack {
                Text(formatter.string(from: timestamp) ?? "")
                    .font(.caption)
                Spacer()
                Text("-" + (formatter.string(from: duration-timestamp) ?? ""))
                    .font(.caption)
            }
        }
    }
    
    var controls: some View {
        HStack {
            Image(systemName: "arrow.down.to.line.compact")
                .resizable().scaledToFit().frame(width: 16)
            Spacer()
            Image(systemName: "backward.fill")
                .resizable().scaledToFit().frame(width: 29)
            Spacer()
            Image(systemName: "pause.fill")
                .resizable().frame(width: 32, height: 36)
            Spacer()
            Image(systemName: "forward.fill")
                .resizable().scaledToFit().frame(width: 29)
            Spacer()
            Image(systemName: "ellipsis")
                .resizable().scaledToFit().frame(width: 16)
        }.padding()
    }
    
    private func getBackgroundColor() -> Color {
        return Color (UIImage(named: imgName)?.averageColor ?? .yellow)
    }
}

#Preview {
    Screen_1_2()
}
