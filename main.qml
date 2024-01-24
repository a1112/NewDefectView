
import QtQml 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15

import "qml"
import "qml/version"
import "qml/Core"
import "qml/Api"
import "qml/Test"
import "qml/Dialog"
import "qml/init"
import "qml/DefectViewDialog"
import "qml/SettingDialogs"
import "qml/TaskScheduler"
import "qml/SearchView"
import "qml/Loader"
import "qml/configs"
import "qml/DefectListDialog"
import "qml/MaxImageDialogView"
import "qml/CPP"
import "qml/Global"
import "main.js" as Mjs
import "qml/AbortView"
import "qml/JumpView"
import "qml/UpApp"
import "qml/autoSize"
import "qml/SubView/LinkView"

ApplicationWindow {
//    flags:Qt.ToolTip
    property AppGlobal appGlobal: AppGlobal{}
    id: id_app  //
//    Material.background:coreStyle.theme===Material.Dark?Material.Gray:"#838585"
    Material.theme: coreStyle.theme
    property int screenPixWidth: Screen.width
    property int screenPixHeight: Screen.height
  //  property FluTheme fluTheme: FluTheme{}

    property int desktopAvailableWidth: Screen.desktopAvailableWidth
    property int desktopAvailableHeight: Screen.desktopAvailableHeight
    property real screenWidth: desktopAvailableWidth/Screen.pixelDensity/25.4
    property real screenHeight: desktopAvailableHeight/Screen.pixelDensity/25.4
    property real screenSize: Math.sqrt(screenWidth**2+screenHeight**2)
    visibility: Window.Maximized
//    width:desktopAvailableWidth
//    height:desktopAvailableHeight-50
    width:screenPixWidth*0.85
    height:screenPixHeight*0.85


    property AutoSize autoSize: AutoSize{}

    Component.onCompleted: {
        console.log("App INFO")
        console.log(screenPixWidth)
        console.log(screenPixHeight)
        console.log("Screen INFO")
        console.log(desktopAvailableWidth)
        console.log(desktopAvailableHeight)
        console.log(dpi)
        console.log(screenWidth)
        console.log(screenHeight)
        console.log(screenSize)
    }

//    LoggingCategory {
//             id: category
//             name: "com.qt.category"
//             defaultLogLevel: LoggingCategory.Info
//         }
    property real appScale: screenSize>20?1:screenSize>16?0.8:0.7
    property int dpi: Screen.pixelDensity*25.4*appScale
    property Core core: Core{}
    property CoreStyle coreStyle: CoreStyle{}   // STYLE
    property CoreConfig coreConfig: CoreConfig{}
    property Ajax ajax: Ajax{}
    property Api api: Api{}
    property Test test: Test{}
    property CoreModels coreModels: CoreModels{}
    property CoreTimer coreTimer: CoreTimer{}   // 轮询 控制器
    property GlobalDialog globalDialog: GlobalDialog{}  // 弹窗报警之类的信息
    property CoreObj coreObj: CoreObj{}
    property Init coreInit: Init{}
    property Control control: Control{}
    property CoreState coreState: CoreState{}
    property CoreFunc coreFunc: CoreFunc{}


//    width: Screen.width*0.8
//    height: Screen.height*0.8
    visible: true

//    onVisibilityChanged: {
//        if (visibility==Window.Maximized){
//            width=desktopAvailableWidth
//        }
//    }
    title: appGlobal.app_title
    //------------------------------ 界面入口W
    AppManage{
    }
    //------------------------------


    CoreAction{ // 设置快捷键
    }
    property DefectViewDialog defectViewDialog: DefectViewDialog{  // 悬停显示一个缺陷
    }
    property SettingDialogManagement sdm: SettingDialogManagement{
    }
    property ConnectDialogs connectDialogs: ConnectDialogs{}
    property SearchView searchView: SearchView{}
    DefectInfoDialog{ //
        id:defectInfoDialog
    }
    property FontConfig fontConfig: FontConfig{}//字体管理
    property ShadowConfig shadowConfig: ShadowConfig{}
    property TaskScheduler taskScheduler:TaskScheduler{}    // 计时任务
    property OneDefectViewDialog oneDefectViewDialog: OneDefectViewDialog{//显示一个缺陷
    }
    property AbortView abortView: AbortView{}
    property DefectListDialogView defectListDialogView: DefectListDialogView{//显示一排缺陷
    }
    property MaxImageDialogView maxImageDialogView:MaxImageDialogView{  //大图查看
    }
    property TestView testView: TestView{}

    property LinkView linkView: LinkView{}

    FontLoaders{}//加载字体
    property CppFuncs cppFuncs: CppFuncs{}
    JumpView{// quick jump
    }
    Dialog {
        id: openAceeptDialogDialog
        title: "对标注缺陷进行提交！"
        standardButtons: Dialog.Ok | Dialog.Cancel
        property var func
        function accept(func_){
            func=func_
            this.open()
        }
        onAccepted: {func()}
        anchors.centerIn: parent
    }
    property UpAppCore upAppCore: UpAppCore{} // 更新程序
    property UpAppMenu upAppMenu: UpAppMenu{}
}
