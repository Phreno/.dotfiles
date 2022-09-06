installe_chrysalis(){
    wget  https://github.com/keyboardio/Chrysalis/releases/download/v0.11.0/Chrysalis-0.11.0.AppImage -O ~/bin/chrysalis
    chmod +x ~/bin/chrysalis
}
main(){
installe_chrysalis
}
main
