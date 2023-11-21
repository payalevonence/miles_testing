view: composites {
  sql_table_name: `natrion-operational-data.operational_data.composites` ;;
  drill_fields: [composite_id]

  dimension: composite_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.composite_id ;;
  }
  dimension: component_id {
    type: number
    sql: ${TABLE}.component_id ;;
  }
  dimension: component_type {
    type: number
    sql: ${TABLE}.component_type ;;
  }
  measure: count {
    type: count
    drill_fields: [composite_id]
  }
}
