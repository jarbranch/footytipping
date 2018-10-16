package tipping.entity;

import java.util.HashMap;

public class TippingMain {
	
	private int round;
	
	private HashMap<Integer, String> rounds;
	
	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	public HashMap<Integer, String> getRounds() {
		return rounds;
	}

	public void setRounds(HashMap<Integer, String> rounds) {
		this.rounds = rounds;
	}

	public TippingMain(HashMap<Integer, String> rounds) {
		this.rounds = rounds;
	}	
	

}
