{
	let a := $zk_system_mimic_call(0xa, 0xb, 0xc, 0xd, 0xe)
	let b := $zk_system_mimic_call_byref(0xa, 0xb, 0xc, 0xd)
}
// ====
// dialect: evm
// ----
