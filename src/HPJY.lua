--和平精英
local pubg = {}

local mouse = {}



------------------------------------------------------------------------------------------------------------------------

--- 常用按键定义区域

------------------------------------------------------------------------------------------------------------------------

mouse.BUTTON_NIL        = 0 --> 无

mouse.BUTTON_LEFT       = 1 --> 鼠标左键

mouse.BUTTON_RIGHT      = 2 --> 鼠标右键

mouse.BUTTON_MID        = 3 --> 鼠标中键

mouse.BUTTON_FORWARD    = 4 --> 鼠标前进键

mouse.BUTTON_BACK       = 5 --> 鼠标后退键

mouse.BUTTON_G          = 6 --> 鼠标G键

mouse.BUTTON_EXT_1      = 7 --> 鼠标左键旁后键

mouse.BUTTON_EXT_2      = 8 --> 鼠标左键旁前键

mouse.BUTTON_VIRTUAL_1  = 1 --> 鼠标虚拟按键1

mouse.BUTTON_VIRTUAL_2  = 2 --> 鼠标虚拟按键2

mouse.BUTTON_VIRTUAL_3  = 3 --> 鼠标虚拟按键3

mouse.isDebug           = true



function mouse:outputLogMessage (message)

    if self.isDebug == true then

        OutputLogMessage(message .. '\n')

    end

end



------------------------------------------------------------------------------------------------------------------------

--- 快捷键配置

------------------------------------------------------------------------------------------------------------------------

pubg.keyShutdown    = mouse.BUTTON_G

pubg.keyWeaponAkm   = mouse.BUTTON_MID

pubg.keyWeaponM416  = mouse.BUTTON_BACK

pubg.keyWeaponM16a4 = mouse.BUTTON_FORWARD

pubg.keyWeaponQbz   = mouse.BUTTON_NIL

pubg.keyWeaponUmp9  = mouse.BUTTON_NIL

pubg.keyWeaponUzi   = mouse.BUTTON_NIL

pubg.keyScopeX1     = mouse.BUTTON_NIL

pubg.keyScopeX2     = mouse.BUTTON_NIL

pubg.keyScopeX3     = mouse.BUTTON_NIL

pubg.keyScopeX4     = mouse.BUTTON_NIL

pubg.keyScopeX6     = mouse.BUTTON_NIL

pubg.keyScopeX8     = mouse.BUTTON_NIL

pubg.keyDropItem    = mouse.BUTTON_EXT_2



------------------------------------------------------------------------------------------------------------------------

--- 运行变量区域

------------------------------------------------------------------------------------------------------------------------

pubg.currentWeapon      = 'NIL'         --> 当前武器：NIL、AKM、M416、M16A4、QBZ、UMP9、UZI

pubg.currentScope       = 'SCOPE_X1'    --> 当前倍镜：SCOPE_X1、SCOPE_X2、SCOPE_X3、SCOPE_X4、SCOPE_X6、SCOPE_X8

pubg.currentIncrement   = 0             --> 当前偏移：0

pubg.isGKeyPressed      = false         --> 鼠标G键是否被按下

pubg.isOKeyPressed      = false         --> 其他按键是否被按下

pubg.isMousePressed     = false         --> 鼠标左键是否按下

pubg.currentWeaponIndex = 0             --> 当前武器压枪偏移

------------------------------------------------------------------------------------------------------------------------

--- 压枪数据

------------------------------------------------------------------------------------------------------------------------

