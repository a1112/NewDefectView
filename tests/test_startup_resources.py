"""The small Qt5-compatible Python resource overlay must contain the edited entry."""
import ast
from pathlib import Path
import unittest

class StartupResourceTests(unittest.TestCase):
    def test_qrc_overlay_embeds_current_main_qml(self):
        root = Path(__file__).resolve().parents[1]
        tree = ast.parse((root / "startup_geometry_resources.py").read_text())
        data = next(ast.literal_eval(node.value) for node in tree.body
                    if isinstance(node, ast.Assign) and any(isinstance(t, ast.Name) and t.id == "qt_resource_data" for t in node.targets))
        size = int.from_bytes(data[:4], "big")
        self.assertEqual(data[4:4+size], (root / "main.qml").read_bytes())
        entry = (root / "main.py").read_text()
        self.assertLess(entry.index("import startup_geometry_resources"), entry.index("from qml_rc import"))
        self.assertIn('engine.load(os.path.join("qrc:///main.qml"))', entry)

if __name__ == "__main__":
    unittest.main()
