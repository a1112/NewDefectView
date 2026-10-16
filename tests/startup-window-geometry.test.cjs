// Execute the production QML placement function with isolated logical-pixel monitor fixtures.
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const assert = require('node:assert/strict');
const sources = ["main.qml"];
for (const relative of sources) {
    const source = fs.readFileSync(path.join(__dirname, '..', relative), 'utf8');
    const begin = source.indexOf('    function fitStartupGeometry(');
    const end = source.indexOf('    property var startupWorkAreaSnapshot:', begin);
    assert(begin >= 0 && end > begin, relative);
    const primary = {virtualX:0, virtualY:0, width:1440, height:900, desktopAvailableWidth:1440, desktopAvailableHeight:850};
    const secondary = {virtualX:-1280, virtualY:100, width:1280, height:800, desktopAvailableWidth:1280, desktopAvailableHeight:760};
    const primaryArea = {screenX:0,screenY:0,screenWidth:1440,screenHeight:900,x:0,y:25,width:1440,height:850};
    const secondaryArea = {screenX:-1280,screenY:100,screenWidth:1280,screenHeight:800,x:-1280,y:120,width:1280,height:760};
    const state = {Qt:{application:{screens:[primary, secondary]}}, screen:primary, x:0,y:0,width:1100,height:720,minimumWidth:0,minimumHeight:0,
        startupWorkAreas:[primaryArea, secondaryArea],
        startupGeometry:{savedX:-100000,savedY:-100000,savedWidth:0,savedHeight:0}};
    vm.createContext(state);
    vm.runInContext(source.substring(begin, end), state);
    const fit = (x,y,width,height) => {
        state.startupGeometry = {savedX:x,savedY:y,savedWidth:width,savedHeight:height};
        state.fitStartupGeometry(true);
        return [state.x,state.y,state.width,state.height];
    };
    state.fitStartupGeometry(true);
    assert(state.width < 1440 && state.height < 850 && state.x > 0 && state.y > 25);
    assert.deepEqual(fit(-1200,150,900,600),[-1200,150,900,600]);
    assert.deepEqual(fit(100,100,640,400),[100,100,640,400]);
    assert(state.minimumWidth <= 640 && state.minimumHeight <= 400);
    assert.deepEqual(fit(10,30,100,100),[10,30,100,100]);
    state.Qt.application.screens = [primary]; state.screen = primary;
    fit(-1200,150,900,600); assert(state.width===900 && state.height===600 && state.x>=0 && state.y>=25);
    fit(5000,5000,3000,2000); assert(state.x+state.width<=1440 && state.y+state.height<=875);
    const small = {virtualX:0,virtualY:0,width:800,height:600,desktopAvailableWidth:800,desktopAvailableHeight:560};
    state.Qt.application.screens=[small]; state.screen=small;
    state.startupWorkAreas=[{screenX:0,screenY:0,screenWidth:800,screenHeight:600,x:0,y:20,width:800,height:560}];
    fit(5000,5000,3000,2000); assert(state.width<=752 && state.height<=496 && state.minimumWidth<=752 && state.minimumHeight<=496);
    state.Qt.application.screens=[primary]; state.screen=primary;
    state.startupWorkAreas=[{...primaryArea,x:120,y:90,width:1320,height:810}];
    fit(0,10,640,400); assert(state.x>=120 && state.y>=90 && state.width===640 && state.height===400);
    assert.deepEqual(fit(130,100,640,400),[130,100,640,400]);
    for (const scale of [1, 2]) {
        for (const [width, height] of [[800,560],[1280,747],[1470,833],[1920,1040]]) {
            const logical = {virtualX:0,virtualY:0,width:width*scale/scale,height:height*scale/scale+25};
            state.Qt.application.screens=[logical]; state.screen=logical;
            state.startupWorkAreas=[{screenX:0,screenY:0,screenWidth:logical.width,screenHeight:logical.height,x:0,y:25,width,height}];
            fit(-100000,-100000,0,0);
            assert(state.width <= (width-48)*0.82 && state.height <= (height-64)*0.82);
            assert(state.minimumWidth <= state.width && state.minimumHeight <= state.height);
            assert(state.x>=24 && state.y>=57 && state.x+state.width<=width-24 && state.y+state.height<=height+25-32);
        }
    }
    console.log(relative + ': 17 geometry scenarios passed');
}
