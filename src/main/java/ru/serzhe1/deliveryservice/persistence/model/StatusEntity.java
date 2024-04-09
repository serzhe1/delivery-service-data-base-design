package ru.serzhe1.deliveryservice.persistence.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "statuses", schema = "app")
@Data
public class StatusEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String caption;

}
