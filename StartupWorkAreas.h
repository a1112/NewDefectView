#pragma once
#include <QGuiApplication>
#include <QScreen>
#include <QQmlEngine>
#include <QQmlContext>
#include <QVariantList>
#include <QVariantMap>

// Screen geometry and availableGeometry use the same Qt logical coordinate space.
inline void installStartupWorkAreas(QQmlEngine &engine) {
    auto update = [&engine] {
        QVariantList areas;
        for (auto *screen : QGuiApplication::screens()) {
            const QRect geometry = screen->geometry();
            const QRect area = screen->availableGeometry();
            areas.append(QVariantMap{{"screenX", geometry.x()}, {"screenY", geometry.y()},
                {"screenWidth", geometry.width()}, {"screenHeight", geometry.height()},
                {"x", area.x()}, {"y", area.y()}, {"width", area.width()}, {"height", area.height()}});
        }
        engine.rootContext()->setContextProperty(QStringLiteral("startupWorkAreas"), areas);
    };
    auto watch = [&engine, update](QScreen *screen) {
        QObject::connect(screen, &QScreen::availableGeometryChanged, &engine, update);
        QObject::connect(screen, &QScreen::geometryChanged, &engine, update);
    };
    for (auto *screen : QGuiApplication::screens()) watch(screen);
    QObject::connect(qGuiApp, &QGuiApplication::screenAdded, &engine, [watch, update](QScreen *screen) { watch(screen); update(); });
    QObject::connect(qGuiApp, &QGuiApplication::screenRemoved, &engine, [update](QScreen *) { update(); });
    update();
}
