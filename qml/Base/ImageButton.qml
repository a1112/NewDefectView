import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
 ItemDelegate{
     property alias source: effImage.source

     EffectImage{
        id:effImage
         width: parent.width
        height: parent.height

     }

}
