package ru.serzhe1.deliveryservice.persistence.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "ingredient", schema = "app")
@Data
public class IngredientEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
}
