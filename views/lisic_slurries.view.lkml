view: lisic_slurries {
  sql_table_name: `natrion-operational-data.operational_data.lisic_slurries` ;;
  drill_fields: [lisic_slurry_id]

  dimension: lisic_slurry_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.lisic_slurry_id ;;
  }
  dimension: additives_id {
    type: string
    sql: ${TABLE}.additives_id ;;
  }
  dimension: additives_mass {
    type: string
    sql: ${TABLE}.additives_mass ;;
  }
  dimension: alumino_silicate_id {
    type: string
    sql: ${TABLE}.alumino_silicate_id ;;
  }
  dimension: alumino_silicate_mass {
    type: string
    sql: ${TABLE}.alumino_silicate_mass ;;
  }
  dimension: batch_size {
    type: string
    sql: ${TABLE}.batch_size ;;
  }
  dimension: day_made {
    type: string
    sql: ${TABLE}.day_made ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: experiment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: flame_retardant_id {
    type: number
    sql: ${TABLE}.flame_retardant_id ;;
  }
  dimension: flame_retardant_mass {
    type: number
    sql: ${TABLE}.flame_retardant_mass ;;
  }
  dimension: mix_method {
    type: string
    sql: ${TABLE}.mix_method ;;
  }
  dimension: mix_time {
    type: string
    sql: ${TABLE}.mix_time ;;
  }
  dimension: polymer_id {
    type: string
    sql: ${TABLE}.polymer_id ;;
  }
  dimension: polymer_mass {
    type: string
    sql: ${TABLE}.polymer_mass ;;
  }
  dimension: polymer_stock_solution_id {
    type: string
    sql: ${TABLE}.polymer_stock_solution_id ;;
  }
  dimension: polymer_stock_solution_mass {
    type: number
    sql: ${TABLE}.polymer_stock_solution_mass ;;
  }
  dimension: recipe_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: salt_id {
    type: string
    sql: ${TABLE}.salt_id ;;
  }
  dimension: salt_mass {
    type: string
    sql: ${TABLE}.salt_mass ;;
  }
  dimension: salt_stock_solution_id {
    type: string
    sql: ${TABLE}.salt_stock_solution_id ;;
  }
  dimension: salt_stock_solution_mass {
    type: number
    sql: ${TABLE}.salt_stock_solution_mass ;;
  }
  dimension: solids_composition {
    type: number
    sql: ${TABLE}.solids_composition ;;
  }
  dimension: solvent_id {
    type: string
    sql: ${TABLE}.solvent_id ;;
  }
  dimension: solvent_mass {
    type: string
    sql: ${TABLE}.solvent_mass ;;
  }
  dimension: sop_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.sop_id ;;
  }
  dimension: total_composition {
    type: number
    sql: ${TABLE}.total_composition ;;
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
	lisic_slurry_id,
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
