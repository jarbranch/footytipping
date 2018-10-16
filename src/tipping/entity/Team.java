package tipping.entity;

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


@Entity
@Table(name="team")
public class Team {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="team_name")
	private String teamName;
	
	@Column(name="team_nickname")
	private String teamNickName;
	
	@OneToMany(mappedBy="homeTeam", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Game> homeGames;
	
	@OneToMany(mappedBy="awayTeam", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Game> awayGames;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamNickName() {
		return teamNickName;
	}

	public void setTeamNickName(String teamNickName) {
		this.teamNickName = teamNickName;
	}

	public Team(String teamName, String teamNickName) {
		this.teamName = teamName;
		this.teamNickName = teamNickName;
	}
	
	public Team() {
		
	}
	
	
	
}
