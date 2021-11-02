CREATE TABLE `reservations`
(
    `reservation_id`          int(11) NOT NULL AUTO_INCREMENT,
    `guest_id`                int(11)      DEFAULT NULL,
    `reservation_holder`      varchar(100) DEFAULT NULL,
    `reservation_holder_kana` varchar(100) DEFAULT NULL,
    `stay_date_from`          datetime     DEFAULT NULL,
    `stay_date_to`            datetime     DEFAULT NULL,
    `stay_days`               smallint(6)  DEFAULT NULL,
    `number_of_rooms`         smallint(6)  DEFAULT NULL,
    `number_of_guests`        smallint(6)  DEFAULT NULL,
    `number_of_guests_male`   smallint(6)  DEFAULT 0,
    `number_of_guests_female` smallint(6)  DEFAULT 0,
    `has_child`               tinyint(4)   DEFAULT 0,
    `reservation_method`      int(11)      DEFAULT NULL,
    `payment_method`          int(11)      DEFAULT NULL,
    `coupon`                  int(11)      DEFAULT NULL,
    `status_code`             tinyint(4)   DEFAULT 0,
    `plan_id`                 int(11)      DEFAULT NULL,
    `is_checkin`              tinyint(4)   DEFAULT 0,
    `reservation_date`        date         DEFAULT NULL,
    `payment_status`          int(11)      DEFAULT NULL,
    `new_guest_flag`          tinyint(4)   DEFAULT 0,
    `created_at`              datetime     NOT NULL DEFAULT current_timestamp(),
    `updated_at`              datetime     DEFAULT NULL ON UPDATE current_timestamp(),
    `deleted_at`              datetime     DEFAULT NULL,
    `delete_flag`             tinyint(1)   GENERATED ALWAYS AS (`deleted_at` IS NOT NULL) STORED,
    `reservation_id_old`      int(11)      DEFAULT NULL,
    PRIMARY KEY (`reservation_id`),
    CONSTRAINT `reservation_guest_id_fk` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`) ON UPDATE CASCADE,
    CONSTRAINT `reservation_reservation_method_fk` FOREIGN KEY (`reservation_method`) REFERENCES `reservation_method_master` (`reservation_method_id`),
    CONSTRAINT `reservation_payment_method_fk` FOREIGN KEY (`payment_method`) REFERENCES `payment_method_master` (`payment_method_id`),
    CONSTRAINT `reservation_plan_id_fk` FOREIGN KEY (`plan_id`) REFERENCES `plan_master` (`plan_id`),
    CONSTRAINT `reservation_reservation_id_old_fk` FOREIGN KEY (`reservation_id_old`) REFERENCES `reservations` (`reservation_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4;
