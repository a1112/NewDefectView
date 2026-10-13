import Qt.labs.settings 1.1

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
import "qml/TrainWindow"
import "qml/TestWindow"

ApplicationWindow {

    // Screen dimensions are Qt logical pixels; do not multiply by devicePixelRatio.
    property bool startupGeometryReady: false
    Settings {
        id: startupGeometry
        category: "MainWindowGeometry"
        // Explicit isolated profile for automated/synthetic window smoke tests.
        fileName: {
            var prefix = "--window-geometry-settings="
            for (var i = 0; i < Qt.application.arguments.length; ++i) {
                var argument = Qt.application.arguments[i]
                if (argument.indexOf(prefix) === 0) return argument.substring(prefix.length)
            }
            return ""
        }
        property real savedX: -100000
        property real savedY: -100000
        property real savedWidth: 0
        property real savedHeight: 0
    }
    function fitStartupGeometry(useSaved) {
        var screens = Qt.application.screens
        var target = screen
        var px = useSaved ? startupGeometry.savedX : x
        var py = useSaved ? startupGeometry.savedY : y
        var pw = useSaved ? startupGeometry.savedWidth : width
        var ph = useSaved ? startupGeometry.savedHeight : height
        var saved = pw > 0 && ph > 0 && isFinite(px) && isFinite(py) && isFinite(pw) && isFinite(ph)
        var bestArea = 0
        for (var i = 0; i < screens.length; ++i) {
            var candidate = screens[i]
            var overlap = Math.max(0, Math.min(px + pw, candidate.virtualX + candidate.width) - Math.max(px, candidate.virtualX))
                * Math.max(0, Math.min(py + ph, candidate.virtualY + candidate.height) - Math.max(py, candidate.virtualY))
            if (overlap > bestArea) { target = candidate; bestArea = overlap }
        }
        if (!target) return
        screen = target
        // Reserve desktop edges and titlebar space in addition to the work-area limit.
        var aw = Math.max(1, Math.min(target.width, target.desktopAvailableWidth) - 48)
        var ah = Math.max(1, Math.min(target.height, target.desktopAvailableHeight) - 64)
        var left = target.virtualX + (target.width - aw) / 2
        var top = target.virtualY + (target.height - ah) / 2
        minimumWidth = Math.min(800, aw, saved && pw >= 320 ? pw : 800)
        minimumHeight = Math.min(520, ah, saved && ph >= 240 ? ph : 520)
        if (useSaved && !saved) {
            pw = Math.min(1100, Math.floor(aw * 0.82))
            ph = Math.min(720, Math.floor(ah * 0.82))
            px = left + (aw - pw) / 2
            py = top + (ah - ph) / 2
        }
        if (saved && px >= target.virtualX && py >= target.virtualY
                && px + pw <= target.virtualX + target.width
                && py + ph <= target.virtualY + target.height
                && pw <= target.desktopAvailableWidth && ph <= target.desktopAvailableHeight) {
            width = pw; height = ph; x = px; y = py
            return
        }
        width = Math.min(Math.max(pw, minimumWidth), aw)
        height = Math.min(Math.max(ph, minimumHeight), ah)
        x = Math.max(left, Math.min(px, left + aw - width))
        y = Math.max(top, Math.min(py, top + ah - height))
    }
    onScreenChanged: if (startupGeometryReady && visibility === Window.Windowed) fitStartupGeometry(false)
    onClosing: {
        if (visibility === Window.Windowed) {
            startupGeometry.savedX = x
            startupGeometry.savedY = y
            startupGeometry.savedWidth = width
            startupGeometry.savedHeight = height
        }
    }

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

    visibility: Window.Windowed
//    width:desktopAvailableWidth
//    height:desktopAvailableHeight-50

    width: 1100

    height: 720

    SizeMange{
        id:sizeMange

    }
    property AutoSize autoSize: sizeMange.currentAutoSize

    Component.onCompleted: {
        fitStartupGeometry(true); startupGeometryReady = true;
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
    property real appScale:autoSize.appScale//
    property int dpi: autoSize.dpi
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
    TrainWindow{
        visible: false
        id: trainWindow
    }

    function openTrainWindow(){
        trainWindow.visible=true
    }

    TestWindow{
        visible: false
        id: testWindow

    }
    function openTest(){
        testWindow.visible=true
    }
}
