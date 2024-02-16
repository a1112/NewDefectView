import QtQuick 2.15
import Os 1.0
Item {
Os{
id:os
}

function system(url){
    return os.system(url)
}
function moveFile(source,destination){
    source = source.replace("file:///","")
    destination = destination.replace("file:///","")
    return os.moveFile(source,destination)
}
}
