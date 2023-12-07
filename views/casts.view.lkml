view: casts {
  sql_table_name: `natrion-operational-data.operational_data.casts` ;;
  drill_fields: [cast_id]

  dimension: cast_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.cast_id ;;
  }
  dimension: actual_mass_loading {
    type: number
    sql: ${TABLE}.actual_mass_loading ;;
  }
  dimension: areal_capacity {
    type: number
    sql: ${TABLE}.areal_capacity ;;
  }
  dimension: areal_capacity_side_1 {
    type: number
    sql: ${TABLE}.areal_capacity_side_1 ;;
  }
  dimension: areal_capacity_side_2 {
    type: number
    sql: ${TABLE}.areal_capacity_side_2 ;;
  }
  dimension: cal_speed {
    type: number
    sql: ${TABLE}.cal_speed ;;
  }
  dimension: cal_temp {
    type: number
    sql: ${TABLE}.cal_temp ;;
  }
  dimension: calendared {
    type: number
    sql: ${TABLE}.calendared ;;
  }
  dimension: carbon_coated {
    type: number
    sql: ${TABLE}.carbon_coated ;;
  }
  dimension: cast_date {
    type: string
    sql: ${TABLE}.cast_date ;;
  }
  dimension: cast_speed {
    type: number
    sql: ${TABLE}.cast_speed ;;
  }
  dimension: cast_thickness {
    type: number
    sql: ${TABLE}.cast_thickness ;;
  }
  dimension: cots {
    type: number
    sql: ${TABLE}.cots ;;
  }
  dimension: current_collector_id {
    type: string
    sql: ${TABLE}.current_collector_id ;;
  }
  dimension: current_collector_thickness {
    type: number
    sql: ${TABLE}.current_collector_thickness ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: double_sided {
    type: number
    sql: ${TABLE}.double_sided ;;
  }
  dimension: end_gap_heigh {
    type: number
    sql: ${TABLE}.end_gap_heigh ;;
  }
  dimension: experiment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: lisic_slurry_id {
    type: string
    sql: ${TABLE}.lisic_slurry_id ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: num_passes {
    type: number
    sql: ${TABLE}.num_passes ;;
  }
  dimension: num_thickness_reductions {
    type: number
    sql: ${TABLE}.num_thickness_reductions ;;
  }
  dimension: porosity_postcalendar {
    type: number
    sql: ${TABLE}.porosity_postcalendar ;;
  }
  dimension: porosity_precalendar {
    type: number
    sql: ${TABLE}.porosity_precalendar ;;
  }
  dimension: recipe_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: slurry_id {
    type: string
    sql: ${TABLE}.slurry_id ;;
  }
  dimension: strip_type {
    type: string
    sql: ${TABLE}.strip_type ;;
  }
  dimension: supply_id {
    type: string
    sql: ${TABLE}.supply_id ;;
  }
  dimension: t1 {
    type: number
    sql: ${TABLE}.t1 ;;
  }
  dimension: t2 {
    type: number
    sql: ${TABLE}.t2 ;;
  }
  dimension: t3 {
    type: number
    sql: ${TABLE}.t3 ;;
  }
  dimension: thickness_postcalendar {
    type: number
    sql: ${TABLE}.thickness_postcalendar ;;
  }
  dimension: thickness_precalendar_avg {
    type: number
    sql: ${TABLE}.thickness_precalendar_avg ;;
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
	cast_id,
	experiments.experiment_id,
	recipes.recipe_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	electrode_mfg_coin.count,
	electrode_mfg_pouch.count
	]
  }

}
