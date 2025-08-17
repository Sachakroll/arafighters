function battle_select_music()
{
	if global.easteregg_state = 1 {return mPiouprojet_easteregg}
	if global.easteregg_state = 2 {return mSmileman_voice_easteregg}
	return mBattle_a
}