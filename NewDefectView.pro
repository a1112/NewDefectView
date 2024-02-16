QT += quick charts network

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
cpp/clipboard.cpp \
cpp/os.cpp \
main.cpp

RESOURCES += qml.qrc
RC_ICONS = icon.ico
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    resource/icon/company2.png
#    src/TaoCommon/TaoCommon.pri \
#    src/TaoCommon/TaoCommonInstall.pri

HEADERS += \
    h/clipboard.h \
    h/os.h


#include(src/TaoCommon/TaoCommon.pri)
#include(../TaoQuick/TaoQuick.pri)
