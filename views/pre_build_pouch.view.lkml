view: pre_build_pouch {
  sql_table_name: `natrion-operational-data.operational_data.pre_build_pouch` ;;
  drill_fields: [pre_build_pouch_id]

  dimension: pre_build_pouch_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.pre_build_pouch_id ;;
  }
  dimension: anode_id {
    type: string
    sql: ${TABLE}.anode_id ;;
  }
  dimension: bagging {
    type: yesno
    sql: ${TABLE}.bagging ;;
  }
  dimension: blister_size {
    type: number
    sql: ${TABLE}.blister_size ;;
  }
  dimension: cathode_id {
    type: string
    sql: ${TABLE}.cathode_id ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
  }
  dimension: cell_type {
    type: string
    sql: ${TABLE}.cell_type ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: electolyte_id {
    type: string
    sql: ${TABLE}.electolyte_id ;;
  }
  dimension: expected_capacity {
    type: number
    sql: ${TABLE}.expected_capacity ;;
  }
  dimension: experiment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: number_of_layers {
    type: number
    sql: ${TABLE}.number_of_layers ;;
  }
  dimension: pouch_dimensions {
    type: string
    sql: ${TABLE}.pouch_dimensions ;;
  }
  dimension: seperator_id {
    type: string
    sql: ${TABLE}.seperator_id ;;
  }
  dimension: target_elyte_volume {
    type: number
    sql: ${TABLE}.target_elyte_volume ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: wrapped {
    type: yesno
    sql: ${TABLE}.wrapped ;;
  }

  dimension: area_eis {
    type: number
    sql: electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  pre_build_pouch_id,
  experiments.experiment_id,
  users.firstname,
  users.user_id,
  users.middlename,
  users.lastname
  ]
  }

}
