view: stock_solutions {
  sql_table_name: `natrion-operational-data.operational_data.stock_solutions` ;;
  drill_fields: [stock_solution_id]

  dimension: stock_solution_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.stock_solution_id ;;
  }
  dimension: cup_size {
    type: string
    sql: ${TABLE}.cup_size ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: mins_mixed {
    type: number
    sql: ${TABLE}.mins_mixed ;;
  }
  dimension: mix_time {
    type: number
    sql: ${TABLE}.mix_time ;;
  }
  dimension: polymer_id {
    type: string
    sql: ${TABLE}.polymer_id ;;
  }
  dimension: polymer_mass {
    type: number
    sql: ${TABLE}.polymer_mass ;;
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
  dimension: solvent_id {
    type: string
    sql: ${TABLE}.solvent_id ;;
  }
  dimension: solvent_mass {
    type: number
    sql: ${TABLE}.solvent_mass ;;
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
	stock_solution_id,
	recipes.recipe_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	slurries.count
	]
  }

}
