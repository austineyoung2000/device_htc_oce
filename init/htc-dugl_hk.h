static bool is_variant_duglhk(std::string bootcid) {
    if (bootcid == "HTC__622") return true;
    return false;
}

static const char *htc_duglhk_properties =
        "ro.build.product=htc_ocedugl\n"
        "ro.product.model=U Ultra\n"
        "ro.telephony.ipv6_capability=1\n"
        "ro.ril.enable.pre_r8fd=1\n"
        "ro.ril.pdpnumber.policy.roaming=3\n"
        "ro.ril.hsxpa=5\n"
        "ro.ril.hsdpa.category=24\n"
        "ro.ril.hsupa.category=6\n"
        "ro.ril.disable.cpc=0\n"
        "persist.vendor.radio.fill_eons=1\n"
        "persist.radio.NETWORK_SWITCH=2\n"
        "persist.rild.nitz_plmn=\n"
        "persist.rild.nitz_long_ons_0=\n"
        "persist.rild.nitz_long_ons_1=\n"
        "persist.rild.nitz_long_ons_2=\n"
        "persist.rild.nitz_long_ons_3=\n"
        "persist.rild.nitz_short_ons_0=\n"
        "persist.rild.nitz_short_ons_1=\n"
        "persist.rild.nitz_short_ons_2=\n"
        "persist.rild.nitz_short_ons_3=\n"
        "ril.subscription.types=NV,RUIM\n"
        "telephony.lteOnCdmaDevice=1\n"
        "persist.radio.apm_sim_not_pwdn=1\n"
        "persist.vendor.radio.apm_sim_not_pwdn=1\n"
        "persist.vendor.radio.apm_mdm_not_pwdn=1\n"
        "persist.vendor.radio.cs_srv_type=1\n"
        "persist.vendor.radio.sw_mbn_update=1\n"
        "persist.vendor.radio.snapshot_timer=0\n"
        "persist.vendor.radio.data_ltd_sys_ind=1\n"
        "ro.telephony.default_network=9\n"
        "persist.vendor.radio.sap_silent_pin=1\n"
        "ril.htc.multisim.cfg=dsds\n"
        "persist.radio.multisim.config=dsds\n"
        "persist.nfc.smartcard.config=SIM1,SIM2,eSE1\n"
;
