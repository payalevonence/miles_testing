view: supplies {
  sql_table_name: `natrion-operational-data.operational_data.supplies` ;;
  drill_fields: [supply_id]

  dimension: supply_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.supply_id ;;
  }
  dimension: active_material {
    type: string
    sql: ${TABLE}.active_material ;;
  }
  dimension: active_material_id {
    type: string
    sql: ${TABLE}.active_material_id ;;
  }
  dimension: availability {
    type: number
    sql: ${TABLE}.availability ;;
  }
  dimension: date_opened {
    type: string
    sql: ${TABLE}.date_opened ;;
  }
  dimension: date_recieved {
    type: string
    sql: ${TABLE}.date_recieved ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: quantity {
    type: string
    sql: ${TABLE}.quantity ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  measure: count {
    type: count
    drill_fields: [supply_id, users.firstname, users.user_id, users.middlename, users.lastname]
  }
}
