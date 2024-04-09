package ru.serzhe1.deliveryservice.persistence.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import ru.serzhe1.deliveryservice.persistence.model.StatusEntity;

@RepositoryRestResource
public interface StatusEntityRestRepository extends JpaRepository<StatusEntity, Long> {
}
