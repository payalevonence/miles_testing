view: recipes {
  sql_table_name: `natrion-operational-data.operational_data.recipes` ;;
  drill_fields: [recipe_id]

  dimension: recipe_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: component {
    type: string
    sql: ${TABLE}.component ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: recepie_json {
    type: number
    sql: ${TABLE}.recepie_json ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [recipe_id, stock_solutions.count, lisic_slurries.count, lisic_separators.count]
  }
}
