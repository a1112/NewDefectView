# This Python file uses the following encoding: utf-8

import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


from qml_rc import *
import os

os.environ["QML_XHR_ALLOW_FILE_READ"] = "1"


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    context = engine.rootContext()
    engine.load(os.path.join("qrc:///main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
