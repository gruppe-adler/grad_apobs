class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(placeApobs) {
                    displayName = CSTRING(placeApobs);
                    condition = QUOTE((backpack _player) in [ARR_2('Grad_APOBS_Frontpack', 'Grad_APOBS_Rearpack')]);
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(placeApobs));
                    showDisabled = 0;
                };
            };
        };
    };

    class Land_Camping_Light_F;
    class Grad_APOBS_Frontpack_closed: Land_Camping_Light_F {

        class Attributes {
            class GVAR(openApobs) {
                control = "CheckboxNumber";
                defaultValue = "0";
                displayName = CSTRING(openApobs);
                tooltip = CSTRING(openApobs_Tooltip);
                expression = QUOTE([_this] call FUNC(openApobs));
                property = QGVAR(openApobs);
            };
            class GVAR(setUpRocket) {
                control = "CheckboxNumber";
                defaultValue = "0";
                displayName = CSTRING(setUpRocket);
                tooltip = CSTRING(setUpRocket_Tooltip);
                expression = QUOTE([_this] call FUNC(setUpRocket));
                property = QGVAR(setUpRocket);
            };
        };

        class connectorLength {
            typeName = "NUMBER";
            defaultValue = 6;
        };
        class ACE_Actions {
            class ACE_MainActions {
                selection = "interaction_point";
                distance = 5;
                condition = 'alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith}';
                class GVAR(openApobs) {
                    selection = "";
                    displayName = CSTRING(openApobs);
                    condition = QUOTE(_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), true)]);
                    statement = QUOTE([_target] call FUNC(openApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(closeApobs) {
                    selection = "";
                    displayName = CSTRING(closeApobs);
                    condition = QUOTE([_target] call FUNC(canClose));
                    statement = QUOTE([_target] call FUNC(closeApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(takeApobs) {
                    selection = "";
                    displayName = CSTRING(takeApobs);
                    condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), true)]));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(takeApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(connectApobs) {
                    selection = "";
                    displayName = CSTRING(connectApobs);
                    condition = QUOTE([_target] call FUNC(canConnect));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(connect));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(setUpRocket) {
                    selection = "";
                    displayName = CSTRING(setUpRocket);
                    condition = QUOTE([_target] call FUNC(canSetUpRocket));
                    statement = QUOTE([_target] call FUNC(setUpRocket));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(dismantleRocket) {
                    selection = "";
                    displayName = CSTRING(dismantleRocket);
                    condition = QUOTE([_target] call FUNC(canDismantleRocket));
                    statement = QUOTE([_target] call FUNC(disassembleRocket));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(pullFiringSafety) {
                    selection = "";
                    displayName = CSTRING(pullSafetyPin);
                    condition = QUOTE([_target] call FUNC(canPullFiringSafety));
                    statement = QUOTE([_target] call FUNC(pullFiringSafety));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(returnFiringSafety) {
                    selection = "";
                    displayName = CSTRING(returnSafetyPin);
                    condition = QUOTE([_target] call FUNC(canReturnFiringSafety));
                    statement = QUOTE([_target] call FUNC(returnFiringSafety));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(pullFiringPin) {
                    selection = "";
                    displayName = CSTRING(pullFiringPin);
                    condition = QUOTE([_target] call FUNC(canPullFiringPin));
                    statement = QUOTE([_target] call FUNC(pullFiringPin));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(connectRocket) {
                    selection = "";
                    displayName = CSTRING(connectRocket);
                    condition = QUOTE([_target] call FUNC(canConnectRocket));
                    statement = QUOTE([_target] call FUNC(connectRocket));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(disconnectRocket) {
                    selection = "";
                    displayName = CSTRING(disconnectRocket);
                    condition = QUOTE([_target] call FUNC(canDisconnectRocket));
                    statement = QUOTE([_target] call FUNC(disconnectRocket));
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };

    class Grad_APOBS_Rearpack_closed: Land_Camping_Light_F {

        class Attributes {
            class GVAR(openApobs) {
                control = "CheckboxNumber";
                defaultValue = "0";
                displayName = CSTRING(openApobs);
                tooltip = CSTRING(openApobs_Tooltip);
                expression = QUOTE([_this] call FUNC(openApobs));
                property = QGVAR(openApobs);
            };
            class GVAR(assembleParachute) {
                control = "CheckboxNumber";
                defaultValue = "0";
                displayName = CSTRING(assembleParachute);
                tooltip = CSTRING(assembleParachute_Tooltip);
                expression = QUOTE([_this] call FUNC(assembleParachute));
                property = QGVAR(assembleParachute);
            };
        };

        GVAR(canReceive) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "interaction_point";
                distance = 5;
                condition = 'alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith}';
                class GVAR(openApobs) {
                    selection = "";
                    displayName = CSTRING(openApobs);
                    condition = QUOTE(_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), true)]);
                    statement = QUOTE([_target] call FUNC(openApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(closeApobs) {
                    selection = "";
                    displayName = CSTRING(closeApobs);
                    condition = QUOTE([_target] call FUNC(canClose));
                    statement = QUOTE([_target] call FUNC(closeApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(takeApobs) {
                    selection = "";
                    displayName = CSTRING(takeApobs);
                    condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), true)]));
                    statement = QUOTE([_target] call FUNC(takeApobs));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(assembleParachute) {
                    displayName = CSTRING(assembleParachute);
                    condition = QUOTE([_target] call FUNC(canAssembleParachute));
                    statement = QUOTE([_target] call FUNC(assembleParachute));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(disassembleParachute) {
                    displayName = CSTRING(disassembleParachute);
                    condition = QUOTE([_target] call FUNC(canDisassembleParachute));
                    statement = QUOTE([_target] call FUNC(disassembleParachute));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(disconnectConnector) {
                    displayName = CSTRING(disconnectConnector);
                    condition = QUOTE([_target] call FUNC(canDisconnect));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(disconnect));
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };

    class ThingX;
    class Grad_APOBS_Connector: ThingX {
        class ACE_Actions {
            class ACE_MainActions {
                selection = "interaction_point";
                distance = 5;
                condition = 'alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith}';
                class GVAR(pickUpConnector) {
                    displayName = CSTRING(pickUpConnector);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeConnector));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeConnector));
                };
            };
        };
    };
    class Land_Camping_Light_F;
    class Grad_APOBS_Rocket: Land_Camping_Light_F {
        class ACE_Actions {
            class ACE_MainActions {
                selection = "interaction_point";
                distance = 5;
                condition = 'alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith}';
            };
        };
    };
};
