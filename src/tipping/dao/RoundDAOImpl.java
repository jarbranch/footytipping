package tipping.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tipping.entity.Game;
import tipping.entity.Round;
import tipping.entity.Tip;

@Repository
public class RoundDAOImpl implements RoundDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Round> getRounds() {
		
		// get current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// create query
		
		Query<Round> theQuery = session.createQuery("from Round", Round.class);
		
		// Execute query and return result list
		
		List<Round> rounds = theQuery.getResultList();
		
		// return results
		
		return rounds;
	}


	@Override
	public Round getRound(int roundId, int userId) {
		
		
		System.out.println("ROUND: " + roundId + "USER: " + userId);
		Session session = sessionFactory.getCurrentSession();
		
		Round round = session.get(Round.class, roundId);
		
		List<Game> roundGames = round.getGames();
				
		for (Game i : roundGames) {
			// set up game map so it can be displayed on radio buttons
			i.setGameOptions();
			// set the radio buttons to disabled if they are in the past
			i.Disabled();	
			
			i.getTipSelection().removeIf(t -> t.getUser().getId() != userId);
		}
		
		return round;
	}


	@Override
	public List<Tip> getTips(int roundId) {
		Session session = sessionFactory.getCurrentSession();
		
		
		Query<Tip> theQuery = session.createQuery("from Tip a INNER JOIN Game as b INNER JOIN Round as c WHERE c.id = :roundId");
		
		theQuery.setParameter("roundId", roundId);
		
		List<Tip> tips = theQuery.getResultList();
		
		return tips;
	}


	@Override
	public void saveTips(Round theTips) {
			
		Session session = sessionFactory.getCurrentSession();
		
		for (Game i : theTips.getGames()) {
			for (Tip j : i.getTipSelection()) {
				if (j.getTipSelected() != null) session.saveOrUpdate(j);
			}
		}
	}


	@Override
	public Round getCurrentRound(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		Query<Round> theQuery = session.createQuery("from Round a WHERE a.endDate > :currDate");
		
		// For testing only, setting date to specific date
		SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		
		try {
			Date testDate = dateformat.parse("26/03/2018");
			theQuery.setParameter("currDate", testDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//prod date
		//theQuery.setParameter("currDate", new Date());
		
		
		
		theQuery.setMaxResults(1);
		
		Round currentRound = theQuery.getSingleResult();
		
		List<Game> roundGames = currentRound.getGames();
		
		for (Game i : roundGames) {
			// set up game map so it can be displayed on radio buttons
			i.setGameOptions();
			// set the radio buttons to disabled if they are in the past
			i.Disabled();	
			
			i.getTipSelection().removeIf(t -> t.getUser().getId() != userId);
		}
		
		return currentRound;
		
		
	}
				
}
