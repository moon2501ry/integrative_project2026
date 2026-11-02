function combat_init(){
	other.in_combat = true;
}

function combat_gui(){
	if other.in_combat{
		draw_text(0,0,"Em Combate")
	}
}