"""Expose each monitor's real work area in Qt logical coordinates."""
def install(engine, app):
    def update(*_):
        areas = []
        for screen in app.screens():
            geometry, area = screen.geometry(), screen.availableGeometry()
            areas.append(dict(screenX=geometry.x(), screenY=geometry.y(),
                screenWidth=geometry.width(), screenHeight=geometry.height(),
                x=area.x(), y=area.y(), width=area.width(), height=area.height()))
        engine.rootContext().setContextProperty("startupWorkAreas", areas)
    def watch(screen):
        screen.availableGeometryChanged.connect(update)
        screen.geometryChanged.connect(update)
    def added(screen):
        watch(screen)
        update()
    for screen in app.screens():
        watch(screen)
    app.screenAdded.connect(added)
    app.screenRemoved.connect(update)
    # Retain callbacks for the lifetime of this engine.
    engine._startup_work_area_callbacks = (update, watch, added)
    update()
