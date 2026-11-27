package com.ayman.speardash;

import net.fabricmc.api.ClientModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SpearDashClientMod implements ClientModInitializer {
    public static final String MOD_ID = "spear_dash_mod";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    @Override
    public void onInitializeClient() {
        LOGGER.info("Spear Dash Mod initialized on client.");
    }
}
