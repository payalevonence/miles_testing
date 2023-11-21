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
  dimension_group: date_mixed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
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
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: lino3_id {
    type: number
    sql: ${TABLE}.lino3_id ;;
  }
  dimension: lino3_mass {
    type: number
    sql: ${TABLE}.lino3_mass ;;
  }
  dimension: recipe_id {
    type: string
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
    sql: ${TABLE}.stock_solution_id ;;
  }
  dimension: stock_solution_mass {
    type: number
    sql: ${TABLE}.stock_solution_mass ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: viscosity {
    type: string
    sql: ${TABLE}.viscosity ;;
  }
  measure: count {
    type: count
    drill_fields: [slurry_id]
  }
}
