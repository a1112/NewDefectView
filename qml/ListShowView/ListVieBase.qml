import QtQuick 2.15

ListView {
    remove : Transition{
        NumberAnimation{properties: "x";from:0;to:220;duration: 200 }
        NumberAnimation{properties: "opacity";from:1;to:0;duration: 200 }
        NumberAnimation{properties: "height";to:0;duration: 200 }
    }


    removeDisplaced : Transition{
        NumberAnimation { properties: "x,y"; duration: 200;  }
    }

    add : Transition{
        NumberAnimation{ properties: "x";from:400;to:0;duration: 200 }
        NumberAnimation{properties: "opacity";from:0;to:1;duration: 200 }
        NumberAnimation{properties: "scale";from:0;to:1; duration: 200 }
    }
    addDisplaced : Transition{
        NumberAnimation { properties: "x,y"; duration: 220;  }
    }
//        displaced : Transition{
//            NumberAnimation{property: "scale";from:0;to:1;duration: 400 }
//            }
    populate : Transition{
        id:popTra
        NumberAnimation{properties: "x";from:220;to:0;duration: (200+popTra.ViewTransition.index*20)>1000?1000:200+popTra.ViewTransition.index*20 }
        NumberAnimation{properties: "opacity";from:0;to:1;duration: 300 }
    }
}
