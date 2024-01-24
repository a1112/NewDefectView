import QtQuick 2.15
import "../Base"
Item {
    id:root
    property int size : 12
    property int textFieldSize: 10
    property int menuItemSize: textFieldSize

    property FontInfo baseFontInfo: FontInfo{
        name:"常规 "
        pointSize:12
        category:"baseFont"
    }
    property FontInfo labelKeyInfo: FontInfo{
        name:"常规 key"
        category:"KeyFont"
        family:"华文新魏"
        bold: true
        pointSize:15
    }
    property FontInfo labelValueInfo: FontInfo{
        name:"常规 Value"
        category: "ValueFont"
        pointSize:12
    }
    property FontInfo titleDateFontInfo: FontInfo{
        category: "TitleDateFont"
        name:"信息 数字"
        family: "DS-Digital"
        pointSize: 18
    }
    property FontInfo tabButtonFontInfo: FontInfo{
        category: "TabButtonFont"
        name:"TabButton Font"
        pointSize: 13
    }
    property FontInfo fieldTextInfo: FontInfo{
        name:"输入框"
        pointSize:13
    }
    property FontInfo menuFontInfo: FontInfo{
        name:"菜单项"
        pointSize:13
    }
    property FontInfo aboutKeyLabel: FontInfo{
        name:"关于界面，key"
        pointSize:13
    }
    property FontInfo buttonLabel: FontInfo{
        name:"按钮"
        pointSize:13
        bold: true
    }
    property FontInfo titleFontInfo: FontInfo{
        name:"标题"
        font.family: "华文新魏"
        font.pointSize: 20
    }
    property FontInfo titleFontInfo2: FontInfo{
        name:"标题2"
        font.pointSize: 22
        font.family: "思源宋体"
    }
    property var userFonts: ["DS-Digital"]
    property var fontInfoList: [baseFontInfo,labelKeyInfo,labelValueInfo,titleDateFontInfo,tabButtonFontInfo,
        fieldTextInfo,aboutKeyLabel,buttonLabel,titleFontInfo,menuFontInfo]

}
