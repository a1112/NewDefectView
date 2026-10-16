# This Python file uses the following encoding: utf-8

import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


import startup_geometry_resources  # Register the updated entry before the legacy resource bundle.
from qml_rc import *
import os

os.environ["QML_XHR_ALLOW_FILE_READ"] = "1"


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    app.setOrganizationName("a1112")
    app.setApplicationName("NewDefectView")
    engine = QQmlApplicationEngine()
    from startup_work_areas import install as install_work_areas
    install_work_areas(engine, app)
    from project_resource_monitor import install as install_resource_monitor
    install_resource_monitor(engine)
    context = engine.rootContext()
    engine.load(os.path.join("qrc:///main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
