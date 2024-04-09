package ru.serzhe1.deliveryservice.persistence.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "delivery_costs", schema = "app")
public class DeliveryCostEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int cost;
    private int freeTotalOrderCost;
    private String time;
}
