view: electrode_mfg_pouch {
  sql_table_name: `natrion-operational-data.operational_data.electrode_mfg_pouch` ;;

  dimension: cast_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.cast_id ;;
  }
  dimension: component {
    type: string
    sql: ${TABLE}.component ;;
  }
  dimension: defects {
    type: number
    sql: ${TABLE}.defects ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: double_sided {
    type: number
    sql: ${TABLE}.double_sided ;;
  }
  dimension: electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_footprint ;;
  }
  dimension: electrode_id {
    type: string
    sql: ${TABLE}.electrode_id ;;
  }
  dimension: electrode_mass {
    type: number
    sql: ${TABLE}.electrode_mass ;;
  }
  dimension: electrode_thickness {
    type: string
    sql: ${TABLE}.electrode_thickness ;;
  }
  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }
  dimension: left_right {
    type: string
    sql: ${TABLE}.left_right ;;
  }
  dimension: punch_num {
    type: number
    sql: ${TABLE}.punch_num ;;
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
  dimension: t4 {
    type: number
    sql: ${TABLE}.t4 ;;
  }
  dimension: t5 {
    type: number
    sql: ${TABLE}.t5 ;;
  }
  dimension: target_areal_capacity {
    type: number
    sql: ${TABLE}.target_areal_capacity ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [casts.cast_id, users.firstname, users.user_id, users.middlename, users.lastname]
  }
}
