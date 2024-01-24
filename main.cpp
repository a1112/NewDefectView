#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
//#include "Frameless/TaoFrameLessView.h"
#include "h/clipboard.h"
#include "h/os.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
        QApplication app(argc, argv);
        const QUrl url(QStringLiteral("qrc:/main.qml"));
         qmlRegisterType<Clipboard>("Clipboard",1,0,"Clipboard");
         qmlRegisterType<OS>("Os",1,0,"Os");
//        TaoFrameLessView view;
//        view.setSource(url);
//        view.moveToScreenCenter();
//        view.show();
        QQmlApplicationEngine engine;
//        engine.addImportPath(TaoQuickImportPath);
//        engine.rootContext()->setContextProperty("taoQuickImagePath", TaoQuickImagePath);
        engine.load(url);
        return app.exec();
}
