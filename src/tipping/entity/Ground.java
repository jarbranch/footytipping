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
@Table(name="ground")
public class Ground {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="ground_name")
	private String groundName;
	
	@Column(name="ground_fullname")
	private String groundFullName;
	
	@OneToMany(mappedBy="ground", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Game> games;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGroundName() {
		return groundName;
	}

	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}

	public String getGroundFullName() {
		return groundFullName;
	}

	public void setGroundFullName(String groundFullName) {
		this.groundFullName = groundFullName;
	}

	public List<Game> getGames() {
		return games;
	}

	public void setGames(List<Game> games) {
		this.games = games;
	}
	
	public Ground () {
		
	}

	public Ground(String groundName, String groundFullName, List<Game> games) {
		this.groundName = groundName;
		this.groundFullName = groundFullName;
		this.games = games;
	}
	
	

}
