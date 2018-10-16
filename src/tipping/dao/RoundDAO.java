package tipping.dao;

import java.util.List;

import tipping.entity.Round;
import tipping.entity.Tip;

public interface RoundDAO {
	
	public List<Round> getRounds();

	public Round getRound(int roundId, int userId);

	public List<Tip> getTips(int roundId);

	public void saveTips(Round theTips);

	public Round getCurrentRound(int userId);


}
