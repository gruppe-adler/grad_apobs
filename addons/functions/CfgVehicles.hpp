class CfgVehicles {
       class Bag_Base;
       class Grad_APOBS_F: Bag_Base {
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
               condition = QUOTE({[ARR_2(_player,_target)] call FUNC(canInteract) == 0} && {[_target] call FUNC(canClose)});
               statement = QUOTE([_target] call FUNC(closeApobs));
               showDisabled = 0;
               priority = -1;
               //icon = QPATHTOF(uigunbag_icon_ca.paa);
           };
        };
     class Grad_APOBS_R: Grad_APOBS_F {};
     class ThingX;
     class Grad_APOBS_Open_F: ThingX {
         class ACE_Actions {
             class ACE_MainActions {
               class GVAR(connectApobs) {
                   displayName = CSTRING(connectApobs);
                   condition = QUOTE({[_target] call FUNC(canConnect)});
                   statement = QUOTE([ARR_2(_player,_target)] call FUNC(connect));
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
                   condition = QUOTE([_target] call FUNC(canDisonnectRocket));
                   statement = QUOTE([_target] call FUNC(disconnectRocket));
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(pullFiringSafety) {
                   displayName = CSTRING(pullSafetyPin);
                   condition = QUOTE({[_target] call FUNC(canPullFiringSafety)});
                   statement = QUOTE({[_target] call FUNC(pullFiringSafety)});
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(returnFiringSafety) {
                   displayName = CSTRING(returnSafetyPin);
                   condition = QUOTE({[_target] call FUNC(canReturnFiringSafety)});
                   statement = QUOTE({[_target] call FUNC(returnFiringSafety)});
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
               class GVAR(pullFiringPin) {
                   displayName = CSTRING(pullFiringPin);
                   condition = QUOTE({_target getVariable [QGVAR(firingSafetyPulled), false])});
                   statement = QUOTE({[_target] call FUNC(pullFiringPin)});
                   showDisabled = 0;
                   priority = -1;
                   //icon = QPATHTOF(uigunbag_icon_ca.paa);
               };
            };
        };
    };
    class GRAD_APOBS_Open_R: ThingX {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(disconnectApobs) {
                    displayName = CSTRING(disconnectApobs);
                    condition = QUOTE(!{[_player] call FUNC(canDisconnect)});
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(disconnect));
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

    class Grad_APOBS_Connector_F: ThingX {
      class GVAR(pickUpConnector) {
         displayName = CSTRING(pickUpConnector);
         condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeConnector));
         statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeConnector));
         //icon = QPATHTOF(uigunbag_icon_ca.paa);
      };
      class GVAR(disconnectConnector) {
         displayName = CSTRING(disconnectConnector);
         condition = QUOTE([ARR_2(_player,_target)] call FUNC(canDisconnect));
         statement = QUOTE([ARR_2(_player,_target)] call DFUNC(disconnect));
         //icon = QPATHTOF(uigunbag_icon_ca.paa);
       };
   };
};
