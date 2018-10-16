package tipping.service;

import java.util.List;

import tipping.entity.Round;
import tipping.entity.Tip;

public interface TippingService {
	
	public List<Round> getRounds();

	public Round getRound(int roundId, int userID);
	
	public List<Tip> getTips(int roundId);

	public void saveTips(Round theTips);
	
	public Round getCurrentRound(int userId);



}
