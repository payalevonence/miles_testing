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
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	sop_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	lisic_separators.count,
	lisic_slurries.count
	]
  }

}
