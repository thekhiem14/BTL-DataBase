SELECT `athletecurrentschedule`.`AthleteID`,
    `athletecurrentschedule`.`AthleteName`,
    `athletecurrentschedule`.`TemplateName`,
    `athletecurrentschedule`.`DayOfWeek`,
    `athletecurrentschedule`.`StartTime`,
    `athletecurrentschedule`.`EndTime`,
    `athletecurrentschedule`.`ActivityType`,
    `athletecurrentschedule`.`CourseName`,
    `athletecurrentschedule`.`TrainerName`,
    `athletecurrentschedule`.`FacilityName`,
    `athletecurrentschedule`.`Notes`
FROM `athleticcenter`.`athletecurrentschedule`;
