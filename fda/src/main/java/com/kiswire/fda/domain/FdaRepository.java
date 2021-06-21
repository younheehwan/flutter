package com.kiswire.fda.domain;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface FdaRepository extends MongoRepository<Fda, String>{

}