#include <amxmodx>
#include <fakemeta>

#define PLUGIN_VERSION "1.0"

new g_pBlockClick
new bool:g_bBlockClick

public plugin_init()
{
	register_plugin("Block Use Sound", PLUGIN_VERSION, "OciXCrom")
	register_cvar("@CRXBlockUseSound", PLUGIN_VERSION, FCVAR_SERVER|FCVAR_SPONLY|FCVAR_UNLOGGED)
	register_forward(FM_EmitSound, "OnEmitSound")
	g_pBlockClick = register_cvar("nouse_block_click", "0")
}

public plugin_cfg()
	g_bBlockClick = bool:get_pcvar_num(g_pBlockClick)

public OnEmitSound(id, iChannel, szSound[])
	return equal(szSound, "common/wpn_denyselect.wav") || (g_bBlockClick && equal(szSound, "common/wpn_select.wav")) ? FMRES_SUPERCEDE : FMRES_IGNORED