class CfgVehicles {
     class Bag_Base;
     class Grad_APOBS_F: Bag_Base {
         class ACE_Actions {
             class ACE_MainActions {
               class GVAR(openApobs) {
                   displayName = CSTRING(openApobs);
                   condition = QUOTE({[ARR_2(_player,_target)] call FUNC(canInteract) == 0} && !{_target getVariable [QGVAR(isOpen),false]});
                   statement = QUOTE([_target] call FUNC(openApobs));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(closeApobs) {
                   displayName = CSTRING(closeApobs);
                   condition = QUOTE({[ARR_2(_player,_target)] call FUNC(canInteract) == 0} && {_target getVariable [QGVAR(isOpen),false]});
                   statement = QUOTE([_target] call FUNC(closeApobs));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(connectApobs) {
                   displayName = CSTRING(connectApobs);
                   condition = QUOTE({[_target] call FUNC(canConnect)});
                   statement = QUOTE([ARR_2(_player,_target)] call FUNC(connect));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(disconnectApobs) {
                   displayName = CSTRING(disconnectApobs);
                   condition = QUOTE(!{[_player] call FUNC(canConnect)});
                   statement = QUOTE([ARR_2(_player,_target)] call FUNC(disconnect));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(setUpRocket) {
                   displayName = CSTRING(setUpRocket);
                   condition = QUOTE([_target] call FUNC(canSetUpRocket));
                   statement = QUOTE([_target] call FUNC(setUpRocket));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(dismantleRocket) {
                   displayName = CSTRING(dismantleRocket);
                   condition = QUOTE([_target] call FUNC(canSetUpRocket));
                   statement = QUOTE([_target] call FUNC(setUpRocket));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(connectRocket) {
                   displayName = CSTRING(connectRocket);
                   condition = QUOTE([_target] call FUNC(canConnectRocket));
                   statement = QUOTE([_target] call FUNC(connectRocket));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(disconnectRocket) {
                   displayName = CSTRING(disconnectRocket);
                   condition = QUOTE([_target] call FUNC(canConnectRocket));
                   statement = QUOTE([_target] call FUNC(connectRocket));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(connectFiringDevice) {
                   displayName = CSTRING(connectFiringDevice);
                   condition = QUOTE({[_player] call ACE_Explosives_fnc_getDetonators >= 1});
                   statement = QUOTE([_target] call FUNC(status));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
            };
        };
    };
    class GRAD_APOBS_R: Bag_Base {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(openApobs) {
                    displayName = CSTRING(openApobs);
                    condition = QUOTE({[ARR_2(_player,_target)] call FUNC(canInteract) == 0} && !{_target getVariable [QGVAR(isOpen),false]});
                    statement = QUOTE([_target] call FUNC(openApobs));
                    showDisabled = 0;
                    priority = -1;
                    //icon = QPATHTOF(uigunbag_icon_ca.paa);
                };
                class GVAR(closeApobs) {
                    displayName = CSTRING(closeApobs);
                    condition = QUOTE({[ARR_2(_player,_target)] call FUNC(canInteract) == 0} && {_target getVariable [QGVAR(isOpen),false]});
                    statement = QUOTE([_target] call FUNC(closeApobs));
                    showDisabled = 0;
                    priority = -1;
                    //icon = QPATHTOF(uigunbag_icon_ca.paa);
                };
                class GVAR(assembleParachute) {
                    displayName = CSTRING(assembleParachute);
                    condition = QUOTE(!{[_target] call FUNC(canAssembleParachute)});
                    statement = QUOTE([_target] call FUNC(assembleParachute));
                    showDisabled = 0;
                    priority = -1;
                    //icon = QPATHTOF(uigunbag_icon_ca.paa);
                };
                class GVAR(disassembleParachute) {
                    displayName = CSTRING(disassembleParachute);
                    condition = QUOTE(!{[_target] call FUNC(canAssembleParachute)});
                    statement = QUOTE([_target] call FUNC(disassembleParachute));
                    showDisabled = 0;
                    priority = -1;
                    //icon = QPATHTOF(uigunbag_icon_ca.paa);
                };
            };
        };
    };

    class Grad_APOBS_Connector_F {
      class GVAR(PickUpConnector) {
                displayName = CSTRING(TakeNozzle);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeConnector));
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeConnector));
               // icon = QPATHTOF(uiicon_refuel_interact.paa);
            };
            class GVAR(Disconnect) {
                displayName = CSTRING(Disconnect);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canDisconnect));
                statement = QUOTE([ARR_2(_player,_target)] call DFUNC(disconnect));
               // icon = QPATHTOF(uiicon_refuel_interact.paa);
};
    };
};
