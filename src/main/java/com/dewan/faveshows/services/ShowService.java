package com.dewan.faveshows.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dewan.faveshows.models.Show;
import com.dewan.faveshows.repositories.ShowRepository;

@Service
public class ShowService {
    private final ShowRepository showRepository;
    
    public ShowService(ShowRepository showRepository) {
        this.showRepository = showRepository;
    }
    
    //Create or Update a show
    public Show saveShow(Show s) {
    	return showRepository.save(s);
    }
    //Find all shows
    public List<Show> allShows(){
    	return showRepository.findAll();
    }
    //Find 1 show
    public Show findShowById(Long id) {
    	Optional<Show> s = showRepository.findById(id);
    	
    	if(s.isPresent()) {
            return s.get();
    	} else {
    	    return null;
    	}
    }
    //Delete 1 show
    public void deleteShow(Long id) {
    	showRepository.deleteById(id);
    }
}
