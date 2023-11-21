view: users {
  sql_table_name: `natrion-operational-data.operational_data.users` ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: emp_frac {
    type: number
    sql: ${TABLE}.emp_frac ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
  dimension: middlename {
    type: string
    sql: ${TABLE}.middlename ;;
  }
  measure: count {
    type: count
    drill_fields: [user_id, firstname, middlename, lastname]
  }
}
