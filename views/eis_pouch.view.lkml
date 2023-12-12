view: eis_pouch {
  sql_table_name: `natrion-operational-data.data_test.eis_pouch` ;;

  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
  }
  dimension: frequency {
    type: number
    sql: ${TABLE}.Frequency ;;
  }
  dimension: soh {
    type: string
    sql: ${TABLE}.soh ;;
  }
  dimension: zim {
    type: number
    sql: ${TABLE}.Zim ;;
  }
  dimension: zre {
    type: number
    sql: ${TABLE}.Zre ;;
  }

  dimension: specific_zim {
    type: number
    sql: electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * ${TABLE}.Zim ;;
  }

  dimension: specific_zre {
    type: number
    sql: electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * ${TABLE}.Zre ;;
  }

  measure: specific_zre1 {
    type: number
    sql: electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * ${TABLE}.Zre ;;
  }

  measure: count {
    type: count
  }
}
