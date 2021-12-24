-----------------------------------
-- The various pipe select boxes

mcl_pipeworks.mcl_pipe_selectboxes = {
	{ -32/64,  -8/64,  -8/64,  8/64,  8/64,  8/64 },
	{ -8/64 ,  -8/64,  -8/64, 32/64,  8/64,  8/64 },
	{ -8/64 , -32/64,  -8/64,  8/64,  8/64,  8/64 },
	{ -8/64 ,  -8/64,  -8/64,  8/64, 32/64,  8/64 },
	{ -8/64 ,  -8/64, -32/64,  8/64,  8/64,  8/64 },
	{ -8/64 ,  -8/64,  -8/64,  8/64,  8/64, 32/64 }
}

-- Tube models

mcl_pipeworks.tube_leftstub = {
	{ -32/64, -9/64, -9/64, 9/64, 9/64, 9/64 },	-- tube segment against -X face
}

mcl_pipeworks.tube_rightstub = {
	{ -9/64, -9/64, -9/64,  32/64, 9/64, 9/64 },	-- tube segment against +X face
}

mcl_pipeworks.tube_bottomstub = {
	{ -9/64, -32/64, -9/64,   9/64, 9/64, 9/64 },	-- tube segment against -Y face
}

mcl_pipeworks.tube_topstub = {
	{ -9/64, -9/64, -9/64,   9/64, 32/64, 9/64 },	-- tube segment against +Y face
}

mcl_pipeworks.tube_frontstub = {
	{ -9/64, -9/64, -32/64,   9/64, 9/64, 9/64 },	-- tube segment against -Z face
}

mcl_pipeworks.tube_backstub = {
	{ -9/64, -9/64, -9/64,   9/64, 9/64, 32/64 },	-- tube segment against +Z face
}

mcl_pipeworks.tube_boxes = {mcl_pipeworks.tube_leftstub, mcl_pipeworks.tube_rightstub, mcl_pipeworks.tube_bottomstub, mcl_pipeworks.tube_topstub, mcl_pipeworks.tube_frontstub, mcl_pipeworks.tube_backstub}

mcl_pipeworks.tube_selectboxes = {
	{ -32/64,  -10/64,  -10/64,  10/64,  10/64,  10/64 },
	{ -10/64 ,  -10/64,  -10/64, 32/64,  10/64,  10/64 },
	{ -10/64 , -32/64,  -10/64,  10/64,  10/64,  10/64 },
	{ -10/64 ,  -10/64,  -10/64,  10/64, 32/64,  10/64 },
	{ -10/64 ,  -10/64, -32/64,  10/64,  10/64,  10/64 },
	{ -10/64 ,  -10/64,  -10/64,  10/64,  10/64, 32/64 }
}

