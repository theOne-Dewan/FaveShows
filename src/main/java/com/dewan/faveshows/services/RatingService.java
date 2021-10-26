package com.dewan.faveshows.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dewan.faveshows.models.Rating;
import com.dewan.faveshows.repositories.RatingRepository;


@Service
public class RatingService {
    private final RatingRepository ratingRepository;
    
    public RatingService(RatingRepository ratingRepository) {
        this.ratingRepository = ratingRepository;
    }
    
    //Create or Update a rating
    public Rating saveRating(Rating r) {
    	return ratingRepository.save(r);
    }
    //Find all rating
    public List<Rating> allRatings(){
    	return ratingRepository.findAll();
    }
    //Find 1 rating
    public Rating findRatingById(Long id) {
    	Optional<Rating> r = ratingRepository.findById(id);
    	
    	if(r.isPresent()) {
            return r.get();
    	} else {
    	    return null;
    	}
    }
    //Delete 1 rating
    public void deleteRating(Long id) {
    	ratingRepository.deleteById(id);
    }
}

