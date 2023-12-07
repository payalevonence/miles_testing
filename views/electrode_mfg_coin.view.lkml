view: electrode_mfg_coin {
  sql_table_name: `natrion-operational-data.operational_data.electrode_mfg_coin` ;;

  dimension: cam_loading {
    type: number
    sql: ${TABLE}.cam_loading ;;
  }
  dimension: cam_percent {
    type: number
    sql: ${TABLE}.cam_percent ;;
  }
  dimension: cast_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.cast_id ;;
  }
  dimension: component {
    type: string
    sql: ${TABLE}.component ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
    type: number
    sql: ${TABLE}.electrode_thickness ;;
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
