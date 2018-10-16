package tipping.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="round")
public class Round {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="Round_Name")
	private String roundName;
	
	@Column(name="Round_Start")
	private Date startDate;
	
	@Column(name="Round_End")
	private Date endDate;
	
	@Column(name="Num_Games")
	private int numGames;
	
	@OneToMany(mappedBy="round", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Game> games;
	
	@Transient
	private boolean saved;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoundName() {
		return roundName;
	}

	public void setRoundName(String roundName) {
		this.roundName = roundName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getNumGames() {
		return numGames;
	}

	public void setNumGames(int numGames) {
		this.numGames = numGames;
	}

	public Round() {
		
	}

	public Round(String roundName, Date startDate, Date endDate, int numGames) {
		this.roundName = roundName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.numGames = numGames;
	}

	@Override
	public String toString() {
		return "Round [id=" + id + ", roundName=" + roundName + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", numGames=" + numGames + "]";
	}

	public List<Game> getGames() {
		return games;
	}

	public void setGames(List<Game> games) {
		this.games = games;
	}

	public boolean isSaved() {
		return saved;
	}

	public void setSaved(boolean saved) {
		this.saved = saved;
	}
	
	
	
	
	
	
	
	
}
