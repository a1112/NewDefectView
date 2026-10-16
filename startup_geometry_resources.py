# Resource object code (Python 3)
# Created by: object code
# Created by: The Resource Compiler for Qt version 6.12.0
# WARNING! All changes made in this file will be lost!

from PySide2 import QtCore

qt_resource_data = b"\
\x00\x00$X\
i\
mport Qt.labs.se\
ttings 1.1\x0a\x0aimpo\
rt QtQml 2.15\x0aim\
port QtQuick.Win\
dow 2.15\x0aimport \
QtQuick.Controls\
.Material 2.15\x0ai\
mport QtQuick.Co\
ntrols 2.15\x0a\x0aimp\
ort \x22qml\x22\x0aimport\
 \x22qml/version\x22\x0ai\
mport \x22qml/Core\x22\
\x0aimport \x22qml/Api\
\x22\x0aimport \x22qml/Te\
st\x22\x0aimport \x22qml/\
Dialog\x22\x0aimport \x22\
qml/init\x22\x0aimport\
 \x22qml/DefectView\
Dialog\x22\x0aimport \x22\
qml/SettingDialo\
gs\x22\x0aimport \x22qml/\
TaskScheduler\x22\x0ai\
mport \x22qml/Searc\
hView\x22\x0aimport \x22q\
ml/Loader\x22\x0aimpor\
t \x22qml/configs\x22\x0a\
import \x22qml/Defe\
ctListDialog\x22\x0aim\
port \x22qml/MaxIma\
geDialogView\x22\x0aim\
port \x22qml/CPP\x22\x0ai\
mport \x22qml/Globa\
l\x22\x0aimport \x22main.\
js\x22 as Mjs\x0aimpor\
t \x22qml/AbortView\
\x22\x0aimport \x22qml/Ju\
mpView\x22\x0aimport \x22\
qml/UpApp\x22\x0aimpor\
t \x22qml/autoSize\x22\
\x0aimport \x22qml/Sub\
View/LinkView\x22\x0ai\
mport \x22qml/Train\
Window\x22\x0aimport \x22\
qml/TestWindow\x22\x0a\
\x0aApplicationWind\
ow {\x0a\x0a    // Scr\
een dimensions a\
re Qt logical pi\
xels; do not mul\
tiply by deviceP\
ixelRatio.\x0a    p\
roperty bool sta\
rtupGeometryRead\
y: false\x0a    Set\
tings {\x0a        \
id: startupGeome\
try\x0a        cate\
gory: \x22MainWindo\
wGeometry\x22\x0a     \
   // Explicit i\
solated profile \
for automated/sy\
nthetic window s\
moke tests.\x0a    \
    fileName: {\x0a\
            var \
prefix = \x22--wind\
ow-geometry-sett\
ings=\x22\x0a         \
   for (var i = \
0; i < Qt.applic\
ation.arguments.\
length; ++i) {\x0a \
               v\
ar argument = Qt\
.application.arg\
uments[i]\x0a      \
          if (ar\
gument.indexOf(p\
refix) === 0) re\
turn argument.su\
bstring(prefix.l\
ength)\x0a         \
   }\x0a           \
 return \x22\x22\x0a     \
   }\x0a        pro\
perty real saved\
X: -100000\x0a     \
   property real\
 savedY: -100000\
\x0a        propert\
y real savedWidt\
h: 0\x0a        pro\
perty real saved\
Height: 0\x0a    }\x0a\
    function fit\
StartupGeometry(\
useSaved) {\x0a    \
    var screens \
= Qt.application\
.screens\x0a       \
 var target = sc\
reen\x0a        var\
 px = useSaved ?\
 startupGeometry\
.savedX : x\x0a    \
    var py = use\
Saved ? startupG\
eometry.savedY :\
 y\x0a        var p\
w = useSaved ? s\
tartupGeometry.s\
avedWidth : widt\
h\x0a        var ph\
 = useSaved ? st\
artupGeometry.sa\
vedHeight : heig\
ht\x0a        var s\
aved = pw > 0 &&\
 ph > 0 && isFin\
ite(px) && isFin\
ite(py) && isFin\
ite(pw) && isFin\
ite(ph)\x0a        \
var bestArea = 0\
\x0a        for (va\
r i = 0; i < scr\
eens.length; ++i\
) {\x0a            \
var candidate = \
screens[i]\x0a     \
       var overl\
ap = Math.max(0,\
 Math.min(px + p\
w, candidate.vir\
tualX + candidat\
e.width) - Math.\
max(px, candidat\
e.virtualX))\x0a   \
             * M\
ath.max(0, Math.\
min(py + ph, can\
didate.virtualY \
+ candidate.heig\
ht) - Math.max(p\
y, candidate.vir\
tualY))\x0a        \
    if (overlap \
> bestArea) { ta\
rget = candidate\
; bestArea = ove\
rlap }\x0a        }\
\x0a        if (!ta\
rget) return\x0a   \
     screen = ta\
rget\x0a        // \
Use native QScre\
en.availableGeom\
etry: a left Doc\
k or top panel c\
hanges the origi\
n too.\x0a        v\
ar area = {x: ta\
rget.virtualX, y\
: target.virtual\
Y, width: target\
.width, height: \
target.height}\x0a \
       var nativ\
eAreas = typeof \
startupWorkAreas\
 !== \x22undefined\x22\
 ? startupWorkAr\
eas : []\x0a       \
 for (var j = 0;\
 j < nativeAreas\
.length; ++j) {\x0a\
            var \
nativeArea = nat\
iveAreas[j]\x0a    \
        if (nati\
veArea.screenX =\
== target.virtua\
lX && nativeArea\
.screenY === tar\
get.virtualY\x0a   \
                \
 && nativeArea.s\
creenWidth === t\
arget.width && n\
ativeArea.screen\
Height === targe\
t.height) {\x0a    \
            area\
 = nativeArea\x0a  \
              br\
eak\x0a            \
}\x0a        }\x0a    \
    var aw = Mat\
h.max(1, area.wi\
dth - 48)\x0a      \
  var ah = Math.\
max(1, area.heig\
ht - 64)\x0a       \
 var left = area\
.x + 24\x0a        \
var top = area.y\
 + 32\x0a        mi\
nimumWidth = Mat\
h.min(800, aw, s\
aved ? pw : 800)\
\x0a        minimum\
Height = Math.mi\
n(520, ah, saved\
 ? ph : 520)\x0a   \
     if (useSave\
d && !saved) {\x0a \
           pw = \
Math.min(1100, M\
ath.floor(aw * 0\
.82))\x0a          \
  ph = Math.min(\
720, Math.floor(\
ah * 0.82))\x0a    \
        px = lef\
t + (aw - pw) / \
2\x0a            py\
 = top + (ah - p\
h) / 2\x0a         \
   minimumWidth \
= Math.min(minim\
umWidth, pw)\x0a   \
         minimum\
Height = Math.mi\
n(minimumHeight,\
 ph)\x0a        }\x0a \
       if (saved\
 && px >= area.x\
 && py >= area.y\
\x0a               \
 && px + pw <= a\
rea.x + area.wid\
th && py + ph <=\
 area.y + area.h\
eight) {\x0a       \
     width = pw;\
 height = ph; x \
= px; y = py\x0a   \
         return\x0a\
        }\x0a      \
  width = Math.m\
in(Math.max(pw, \
minimumWidth), a\
w)\x0a        heigh\
t = Math.min(Mat\
h.max(ph, minimu\
mHeight), ah)\x0a  \
      x = Math.m\
ax(left, Math.mi\
n(px, left + aw \
- width))\x0a      \
  y = Math.max(t\
op, Math.min(py,\
 top + ah - heig\
ht))\x0a    }\x0a    p\
roperty var star\
tupWorkAreaSnaps\
hot: typeof star\
tupWorkAreas !==\
 \x22undefined\x22 ? s\
tartupWorkAreas \
: []\x0a    onStart\
upWorkAreaSnapsh\
otChanged: if (s\
tartupGeometryRe\
ady && visibilit\
y === Window.Win\
dowed) fitStartu\
pGeometry(false)\
\x0a    onScreenCha\
nged: if (startu\
pGeometryReady &\
& visibility ===\
 Window.Windowed\
) fitStartupGeom\
etry(false)\x0a    \
onClosing: {\x0a   \
     if (visibil\
ity === Window.W\
indowed) {\x0a     \
       startupGe\
ometry.savedX = \
x\x0a            st\
artupGeometry.sa\
vedY = y\x0a       \
     startupGeom\
etry.savedWidth \
= width\x0a        \
    startupGeome\
try.savedHeight \
= height\x0a       \
 }\x0a    }\x0a\x0a//    \
flags:Qt.ToolTip\
\x0a    property Ap\
pGlobal appGloba\
l: AppGlobal{}\x0a \
   id: id_app  /\
/\x0a//    Material\
.background:core\
Style.theme===Ma\
terial.Dark?Mate\
rial.Gray:\x22#8385\
85\x22\x0a    Material\
.theme: coreStyl\
e.theme\x0a    prop\
erty int screenP\
ixWidth: Screen.\
width\x0a    proper\
ty int screenPix\
Height: Screen.h\
eight\x0a  //  prop\
erty FluTheme fl\
uTheme: FluTheme\
{}\x0a\x0a    property\
 int desktopAvai\
lableWidth: Scre\
en.desktopAvaila\
bleWidth\x0a    pro\
perty int deskto\
pAvailableHeight\
: Screen.desktop\
AvailableHeight\x0a\
    property rea\
l screenWidth: d\
esktopAvailableW\
idth/Screen.pixe\
lDensity/25.4\x0a  \
  property real \
screenHeight: de\
sktopAvailableHe\
ight/Screen.pixe\
lDensity/25.4\x0a  \
  property real \
screenSize: Math\
.sqrt(screenWidt\
h**2+screenHeigh\
t**2)\x0a\x0a    visib\
ility: Window.Wi\
ndowed\x0a//    wid\
th:desktopAvaila\
bleWidth\x0a//    h\
eight:desktopAva\
ilableHeight-50\x0a\
\x0a    width: 1100\
\x0a\x0a    height: 72\
0\x0a\x0a    SizeMange\
{\x0a        id:siz\
eMange\x0a\x0a    }\x0a  \
  property AutoS\
ize autoSize: si\
zeMange.currentA\
utoSize\x0a\x0a    Com\
ponent.onComplet\
ed: {\x0a        fi\
tStartupGeometry\
(true); startupG\
eometryReady = t\
rue;\x0a        con\
sole.log(\x22App IN\
FO\x22)\x0a        con\
sole.log(screenP\
ixWidth)\x0a       \
 console.log(scr\
eenPixHeight)\x0a  \
      console.lo\
g(\x22Screen INFO\x22)\
\x0a        console\
.log(desktopAvai\
lableWidth)\x0a    \
    console.log(\
desktopAvailable\
Height)\x0a        \
console.log(dpi)\
\x0a        console\
.log(screenWidth\
)\x0a        consol\
e.log(screenHeig\
ht)\x0a        cons\
ole.log(screenSi\
ze)\x0a    }\x0a\x0a//   \
 LoggingCategory\
 {\x0a//           \
  id: category\x0a/\
/             na\
me: \x22com.qt.cate\
gory\x22\x0a//        \
     defaultLogL\
evel: LoggingCat\
egory.Info\x0a//   \
      }\x0a    prop\
erty real appSca\
le:autoSize.appS\
cale//\x0a    prope\
rty int dpi: aut\
oSize.dpi\x0a    pr\
operty Core core\
: Core{}\x0a    pro\
perty CoreStyle \
coreStyle: CoreS\
tyle{}   // STYL\
E\x0a    property C\
oreConfig coreCo\
nfig: CoreConfig\
{}\x0a    property \
Ajax ajax: Ajax{\
}\x0a    property A\
pi api: Api{}\x0a  \
  property Test \
test: Test{}\x0a   \
 property CoreMo\
dels coreModels:\
 CoreModels{}\x0a  \
  property CoreT\
imer coreTimer: \
CoreTimer{}   //\
 \xe8\xbd\xae\xe8\xaf\xa2 \xe6\x8e\xa7\xe5\x88\xb6\xe5\x99\
\xa8\x0a    property G\
lobalDialog glob\
alDialog: Global\
Dialog{}  // \xe5\xbc\xb9\
\xe7\xaa\x97\xe6\x8a\xa5\xe8\xad\xa6\xe4\xb9\x8b\xe7\xb1\xbb\xe7\
\x9a\x84\xe4\xbf\xa1\xe6\x81\xaf\x0a    pro\
perty CoreObj co\
reObj: CoreObj{}\
\x0a    property In\
it coreInit: Ini\
t{}\x0a    property\
 Control control\
: Control{}\x0a    \
property CoreSta\
te coreState: Co\
reState{}\x0a    pr\
operty CoreFunc \
coreFunc: CoreFu\
nc{}\x0a\x0a\x0a//    wid\
th: Screen.width\
*0.8\x0a//    heigh\
t: Screen.height\
*0.8\x0a    visible\
: true\x0a\x0a//    on\
VisibilityChange\
d: {\x0a//        i\
f (visibility==W\
indow.Maximized)\
{\x0a//            \
width=desktopAva\
ilableWidth\x0a//  \
      }\x0a//    }\x0a\
    title: appGl\
obal.app_title\x0a \
   //-----------\
----------------\
--- \xe7\x95\x8c\xe9\x9d\xa2\xe5\x85\xa5\xe5\x8f\xa3\
W\x0a    AppManage{\
\x0a    }\x0a    //---\
----------------\
-----------\x0a\x0a\x0a  \
  CoreAction{ //\
 \xe8\xae\xbe\xe7\xbd\xae\xe5\xbf\xab\xe6\x8d\xb7\xe9\x94\xae\
\x0a    }\x0a    prope\
rty DefectViewDi\
alog defectViewD\
ialog: DefectVie\
wDialog{  // \xe6\x82\xac\
\xe5\x81\x9c\xe6\x98\xbe\xe7\xa4\xba\xe4\xb8\x80\xe4\xb8\xaa\xe7\
\xbc\xba\xe9\x99\xb7\x0a    }\x0a    \
property Setting\
DialogManagement\
 sdm: SettingDia\
logManagement{\x0a \
   }\x0a    propert\
y ConnectDialogs\
 connectDialogs:\
 ConnectDialogs{\
}\x0a    property S\
earchView search\
View: SearchView\
{}\x0a    DefectInf\
oDialog{ //\x0a    \
    id:defectInf\
oDialog\x0a    }\x0a  \
  property FontC\
onfig fontConfig\
: FontConfig{}//\
\xe5\xad\x97\xe4\xbd\x93\xe7\xae\xa1\xe7\x90\x86\x0a   \
 property Shadow\
Config shadowCon\
fig: ShadowConfi\
g{}\x0a    property\
 TaskScheduler t\
askScheduler:Tas\
kScheduler{}    \
// \xe8\xae\xa1\xe6\x97\xb6\xe4\xbb\xbb\xe5\x8a\xa1\x0a\
    property One\
DefectViewDialog\
 oneDefectViewDi\
alog: OneDefectV\
iewDialog{//\xe6\x98\xbe\xe7\
\xa4\xba\xe4\xb8\x80\xe4\xb8\xaa\xe7\xbc\xba\xe9\x99\xb7\x0a \
   }\x0a    propert\
y AbortView abor\
tView: AbortView\
{}\x0a    property \
DefectListDialog\
View defectListD\
ialogView: Defec\
tListDialogView{\
//\xe6\x98\xbe\xe7\xa4\xba\xe4\xb8\x80\xe6\x8e\x92\xe7\xbc\
\xba\xe9\x99\xb7\x0a    }\x0a    p\
roperty MaxImage\
DialogView maxIm\
ageDialogView:Ma\
xImageDialogView\
{  //\xe5\xa4\xa7\xe5\x9b\xbe\xe6\x9f\xa5\xe7\x9c\
\x8b\x0a    }\x0a    prop\
erty TestView te\
stView: TestView\
{}\x0a\x0a    property\
 LinkView linkVi\
ew: LinkView{}\x0a\x0a\
    FontLoaders{\
}//\xe5\x8a\xa0\xe8\xbd\xbd\xe5\xad\x97\xe4\xbd\x93\x0a\
    property Cpp\
Funcs cppFuncs: \
CppFuncs{}\x0a    J\
umpView{// quick\
 jump\x0a    }\x0a    \
Dialog {\x0a       \
 id: openAceeptD\
ialogDialog\x0a    \
    title: \x22\xe5\xaf\xb9\xe6\
\xa0\x87\xe6\xb3\xa8\xe7\xbc\xba\xe9\x99\xb7\xe8\xbf\x9b\xe8\xa1\
\x8c\xe6\x8f\x90\xe4\xba\xa4\xef\xbc\x81\x22\x0a    \
    standardButt\
ons: Dialog.Ok |\
 Dialog.Cancel\x0a \
       property \
var func\x0a       \
 function accept\
(func_){\x0a       \
     func=func_\x0a\
            this\
.open()\x0a        \
}\x0a        onAcce\
pted: {func()}\x0a \
       anchors.c\
enterIn: parent\x0a\
    }\x0a    proper\
ty UpAppCore upA\
ppCore: UpAppCor\
e{} // \xe6\x9b\xb4\xe6\x96\xb0\xe7\xa8\x8b\
\xe5\xba\x8f\x0a    property\
 UpAppMenu upApp\
Menu: UpAppMenu{\
}\x0a    TrainWindo\
w{\x0a        visib\
le: false\x0a      \
  id: trainWindo\
w\x0a    }\x0a\x0a    fun\
ction openTrainW\
indow(){\x0a       \
 trainWindow.vis\
ible=true\x0a    }\x0a\
\x0a    TestWindow{\
\x0a        visible\
: false\x0a        \
id: testWindow\x0a\x0a\
    }\x0a    functi\
on openTest(){\x0a \
       testWindo\
w.visible=true\x0a \
   }\x0a}\x0a\
"

qt_resource_name = b"\
\x00\x08\
\x08\x01Z\x5c\
\x00m\
\x00a\x00i\x00n\x00.\x00q\x00m\x00l\
"

qt_resource_struct = b"\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x01\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\
"

def qInitResources():
    QtCore.qRegisterResourceData(0x01, qt_resource_struct, qt_resource_name, qt_resource_data)

def qCleanupResources():
    QtCore.qUnregisterResourceData(0x01, qt_resource_struct, qt_resource_name, qt_resource_data)

qInitResources()
