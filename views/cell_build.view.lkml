view: cell_build {
  sql_table_name: `natrion-operational-data.operational_data.cell_build` ;;

  dimension: anode_id {
    type: string
    sql: ${TABLE}.anode_id ;;
  }
  dimension: build_date {
    type: string
    sql: ${TABLE}.build_date ;;
  }
  dimension: cathode_id {
    type: string
    sql: ${TABLE}.cathode_id ;;
  }
  dimension: cell_id {
    type: string
    primary_key: yes
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
  dimension: dry_mass {
    type: number
    sql: ${TABLE}.dry_mass ;;
  }
  dimension: electolyte_id_ {
    type: string
    sql: ${TABLE}.electolyte_id_ ;;
  }
  dimension: excess_casing_mass {
    type: number
    sql: ${TABLE}.excess_casing_mass ;;
  }
  dimension: experiment_id {
    type: string
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: pouch {
    type: yesno
    sql: ${TABLE}.pouch ;;
  }
  dimension: pre_build_id {
    type: string
    sql: ${TABLE}.pre_build_id ;;
  }
  dimension: seperator_id {
    type: string
    sql: ${TABLE}.seperator_id ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: wet_mass {
    type: number
    sql: ${TABLE}.wet_mass ;;
  }
  measure: count {
    type: count
  }
}
