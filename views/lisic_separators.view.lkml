view: lisic_separators {
  sql_table_name: `natrion-operational-data.operational_data.lisic_separators` ;;

  dimension: availibility {
    type: number
    sql: ${TABLE}.availibility ;;
  }
  dimension: cast_method {
    type: string
    sql: ${TABLE}.cast_method ;;
  }
  dimension: cast_temp {
    type: number
    sql: ${TABLE}.`cast temp` ;;
  }
  dimension: cots {
    type: number
    sql: ${TABLE}.cots ;;
  }
  dimension: date_created {
    type: string
    sql: ${TABLE}.date_created ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: experiment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: final_temp {
    type: number
    sql: ${TABLE}.final_temp ;;
  }
  dimension: final_thickness {
    type: number
    sql: ${TABLE}.final_thickness ;;
  }
  dimension: humidity {
    type: number
    sql: ${TABLE}.humidity ;;
  }
  dimension: lisic_number {
    type: string
    sql: ${TABLE}.lisic_number ;;
  }
  dimension: lisic_slurry_id {
    type: string
    sql: ${TABLE}.lisic_slurry_id ;;
  }
  dimension: membrane_id {
    type: string
    sql: ${TABLE}.membrane_id ;;
  }
  dimension: recipe_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: seperator_supplier {
    type: string
    sql: ${TABLE}.seperator_supplier ;;
  }
  dimension: slurry_age {
    type: number
    sql: ${TABLE}.slurry_age ;;
  }
  dimension: sop_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.sop_id ;;
  }
  dimension: supply_id {
    type: string
    sql: ${TABLE}.supply_id ;;
  }
  dimension: time_to_vaccum {
    type: number
    sql: ${TABLE}.time_to_vaccum ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	experiments.experiment_id,
	sop.sop_id,
	recipes.recipe_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname
	]
  }

}