pubg.weaponData = {

    AKM = {

        SHOOT_AUTO      = true,

        SHOOT_INTERVAL  = 30,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {02,04,02,01,01,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, },

        SCOPE_X2 = {03,03,02,02,02,02,03,03,03,03, 03,02,03,02,02,02,03,03,02,03, 03,03,02,02,02,03,02,02,02,02, 03,03,03,03,03,03,03,03,03,03, 03,03,03,03,03,03,03,03,03,03, 03,03,03,03,03,03,03,03,03,03, 03,02,02,03,02,03,03,02,03,02, 03,02,03,03,03,02,02,02,02,02, 02,02,02,02,02,03,03,03,03,02, 02,02,02,03,03,02,03,02,03,03, },

        SCOPE_X3 = {04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, 04,04,04,04,04,04,04,04,04,04, },

        SCOPE_X4 = {05,07,07,07,07,07,07,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 07,07,07,07,07,07,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, 05,05,05,05,05,05,05,05,05,05, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

    M416 = {

        SHOOT_AUTO      = true,

        SHOOT_INTERVAL  = 20,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,00,00,00,01,01,01, 01,00,01,00,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, },

        SCOPE_X2 = {01,01,01,01,01,01,01,02,01,02, 01,01,01,02,02,01,02,01,02,01, 02,01,02,02,02,02,01,01,02,01, 02,01,02,02,02,01,01,02,01,02, 01,02,02,01,01,01,02,01,01,01, 01,01,02,02,02,01,02,01,02,01, 01,02,02,01,02,02,01,02,02,02, 02,01,01,02,02,01,02,02,02,02, 01,02,02,02,01,01,01,01,02,01, 02,02,02,02,02,01,02,01,01,02, },

        SCOPE_X3 = {04,04,04,04,03,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, 02,02,02,02,02,02,02,02,02,02, },

        SCOPE_X4 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

    M16A4 = {

        SHOOT_AUTO      = false,

        SHOOT_INTERVAL  = 50,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,00,00,00,01,01,01, 01,00,01,00,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, 01,01,01,01,01,01,01,01,01,01, },

        SCOPE_X2 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X3 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X4 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

    QBZ = {

        SHOOT_AUTO      = true,

        SHOOT_INTERVAL  = 20,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X2 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X3 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X4 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

    UMP9 = {

        SHOOT_AUTO      = true,

        SHOOT_INTERVAL  = 20,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X2 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X3 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X4 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

    UZI = {

        SHOOT_AUTO      = true,

        SHOOT_INTERVAL  = 20,

        ------------------------10-----------------------------20-----------------------------30-----------------------------40-----------------------------50-----------------------------60-----------------------------70-----------------------------80-----------------------------90-----------------------------100----------------

        SCOPE_X1 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X2 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X3 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X4 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X6 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

        SCOPE_X8 = {01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, 01,01,01,01,05,01,01,01,01,01, },

    },

}



------------------------------------------------------------------------------------------------------------------------

--- 对抗单发枪支

------------------------------------------------------------------------------------------------------------------------

function pubg:antiShootSingle(event, arg, family)

    PressMouseButton(mouse.BUTTON_LEFT)

    Sleep(self.weaponData[self.currentWeapon]['SHOOT_INTERVAL'])



    self.currentWeaponIndex = self.currentWeaponIndex + 1

    if self.currentWeaponIndex >= # self.weaponData[self.currentWeapon][self.currentScope] then

        self.currentWeaponIndex = 1

    end





    local currentMouseRelativeX = 0

    local currentMouseRelativeY = self.weaponData[self.currentWeapon][self.currentScope][self.currentWeaponIndex] + self.currentIncrement

    MoveMouseRelative(currentMouseRelativeX, currentMouseRelativeY)

    mouse:outputLogMessage('weapon:'..self.currentWeapon..' scope:'..self.currentScope..' index='..self.currentWeaponIndex..' increment:'..self.currentIncrement..' relative:'..currentMouseRelativeY)

    ReleaseMouseButton(mouse.BUTTON_LEFT)



    if self.isMousePressed == true then

        SetMKeyState(mouse.BUTTON_VIRTUAL_3)

    end

end



------------------------------------------------------------------------------------------------------------------------

--- 对抗连发枪支

------------------------------------------------------------------------------------------------------------------------

function pubg:antiShootAuto(event, arg, family)

    local currentWeaponIndex = 0

    local currentScope       = self.currentScope

    repeat

        Sleep(self.weaponData[self.currentWeapon]['SHOOT_INTERVAL'])



        currentWeaponIndex = currentWeaponIndex + 1

        if currentWeaponIndex >= # self.weaponData[self.currentWeapon][currentScope] then

            currentWeaponIndex = 1

        end



        if IsKeyLockOn('capslock') then

            if currentScope == 'SCOPE_X1' then

                currentScope = 'SCOPE_X2'

            end

        end



        local currentMouseRelativeX = 0

        local currentMouseRelativeY = self.weaponData[self.currentWeapon][currentScope][currentWeaponIndex] + self.currentIncrement

        MoveMouseRelative(currentMouseRelativeX, currentMouseRelativeY)

        mouse:outputLogMessage('weapon:'..self.currentWeapon..' scope:'..currentScope..' index='..currentWeaponIndex..' increment:'..self.currentIncrement..' relative:'..currentMouseRelativeY)

    until not IsMouseButtonPressed(mouse.BUTTON_LEFT)

end



------------------------------------------------------------------------------------------------------------------------

--- 关闭压枪

------------------------------------------------------------------------------------------------------------------------

function pubg:antiShutdown(event, arg, family)

    pubg.currentWeapon = 'NIL'

    mouse:outputLogMessage('anti shutdown')

end



------------------------------------------------------------------------------------------------------------------------

--- 丢弃物品

------------------------------------------------------------------------------------------------------------------------

function pubg:dropItem(event, arg, family)

    local currentMouseX, currentMouseY = GetMousePosition()

    PressMouseButton(1)

    for i = 1, 15 do

        MoveMouseRelative(-100, 0)

        Sleep(2)

    end

    ReleaseMouseButton(1)

    Sleep(50)

    MoveMouseTo(currentMouseX, currentMouseY)

end



------------------------------------------------------------------------------------------------------------------------

--- 核心逻辑区域

------------------------------------------------------------------------------------------------------------------------

function pubg:onEvent(event, arg, family)

    --mouse:outputLogMessage('event='..tostring(event)..', arg='..tostring(arg)..', family='..tostring(family))

    if event == 'PROFILE_ACTIVATED' then

        EnablePrimaryMouseButtonEvents(true)

    elseif event == 'PROFILE_DEACTIVATED' then

        EnablePrimaryMouseButtonEvents(false)

        return

    end



    if event == 'MOUSE_BUTTON_PRESSED' and arg == mouse.BUTTON_G then

        self.isGKeyPressed = true

        self.isOKeyPressed = false

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == mouse.BUTTON_G then

        self.isGKeyPressed = false

    end



    if event == 'MOUSE_BUTTON_PRESSED' and arg ~= mouse.BUTTON_G then

        self.isOKeyPressed = true

    end



    if self.isGKeyPressed == true and self.isOKeyPressed == false then

        self:antiShutdown(event, arg, family)

    end



    if event == 'MOUSE_BUTTON_PRESSED' and arg == mouse.BUTTON_LEFT and self.isGKeyPressed == false then

        self.isMousePressed = true

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == mouse.BUTTON_LEFT then

        self.isMousePressed = false

    end



    if event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponAkm and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'AKM'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyDropItem and self.isGKeyPressed == false then

		mouse.outputLogMessage('dropItem')

        self:dropItem(event, arg, family)

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponM416  and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'M416'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponM16a4 and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'M16A4'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponQbz   and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'QBZ'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponUmp9  and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'UMP9'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyWeaponUzi   and self.isGKeyPressed == false then

        self.currentScope  = 'SCOPE_X1'

        self.currentWeapon = 'UZI'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX1 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X1'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX2 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X2'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX3 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X3'

        if self.currentWeapon == 'NIL' then

            self.currentWeapon = 'M416'

        end

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX4 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X4'

        if self.currentWeapon == 'NIL' then

            self.currentWeapon = 'M416'

        end

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX6 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X6'

    elseif event == 'MOUSE_BUTTON_RELEASED' and arg == self.keyScopeX8 and self.isGKeyPressed == false then

        self.currentScope = 'SCOPE_X8'

    end



    if event == 'M_RELEASED' and arg == mouse.BUTTON_VIRTUAL_3 then

        self:antiShootSingle(event, arg, family)

    end



    if event == 'MOUSE_BUTTON_PRESSED' and arg == mouse.BUTTON_LEFT and self.currentWeapon ~= 'NIL' then

        mouse.outputLogMessage('current weapon: ' .. self.currentWeapon)



        if self.weaponData[self.currentWeapon]['SHOOT_AUTO'] == true then

            self:antiShootAuto(event, arg, family)

        else

            self.currentWeaponIndex = 0

            self:antiShootSingle(event, arg, family)

        end

    end

end





------------------------------------------------------------------------------------------------------------------------

--- 入口函数

------------------------------------------------------------------------------------------------------------------------

function OnEvent(event, arg, family)

    pubg:onEvent(event, arg, family)

end