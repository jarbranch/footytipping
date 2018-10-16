package tipping.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tipping.dao.RoundDAO;
import tipping.entity.Round;
import tipping.entity.Tip;

@Service
public class TippingServiceImpl implements TippingService {

	
	// inject customer DAO
	@Autowired
	private RoundDAO roundDAO;
	
	@Override
	@Transactional
	public List<Round> getRounds() {	
		return roundDAO.getRounds();
	}

	@Override
	@Transactional
	public Round getRound(int roundId, int userID) {
		
		return roundDAO.getRound(roundId, userID);
	}

	@Override
	@Transactional
	public List<Tip> getTips(int roundId) {
		
		return roundDAO.getTips(roundId);
	}

	@Override
	@Transactional
	public void saveTips(Round theTips) {
		roundDAO.saveTips(theTips);
		
	}

	@Override
	@Transactional
	public Round getCurrentRound(int userId) {
		// TODO Auto-generated method stub
		return roundDAO.getCurrentRound(userId);
	}

	
	
}
