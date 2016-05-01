package tw.com.softleader.eeit8600.movie.service;


import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.game.entity.Game;
import tw.com.softleader.eeit8600.movie.dao.MovieDao;
import tw.com.softleader.eeit8600.movie.entity.Movie;

@Service
public class MovieService {
	@Autowired
	private MovieDao movieDao;
		
	public Movie getById(Long id) {
		return movieDao.findOne(id);		
	}
	
	public List<Movie> getAll() {
		return movieDao.findAll();
	}
	
	public void insert(Movie movie) {
		movieDao.save(movie);
	}
	
	public void update(Movie movie) {
		movieDao.save(movie);
	}
	
	public void delete(Long id) {
		movieDao.delete(id);
	}
	
	public void addSomeData(){
		Movie movie1 = new Movie("Batman Begins", "Christian Bale", "Action");
		Movie movie2 = new Movie("The Dark Knight", "Christian Bale", "Action");
		Movie movie3 = new Movie("The Dark Knight Rises", "Christian Bale", "Action");
		Movie movie4 = new Movie("Gone Girl", "Gillian Flynn", "Mystery");
		Movie movie5 = new Movie("The Wolf of Wall", "Leonardo DiCaprio", "Biography");
		Movie movie6 = new Movie("Rush", "Daniel Brühl", "Biography");
		movieDao.save(movie1);
		movieDao.save(movie2);
		movieDao.save(movie3);
		movieDao.save(movie4);
		movieDao.save(movie5);
		movieDao.save(movie6);
	}
}