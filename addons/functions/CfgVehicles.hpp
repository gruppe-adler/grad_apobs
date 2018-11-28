class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_SelfActions {
      class ACE_Equipment {
        class GVAR(dropApobs) {
        displayName = CSTRING(dropApobs);
        condition = QUOTE((backpack _player) in [QUOTE(QUOTE(Grad_APOBS_Frontpack)), QUOTE(QUOTE(Grad_APOBS_Rearpack))]);
        statement = QUOTE([ARR_2(_player,_target)] call FUNC(dropApobs));
        showDisabled = 0;
        //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
        };
      };
    };
  };

  class ThingX;
  class Grad_APOBS_Frontpack_closed: ThingX {
    class connectorLength {
      typeName = "NUMBER";
       defaultValue = 6;
    };
    class ACE_Actions {
      class ACE_MainActions {
        selection = "interaction_point";
        distance = 5;
        condition = QUOTE(alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith});
        class GVAR(openApobs) {
          selection = "";
          displayName = CSTRING(openApobs);
          condition = QUOTE(_target getVariable [QUOTE(QGVAR(isClosed)),true]);
          statement = QUOTE([_target] call FUNC(openApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(closeApobs) {
          selection = "";
          displayName = CSTRING(closeApobs);
          condition = QUOTE([_target] call FUNC(canClose));
          statement = QUOTE([_target] call FUNC(closeApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(takeApobs) {
          selection = "";
          displayName = CSTRING(takeApobs);
          condition = QUOTE((_target getVariable [QUOTE(QGVAR(isClosed)),true]));
          statement = QUOTE([_player, _target] call FUNC(takeApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(connectApobs) {
          selection = "";
          displayName = CSTRING(connectApobs);
          condition = QUOTE([_target] call FUNC(canConnect));
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(connect));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(returnConnector) {
          selection = "";
          displayName = CSTRING(returnConnector);
          condition = QUOTE([ARR_2(_player,_target)] call FUNC(canReturnConnector));
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(returnConnector));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(setUpRocket) {
          selection = "";
          displayName = CSTRING(setUpRocket);
          condition = QUOTE([_target] call FUNC(canSetUpRocket));
          statement = QUOTE([_target] call FUNC(setUpRocket));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(dismantleRocket) {
          selection = "";
          displayName = CSTRING(dismantleRocket);
          condition = QUOTE([_target] call FUNC(canDismantleRocket));
          statement = QUOTE([_target] call FUNC(setUpRocket));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(connectRocket) {
          selection = "";
          displayName = CSTRING(connectRocket);
          condition = QUOTE([_target] call FUNC(canConnectRocket));
          statement = QUOTE([_target] call FUNC(connectRocket));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(disconnectRocket) {
          selection = "";
          displayName = CSTRING(disconnectRocket);
          condition = QUOTE([_target] call FUNC(canDisconnectRocket));
          statement = QUOTE([_target] call FUNC(disconnectRocket));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(pullFiringSafety) {
          selection = "";
          displayName = CSTRING(pullSafetyPin);
          condition = QUOTE([_target] call FUNC(canPullFiringSafety));
          statement = QUOTE([_target] call FUNC(pullFiringSafety));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(returnFiringSafety) {
          selection = "";
          displayName = CSTRING(returnSafetyPin);
          condition = QUOTE([_target] call FUNC(canReturnFiringSafety));
          statement = QUOTE([_target] call FUNC(returnFiringSafety));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(pullFiringPin) {
          selection = "";
          displayName = CSTRING(pullFiringPin);
          condition = QUOTE([_target] call FUNC(canPullFiringPin));
          statement = QUOTE([_target] call FUNC(pullFiringPin));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
      };
    };
  };

  class Grad_APOBS_Rearpack_closed: ThingX {
    GVAR(canReceive) = 1;
    class ACE_Actions {
      class ACE_MainActions {
        selection = "interaction_point";
        distance = 5;
        condition = QUOTE(alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith});
        class GVAR(openApobs) {
          selection = "";
          displayName = CSTRING(openApobs);
          condition = QUOTE(_target getVariable [QUOTE(QGVAR(isClosed)),true]);
          statement = QUOTE([_target] call FUNC(openApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(closeApobs) {
          selection = "";
          displayName = CSTRING(closeApobs);
          condition = QUOTE([_target] call FUNC(canClose));
          statement = QUOTE([_target] call FUNC(closeApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(takeApobs) {
          selection = "";
          displayName = CSTRING(takeApobs);
          condition = QUOTE((_target getVariable [QUOTE(QGVAR(isClosed)),true]));
          statement = QUOTE([_target] call FUNC(takeApobs));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(assembleParachute) {
          displayName = CSTRING(assembleParachute);
          condition = QUOTE([_target] call FUNC(canAssembleParachute));
          statement = QUOTE([_target] call FUNC(assembleParachute));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(disassembleParachute) {
          displayName = CSTRING(disassembleParachute);
          condition = QUOTE([_target] call FUNC(canDisassembleParachute));
          statement = QUOTE([_target] call FUNC(disassembleParachute));
          showDisabled = 0;
          priority = -1;
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
        class GVAR(disconnectConnector) {
          displayName = CSTRING(disconnectConnector);
          condition = QUOTE([_target] call FUNC(canDisconnect));
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(disconnect));
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
      };
    };
  };
  class Grad_APOBS_Connector: ThingX {
    class ACE_Actions {
      class ACE_MainActions {
        selection = "interaction_point";
        distance = 5;
        condition = QUOTE(alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith});
        class GVAR(pickUpConnector) {
          displayName = CSTRING(pickUpConnector);
          condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeConnector));
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeConnector));
          //icon = QPATHTOF(uigunbag_icon_ca.paa);
        };
      };
    };
  };
};
