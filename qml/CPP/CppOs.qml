import QtQuick 2.15
import Os 1.0
Item {
Os{
id:os
}

function system(url){
    console.log(url)
    return os.system(url)

}

}
