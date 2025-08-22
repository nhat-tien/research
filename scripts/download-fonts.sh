mkdir -p ../docs/fonts
if [ ! -f "../docs/fonts/NotoSans-Regular.ttf" ]; then
    curl -sL https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Regular.ttf -o ../docs/fonts/NotoSans-Regular.ttf
    curl -sL https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Bold.ttf -o ../docs/fonts/NotoSans-Bold.ttf
    curl -sL https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Italic.ttf -o ../docs/fonts/NotoSans-Italic.ttf
    curl -sL https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-BoldItalic.ttf -o ../docs/fonts/NotoSans-BoldItalic.ttf
fi
