package com.dewan.faveshows.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dewan.faveshows.models.Show;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {
	List<Show> findAll();
	void deleteById(Long id);
	Show save(Show s);
	Optional<Show> findById(Long id);
}
