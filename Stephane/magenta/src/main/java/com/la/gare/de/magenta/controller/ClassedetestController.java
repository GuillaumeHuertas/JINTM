package com.la.gare.de.magenta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.la.gare.de.magenta.exception.ResourceNotFoundException;
import com.la.gare.de.magenta.model.Classedetest;
import com.la.gare.de.magenta.repository.ClassedetestRepository;

@CrossOrigin
@RestController
@RequestMapping("/api/v1")
public class ClassedetestController {
	@Autowired
	private ClassedetestRepository classedetestRepository;

	@GetMapping("/classedetest")
	public List<Classedetest> getAllClassedetests() {
		return classedetestRepository.findAll();
	}

	@GetMapping("/classedetest/{id}")
	public ResponseEntity<Classedetest> getclassedetestById(@PathVariable(value = "id") Long classedetestId)
			throws ResourceNotFoundException {
		Classedetest classedetest = classedetestRepository.findById(classedetestId)
				.orElseThrow(() -> new ResourceNotFoundException("Classedetest not found for this id :: " + classedetestId));
		return ResponseEntity.ok().body(classedetest);
	}

	@PostMapping("/classedetest")
	public Classedetest createClassedetest(@Valid @RequestBody Classedetest classedetest) {
		return classedetestRepository.save(classedetest);
	}

	@PutMapping("/classedetest")
    public ResponseEntity<Classedetest> updateClassedetest(@Valid @RequestBody Classedetest classedetestDetails) throws ResourceNotFoundException {
        Classedetest classedetest = classedetestRepository.findById(classedetestDetails.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Classedetest not found for this id :: " + classedetestDetails.getId()));        
/*BALISEATROUVER*/

        final Classedetest updatedClassedetest = classedetestRepository.save(classedetest);
        return ResponseEntity.ok(updatedClassedetest);
    }
	
	@DeleteMapping("/classedetest/{id}")
	public Map<String, Boolean> deleteClassedetest(@PathVariable(value = "id") Long classedetestId)
			throws ResourceNotFoundException {
		Classedetest classedetest = classedetestRepository.findById(classedetestId)
				.orElseThrow(() -> new ResourceNotFoundException("Classedetest not found for this id :: " + classedetestId));

		classedetestRepository.delete(classedetest);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}

}


