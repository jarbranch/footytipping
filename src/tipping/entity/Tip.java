package tipping.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tips")
public class Tip {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="tip_selected")
	private String tipSelected;
	
	@Column(name="game_score")
	private int gameScore;
	
	@ManyToOne
	@JoinColumn(name="game_id")
	private Game game;
	
	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name="user_id")
	private User user;	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipSelected() {
		return tipSelected;
	}

	public void setTipSelected(String tipSelected) {
		this.tipSelected = tipSelected;
	}

	public int getGameScore() {
		return gameScore;
	}

	public void setGameScore(int gameScore) {
		this.gameScore = gameScore;
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}
	
	public Tip() {
		
	}

	public Tip(String tipSelected, Game game) {
		this.tipSelected = tipSelected;
		this.game = game;
	}

	@Override
	public String toString() {
		return "Tip [id=" + id + ", tipSelected=" + tipSelected + ", gameScore=" + gameScore + ", game=" + game + "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
