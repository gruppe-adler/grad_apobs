class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Deleted_EventHandlers {
  class Grad_APOBS_F {
    deleted = QUOTE(if (isServer) then {_target = _this getVariable [QGVAR(frontpack),objNull]; if !(isNull(_target)) then {_target setVariable [QGVAR(rearpack),objNull,true];};});
  };
  class Grad_APOBS_R {
    deleted = QUOTE(if (isServer) then {_target = _this getVariable [QGVAR(rearpack),objNull]; if !(isNull(_target)) then {_target setVariable [QGVAR(frontpack),objNull,true];};});
  };
};

class Extended_Init_EventHandlers {
    class Grad_APOBS_F {
        init = QUOTE(_this call FUNC(initApobs));
    };
    class Grad_APOBS_R {
        init = QUOTE(_this call FUNC(initApobs));
    };
};
