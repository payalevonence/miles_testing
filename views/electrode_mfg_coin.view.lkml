view: electrode_mfg_coin {
  sql_table_name: `natrion-operational-data.operational_data.electrode_mfg_coin` ;;

  dimension: cast_id {
    type: string
    primary_key: yes
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
    sql: ${TABLE}.user_id ;;
  }


  #measure: total_mass {
  #  type: number
  #  sql: ${casts.actual_mass_loading} * ${electrode_mfg_coin.electrode_footprint} ;;
  #}



  measure: count {
    type: count
  }




}
