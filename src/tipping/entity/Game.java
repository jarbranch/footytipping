package tipping.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TreeMap;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="game")
public class Game {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name="round_id")
	private Round round;
	
	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name="ground_id")
	private Ground ground;
	
	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name="home_team_id")
	private Team homeTeam;
	
	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name="away_team_id")
	private Team awayTeam;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="winning_team")
	private String winningTeam;
		
	@OneToMany(fetch=FetchType.EAGER, mappedBy="game", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Tip> tipSelection;
	
	@Transient
	private TreeMap<String, String> gameOptions;
	
	@Transient
	private boolean disabled;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Round getRound() {
		return round;
	}

	public void setRound(Round round) {
		this.round = round;
	}

	public Ground getGround() {
		return ground;
	}

	public void setGround(Ground ground) {
		this.ground = ground;
	}

	public Team getHomeTeam() {
		return homeTeam;
	}

	public void setHomeTeam(Team homeTeam) {
		this.homeTeam = homeTeam;
	}

	public Team getAwayTeam() {
		return awayTeam;
	}

	public void setAwayTeam(Team awayTeam) {
		this.awayTeam = awayTeam;
	}
	
	
	public Game() {
		
	}

	public Game(Round round, Ground ground, Team homeTeam, Team awayTeam, Date startTime, String winningTeam, List<Tip> tipSelection) {
		this.round = round;
		this.ground = ground;
		this.homeTeam = homeTeam;
		this.awayTeam = awayTeam;
		this.startTime = startTime;
		this.winningTeam = winningTeam;
		this.tipSelection = tipSelection;

	}
	
	@Override
	public String toString() {
		return "Game [id=" + id + ", round=" + round + ", ground=" + ground + ", homeTeam=" + homeTeam + ", awayTeam="
				+ awayTeam + ", startTime=" + startTime + ", winningTeam=" + winningTeam + "]";
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {	
		this.startTime = startTime;
	}

	public String getWinningTeam() {
		return winningTeam;
	}

	public void setWinningTeam(String winningTeam) {
		this.winningTeam = winningTeam;
	}

	public List<Tip> getTipSelection() {
		return tipSelection;
	}

	public void setTipSelection(List<Tip> tipSelection) {
		this.tipSelection = tipSelection;
	}

	public TreeMap<String, String> getGameOptions() {
		return gameOptions;
	}

	public void setGameOptions() {
		
		gameOptions = new TreeMap<>(Collections.reverseOrder());
		gameOptions.put("H", homeTeam.getTeamName());
		gameOptions.put("A", awayTeam.getTeamName());

	}

	public void Disabled() {
		
		boolean result;
		
		Date currentDate = new Date();
		if (startTime.before(currentDate)) {
			result = true;			
		}
		else result = false;
		
		disabled = result;  
		
		 disabled = false;
	}

	public boolean getDisabled() {
		return disabled;
	}
	
	
	
	
	
	
	
	
	
}
