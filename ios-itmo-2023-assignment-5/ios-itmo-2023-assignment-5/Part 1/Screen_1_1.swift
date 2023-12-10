import SwiftUI

struct Screen_1_1: View {
    @State var pass: String = ""
    
    var body: some View {
        VStack {
            Image("vkid logo")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding()
            
            Text("Введите пароль")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            SecureField("Введите пароль", text: $pass)
                .autocorrectionDisabled()
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(.quinary)
                .clipShape(.rect(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor.separator)))
                .padding(.horizontal, 20)
                
            Text("Забыли или не установили пароль?")
                .font(.caption)
                .foregroundColor(Color.blue)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Spacer()
            
            Button("Продолжить", action: {})
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundStyle(.white)
                .font(.body)
                .fontWeight(.medium)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 20)
        }
    }

}

#Preview {
    Screen_1_1()
}
