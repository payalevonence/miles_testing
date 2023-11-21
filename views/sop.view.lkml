view: sop {
  sql_table_name: `natrion-operational-data.operational_data.sop` ;;
  drill_fields: [sop_id]

  dimension: sop_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.sop_id ;;
  }
  dimension: component {
    type: number
    sql: ${TABLE}.component ;;
  }
  dimension: description {
    type: number
    sql: ${TABLE}.description ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [sop_id]
  }
}
