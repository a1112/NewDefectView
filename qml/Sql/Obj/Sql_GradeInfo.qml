import QtQuick 2.15

Item {
    /*
    ID = Column(Integer, Identity(start=1, increment=1), primary_key=True)
    SequeceNo = Column(Integer, nullable=False, unique=True)
    SteelName = Column(String(50, 'Chinese_PRC_CI_AS'), nullable=False)
    DetectTime = Column(DateTime, nullable=False)
    SteelUse = Column(String(50, 'Chinese_PRC_CI_AS'), nullable=False)
    SteelType = Column(String(50, 'Chinese_PRC_CI_AS'), nullable=False)
    Grade = Column(TINYINT, nullable=False)
    Quality = Column(String(10, 'Chinese_PRC_CI_AS'), nullable=False)
    DscTop = Column(Unicode)
    DscBot = Column(Unicode)
*/

    property bool isNull: false
    property int id_
    property int sequeceNo
    property string steelName
    property string steelUse
    property string steelType
    property int grade
    property string quality
    property string dscTop
    property string dscBot


    function init_sql(defect){
        if (defect){
            isNull=false
            id_=defect.ID
            sequeceNo=defect.SequeceNo
            steelName=defect.SteelName
            steelUse=defect.SteelUse
            steelType=defect.SteelType
            grade=defect.Grade
            quality=defect.Quality
            dscTop=defect.DscTop
            dscBot=defect.DscBot


        }
        else{
            isNull=true
        }

    }
}
