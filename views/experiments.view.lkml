view: experiments {
  sql_table_name: `natrion-operational-data.operational_data.experiments` ;;
  drill_fields: [experiment_id]

  dimension: experiment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: string
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
	experiment_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	campaigns.campaign_id,
	cell_build.count,
	casts.count,
	lisic_separators.count,
	lisic_slurries.count,
	pre_build_pouch.count,
	slurries.count
	]
  }

}
