view: slurries {
  sql_table_name: `natrion-operational-data.operational_data.slurries` ;;
  drill_fields: [slurry_id]

  dimension: slurry_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.slurry_id ;;
  }
  dimension: active_material_id {
    type: string
    sql: ${TABLE}.active_material_id ;;
  }
  dimension: active_material_mass {
    type: number
    sql: ${TABLE}.active_material_mass ;;
  }
  dimension: batch_size {
    type: number
    sql: ${TABLE}.batch_size ;;
  }
  dimension: cnt_id {
    type: number
    sql: ${TABLE}.cnt_id ;;
  }
  dimension: cnt_mass {
    type: number
    sql: ${TABLE}.cnt_mass ;;
  }
  dimension: conductive_material_id {
    type: string
    sql: ${TABLE}.conductive_material_id ;;
  }
  dimension: conductive_material_mass {
    type: number
    sql: ${TABLE}.conductive_material_mass ;;
  }
  dimension: cup_size {
    type: string
    sql: ${TABLE}.cup_size ;;
  }
  dimension: date_mixed {
    type: string
    sql: ${TABLE}.date_mixed ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: dispersant_id {
    type: number
    sql: ${TABLE}.dispersant_id ;;
  }
  dimension: dispersant_mass {
    type: number
    sql: ${TABLE}.dispersant_mass ;;
  }
  dimension: experiment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: li_no3_id {
    type: string
    sql: ${TABLE}.LiNO3_id ;;
  }
  dimension: li_no3_mass {
    type: number
    sql: ${TABLE}.LiNO3_mass ;;
  }
  dimension: recipe_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: solvent_id {
    type: string
    sql: ${TABLE}.solvent_id ;;
  }
  dimension: solvent_mass {
    type: number
    sql: ${TABLE}.solvent_mass ;;
  }
  dimension: stock_solution_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.stock_solution_id ;;
  }
  dimension: stock_solution_mass {
    type: number
    sql: ${TABLE}.stock_solution_mass ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: viscosity {
    type: number
    sql: ${TABLE}.viscosity ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	slurry_id,
	experiments.experiment_id,
	recipes.recipe_id,
	stock_solutions.stock_solution_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname
	]
  }

}
