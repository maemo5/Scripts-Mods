      class Loot: ExileAbstractAction
            {
                title = "Loot Vehicle";
                condition = "(!(alive (ExileClientInteractionObject)))";
                action = "_this spawn ExileClient_object_container_pack";
            };