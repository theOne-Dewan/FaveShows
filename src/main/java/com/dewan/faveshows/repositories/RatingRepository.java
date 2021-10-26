package com.dewan.faveshows.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dewan.faveshows.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
	List<Rating> findAll();
	void deleteById(Long id);
	Rating save(Rating r);
	Optional<Rating> findById(Long id);
}

